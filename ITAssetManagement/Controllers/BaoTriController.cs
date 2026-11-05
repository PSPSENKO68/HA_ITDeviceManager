using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ITAssetManagement.Models;

namespace ITAssetManagement.Controllers
{
    public class BaoTriController : Controller
    {
        private readonly ITAssetDBContext _context;

        public BaoTriController(ITAssetDBContext context)
        {
            _context = context;
        }

        // GET: BaoTri
        public async Task<IActionResult> Index(string? viewMode, string? trangThai, string? search, int? month, int? year)
        {
            var query = _context.LichSuBaoTris.AsQueryable();

            if (!string.IsNullOrEmpty(trangThai) && trangThai != "All")
            {
                query = query.Where(b => b.TrangThai == trangThai);
            }

            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower();
                query = query.Where(b =>
                    (b.Model != null && b.Model.ToLower().Contains(search)) ||
                    (b.SerialNumber != null && b.SerialNumber.ToLower().Contains(search)) ||
                    (b.TieuDe != null && b.TieuDe.ToLower().Contains(search)) ||
                    (b.LoaiHanhDong != null && b.LoaiHanhDong.ToLower().Contains(search)) ||
                    (b.NguoiThucHien != null && b.NguoiThucHien.ToLower().Contains(search)) ||
                    (b.LinhKienThayThe != null && b.LinhKienThayThe.ToLower().Contains(search))
                );
            }

            // Stats
            ViewBag.CurrentViewMode = viewMode ?? "table";
            ViewBag.CurrentTrangThai = trangThai ?? "All";
            ViewBag.CurrentSearch = search ?? "";
            ViewBag.TotalCount = await _context.LichSuBaoTris.CountAsync();
            ViewBag.PlanCount = await _context.LichSuBaoTris.CountAsync(b => b.TrangThai == "Kế hoạch");
            ViewBag.InProgressCount = await _context.LichSuBaoTris.CountAsync(b => b.TrangThai == "Đang xử lý");
            ViewBag.DoneCount = await _context.LichSuBaoTris.CountAsync(b => b.TrangThai == "Hoàn thành");
            ViewBag.TotalCost = await _context.LichSuBaoTris.SumAsync(b => b.ChiPhi ?? 0m);

            // Calendar month/year handling
            var now = DateTime.Now;
            int selMonth = month ?? now.Month;
            int selYear = year ?? now.Year;
            if (selMonth < 1) { selMonth = 12; selYear--; }
            if (selMonth > 12) { selMonth = 1; selYear++; }

            ViewBag.SelectedMonth = selMonth;
            ViewBag.SelectedYear = selYear;

            // Fetch all records for the calendar view or table view
            var list = await query.OrderByDescending(b => b.Id).ToListAsync();

            // Pass all records for calendar mapping
            ViewBag.AllCalendarRecords = await _context.LichSuBaoTris.ToListAsync();

            return View(list);
        }

        // GET: BaoTri/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var baoTri = await _context.LichSuBaoTris.FirstOrDefaultAsync(m => m.Id == id);
            if (baoTri == null) return NotFound();

            // Load associated device info
            ThietBi? device = null;
            if (baoTri.ThietBiId != null)
            {
                device = await _context.ThietBis.FirstOrDefaultAsync(t => t.Id == baoTri.ThietBiId);
            }
            else if (!string.IsNullOrEmpty(baoTri.SerialNumber))
            {
                device = await _context.ThietBis.FirstOrDefaultAsync(t => t.SerialNumber == baoTri.SerialNumber);
            }

            ViewBag.Device = device;

            // If device has linked user, load user info
            if (device != null && device.UserId != null)
            {
                ViewBag.DeviceUser = await _context.Users.FirstOrDefaultAsync(u => u.Id == device.UserId);
            }

            return View(baoTri);
        }

        // GET: BaoTri/Create
        public async Task<IActionResult> Create(int? thietBiId, string? serialNumber)
        {
            var baoTri = new LichSuBaoTri
            {
                LoaiHanhDong = "Bảo trì định kỳ",
                TrangThai = "Kế hoạch",
                NgayDuKien = DateTime.Now.ToString("yyyy-MM-dd"),
                ChiPhi = 0m
            };

            if (thietBiId.HasValue)
            {
                var device = await _context.ThietBis.FirstOrDefaultAsync(t => t.Id == thietBiId.Value);
                if (device != null)
                {
                    baoTri.ThietBiId = device.Id;
                    baoTri.SerialNumber = device.SerialNumber;
                    baoTri.Model = device.Model;
                    baoTri.TieuDe = $"Bảo trì {device.Model}";
                }
            }
            else if (!string.IsNullOrEmpty(serialNumber))
            {
                var device = await _context.ThietBis.FirstOrDefaultAsync(t => t.SerialNumber == serialNumber);
                if (device != null)
                {
                    baoTri.ThietBiId = device.Id;
                    baoTri.SerialNumber = device.SerialNumber;
                    baoTri.Model = device.Model;
                    baoTri.TieuDe = $"Bảo trì {device.Model}";
                }
            }

            ViewBag.Devices = await _context.ThietBis
                .Where(t => (!string.IsNullOrEmpty(t.Model) && t.Model.Trim() != "") || (!string.IsNullOrEmpty(t.SerialNumber) && t.SerialNumber.Trim() != ""))
                .OrderBy(t => t.Model)
                .Select(t => new { 
                    t.Id, 
                    Model = !string.IsNullOrEmpty(t.Model) ? t.Model.Trim() : (t.NhomThietBi ?? "Thiết bị #" + t.Id), 
                    SerialNumber = t.SerialNumber ?? "", 
                    NhomThietBi = t.NhomThietBi ?? "Máy tính", 
                    Owner = !string.IsNullOrEmpty(t.Owner) ? t.Owner.Trim() : "Kho IT",
                    PhongBan = t.PhongBan ?? ""
                })
                .ToListAsync();

            ViewBag.Departments = await _context.ThietBis
                .Where(t => !string.IsNullOrEmpty(t.PhongBan) && t.PhongBan.Trim() != "")
                .Select(t => t.PhongBan!.Trim())
                .Distinct()
                .OrderBy(d => d)
                .ToListAsync();

            return View(baoTri);
        }

        // POST: BaoTri/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(LichSuBaoTri baoTri)
        {
            if (string.IsNullOrWhiteSpace(baoTri.LoaiHanhDong))
            {
                baoTri.LoaiHanhDong = "Bảo trì định kỳ";
            }

            // Sync device info if device selected
            if (baoTri.ThietBiId.HasValue)
            {
                var device = await _context.ThietBis.FirstOrDefaultAsync(t => t.Id == baoTri.ThietBiId.Value);
                if (device != null)
                {
                    if (string.IsNullOrWhiteSpace(baoTri.SerialNumber)) baoTri.SerialNumber = device.SerialNumber;
                    if (string.IsNullOrWhiteSpace(baoTri.Model)) baoTri.Model = device.Model;
                }
            }

            if (ModelState.IsValid)
            {
                _context.Add(baoTri);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Tạo phiếu bảo trì / sửa chữa thành công!";
                return RedirectToAction(nameof(Index));
            }

            ViewBag.Devices = await _context.ThietBis
                .Where(t => (!string.IsNullOrEmpty(t.Model) && t.Model.Trim() != "") || (!string.IsNullOrEmpty(t.SerialNumber) && t.SerialNumber.Trim() != ""))
                .OrderBy(t => t.Model)
                .Select(t => new { 
                    t.Id, 
                    Model = !string.IsNullOrEmpty(t.Model) ? t.Model.Trim() : (t.NhomThietBi ?? "Thiết bị #" + t.Id), 
                    SerialNumber = t.SerialNumber ?? "", 
                    NhomThietBi = t.NhomThietBi ?? "Máy tính", 
                    Owner = !string.IsNullOrEmpty(t.Owner) ? t.Owner.Trim() : "Kho IT",
                    PhongBan = t.PhongBan ?? ""
                })
                .ToListAsync();

            ViewBag.Departments = await _context.ThietBis
                .Where(t => !string.IsNullOrEmpty(t.PhongBan) && t.PhongBan.Trim() != "")
                .Select(t => t.PhongBan!.Trim())
                .Distinct()
                .OrderBy(d => d)
                .ToListAsync();

            return View(baoTri);
        }

        // POST: BaoTri/CreateBatch
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateBatch(List<int> deviceIds, string tieuDe, string loaiHanhDong, string ngayDuKien, string? nguoiThucHien, string? chiTiet, string? trangThai)
        {
            if (deviceIds == null || !deviceIds.Any())
            {
                TempData["ErrorMessage"] = "Vui lòng chọn ít nhất 1 thiết bị để lập kế hoạch bảo trì hàng loạt!";
                return RedirectToAction(nameof(Create));
            }

            var devices = await _context.ThietBis
                .Where(t => deviceIds.Contains(t.Id))
                .ToListAsync();

            var batchRecords = new List<LichSuBaoTri>();
            foreach (var dev in devices)
            {
                batchRecords.Add(new LichSuBaoTri
                {
                    ThietBiId = dev.Id,
                    Model = dev.Model ?? dev.NhomThietBi ?? "Thiết bị IT",
                    SerialNumber = dev.SerialNumber,
                    TieuDe = string.IsNullOrWhiteSpace(tieuDe) ? $"Bảo trì {dev.Model}" : tieuDe,
                    LoaiHanhDong = string.IsNullOrWhiteSpace(loaiHanhDong) ? "Bảo trì định kỳ" : loaiHanhDong,
                    TrangThai = string.IsNullOrWhiteSpace(trangThai) ? "Kế hoạch" : trangThai,
                    NgayDuKien = string.IsNullOrWhiteSpace(ngayDuKien) ? DateTime.Now.ToString("yyyy-MM-dd") : ngayDuKien,
                    NguoiThucHien = nguoiThucHien,
                    ChiTiet = chiTiet,
                    ChiPhi = 0m
                });
            }

            _context.LichSuBaoTris.AddRange(batchRecords);
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = $"Đã lập kế hoạch bảo trì thành công cho {batchRecords.Count} thiết bị!";
            return RedirectToAction(nameof(Index));
        }

        // GET: BaoTri/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();

            var baoTri = await _context.LichSuBaoTris.FindAsync(id);
            if (baoTri == null) return NotFound();

            ViewBag.Devices = await _context.ThietBis
                .OrderBy(t => t.Model)
                .Select(t => new { t.Id, t.Model, t.SerialNumber, t.NhomThietBi, t.Owner })
                .ToListAsync();

            return View(baoTri);
        }

        // POST: BaoTri/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, LichSuBaoTri baoTri)
        {
            if (id != baoTri.Id) return NotFound();

            if (string.IsNullOrWhiteSpace(baoTri.LoaiHanhDong))
            {
                baoTri.LoaiHanhDong = "Bảo trì định kỳ";
            }

            if (baoTri.ThietBiId.HasValue)
            {
                var device = await _context.ThietBis.FirstOrDefaultAsync(t => t.Id == baoTri.ThietBiId.Value);
                if (device != null)
                {
                    if (string.IsNullOrWhiteSpace(baoTri.SerialNumber)) baoTri.SerialNumber = device.SerialNumber;
                    if (string.IsNullOrWhiteSpace(baoTri.Model)) baoTri.Model = device.Model;
                }
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(baoTri);
                    await _context.SaveChangesAsync();
                    TempData["SuccessMessage"] = "Cập nhật thông tin bảo trì thành công!";
                    return RedirectToAction(nameof(Index));
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!await _context.LichSuBaoTris.AnyAsync(e => e.Id == baoTri.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
            }

            ViewBag.Devices = await _context.ThietBis
                .OrderBy(t => t.Model)
                .Select(t => new { t.Id, t.Model, t.SerialNumber, t.NhomThietBi, t.Owner })
                .ToListAsync();

            return View(baoTri);
        }

        // GET: BaoTri/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();

            var baoTri = await _context.LichSuBaoTris.FirstOrDefaultAsync(m => m.Id == id);
            if (baoTri == null) return NotFound();

            return View(baoTri);
        }

        // POST: BaoTri/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var baoTri = await _context.LichSuBaoTris.FindAsync(id);
            if (baoTri != null)
            {
                _context.LichSuBaoTris.Remove(baoTri);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Đã xóa bản ghi bảo trì thành công!";
            }
            return RedirectToAction(nameof(Index));
        }

        // POST: BaoTri/QuickComplete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> QuickComplete(int id, string? returnUrl)
        {
            var baoTri = await _context.LichSuBaoTris.FindAsync(id);
            if (baoTri != null)
            {
                baoTri.TrangThai = "Hoàn thành";
                if (string.IsNullOrWhiteSpace(baoTri.NgayThucHien))
                {
                    baoTri.NgayThucHien = DateTime.Now.ToString("yyyy-MM-dd");
                }
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = $"Đã hoàn thành bảo trì cho '{baoTri.Model ?? baoTri.TieuDe}'!";
            }

            if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction(nameof(Index));
        }
    }
}
