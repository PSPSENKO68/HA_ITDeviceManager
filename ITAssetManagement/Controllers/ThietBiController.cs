using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ITAssetManagement.Models;

namespace ITAssetManagement.Controllers
{
    public class ThietBiController : Controller
    {
        private readonly ITAssetDBContext _context;

        public ThietBiController(ITAssetDBContext context)
        {
            _context = context;
        }

        // GET: ThietBi
        public async Task<IActionResult> Index(string? nhomThietBi, string? searchTerm)
        {
            var query = _context.ThietBis.AsQueryable();

            if (!string.IsNullOrEmpty(nhomThietBi) && nhomThietBi != "All")
            {
                query = query.Where(t => t.NhomThietBi == nhomThietBi);
            }

            if (!string.IsNullOrEmpty(searchTerm))
            {
                searchTerm = searchTerm.Trim().ToLower();
                query = query.Where(t => 
                    (t.Model != null && t.Model.ToLower().Contains(searchTerm)) ||
                    (t.SerialNumber != null && t.SerialNumber.ToLower().Contains(searchTerm)) ||
                    (t.Owner != null && t.Owner.ToLower().Contains(searchTerm)) ||
                    (t.PhongBan != null && t.PhongBan.ToLower().Contains(searchTerm)) ||
                    (t.Ipaddress != null && t.Ipaddress.ToLower().Contains(searchTerm))
                );
            }

            ViewBag.CurrentNhom = nhomThietBi ?? "All";
            ViewBag.SearchTerm = searchTerm ?? "";
            ViewBag.TotalAll = await _context.ThietBis.CountAsync();

            // Thống kê động theo nhóm thực tế trong DB
            ViewBag.GroupCounts = await _context.ThietBis
                .GroupBy(t => t.NhomThietBi)
                .Select(g => new KeyValuePair<string, int>(g.Key, g.Count()))
                .ToListAsync();

            var list = await query.OrderBy(t => t.Id).ToListAsync();
            return View(list);
        }

        // GET: ThietBi/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var thietBi = await _context.ThietBis.FirstOrDefaultAsync(m => m.Id == id);
            if (thietBi == null) return NotFound();

            // Lấy thông tin User được gán (nếu có)
            if (thietBi.UserId != null)
            {
                ViewBag.LinkedUser = await _context.Users.FirstOrDefaultAsync(u => u.Id == thietBi.UserId);
            }

            // Lấy lịch sử & kế hoạch bảo trì từ bảng gộp LichSuBaoTri
            ViewBag.BaoTriList = await _context.LichSuBaoTris
                .Where(b => (thietBi.SerialNumber != null && b.SerialNumber == thietBi.SerialNumber) || b.ThietBiId == thietBi.Id)
                .ToListAsync();

            // Lấy lịch sử điều chuyển
            ViewBag.DieuChuyenList = await _context.LichSuDieuChuyens
                .Where(d => (thietBi.SerialNumber != null && d.ThietBiSerial == thietBi.SerialNumber) || d.ThietBiId == thietBi.Id)
                .ToListAsync();

            return View(thietBi);
        }

        // GET: ThietBi/Create
        public async Task<IActionResult> Create()
        {
            ViewBag.ExistingGroups = await _context.ThietBis.Select(t => t.NhomThietBi).Distinct().ToListAsync();
            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            return View();
        }

        // POST: ThietBi/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(ThietBi thietBi)
        {
            if (ModelState.IsValid)
            {
                if (thietBi.UserId != null)
                {
                    var user = await _context.Users.FirstOrDefaultAsync(u => u.Id == thietBi.UserId);
                    if (user != null)
                    {
                        if (string.IsNullOrEmpty(thietBi.Owner)) thietBi.Owner = user.FullName;
                        if (string.IsNullOrEmpty(thietBi.PhongBan)) thietBi.PhongBan = user.Department;
                    }
                }
                else if (!string.IsNullOrEmpty(thietBi.Owner))
                {
                    var matchedUser = await _context.Users.FirstOrDefaultAsync(u => u.FullName.ToLower() == thietBi.Owner.Trim().ToLower());
                    if (matchedUser != null)
                    {
                        thietBi.UserId = matchedUser.Id;
                        if (string.IsNullOrEmpty(thietBi.PhongBan)) thietBi.PhongBan = matchedUser.Department;
                    }
                }

                // LOGIC NHẬP KHO: Nếu không gán cho nhân sự nào, mặc định đưa vào Kho IT sẵn sàng cấp phát
                bool isNhapKho = string.IsNullOrWhiteSpace(thietBi.Owner) || thietBi.Owner.Trim().ToLower() == "kho it";
                if (isNhapKho)
                {
                    thietBi.Owner = "Kho IT";
                    thietBi.UserId = null;
                    if (string.IsNullOrWhiteSpace(thietBi.PhongBan))
                    {
                        thietBi.PhongBan = "IT";
                    }
                }

                thietBi.NgayTao = DateTime.Now;
                _context.Add(thietBi);
                await _context.SaveChangesAsync();

                // Tự động ghi nhận lịch sử điều chuyển đầu tiên: Nhập kho mới vào hệ thống
                var history = new LichSuDieuChuyen
                {
                    ThietBiId = thietBi.Id,
                    ThietBiSerial = thietBi.SerialNumber,
                    LoaiHanhDong = isNhapKho ? "Nhập kho mới" : "Cấp phát mới",
                    Ngay = !string.IsNullOrWhiteSpace(thietBi.ThoiGianDauTu) ? thietBi.ThoiGianDauTu : DateTime.Today.ToString("MM/dd/yyyy"),
                    NguoiThucHien = "IT Admin",
                    OwnerCu = "Nhà cung cấp / Mua mới",
                    PhongBanCu = "Nhà cung cấp",
                    OwnerMoi = thietBi.Owner,
                    PhongBanMoi = thietBi.PhongBan,
                    ChiTiet = isNhapKho 
                        ? $"Ghi nhận tài sản mới vào Kho IT: {thietBi.Model} (SN: {thietBi.SerialNumber})" 
                        : $"Nhập thiết bị mới và cấp phát trực tiếp cho {thietBi.Owner} ({thietBi.PhongBan})",
                    NgayTao = DateTime.Now
                };
                _context.LichSuDieuChuyens.Add(history);
                await _context.SaveChangesAsync();

                if (isNhapKho)
                {
                    TempData["SuccessMessage"] = $"Đã ghi nhận tài sản [{thietBi.Model}] vào Kho IT thành công, sẵn sàng cấp phát!";
                }
                else
                {
                    TempData["SuccessMessage"] = $"Đã thêm thiết bị [{thietBi.Model}] và gán cho [{thietBi.Owner}] thành công!";
                }

                return RedirectToAction(nameof(Index), new { nhomThietBi = thietBi.NhomThietBi });
            }
            ViewBag.ExistingGroups = await _context.ThietBis.Select(t => t.NhomThietBi).Distinct().ToListAsync();
            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            return View(thietBi);
        }

        // GET: ThietBi/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();

            var thietBi = await _context.ThietBis.FindAsync(id);
            if (thietBi == null) return NotFound();

            if (thietBi.UserId == null && !string.IsNullOrEmpty(thietBi.Owner))
            {
                var matchedUser = await _context.Users.FirstOrDefaultAsync(u => u.FullName.ToLower() == thietBi.Owner.Trim().ToLower());
                if (matchedUser != null)
                {
                    thietBi.UserId = matchedUser.Id;
                }
            }

            ViewBag.ExistingGroups = await _context.ThietBis.Select(t => t.NhomThietBi).Distinct().ToListAsync();
            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            return View(thietBi);
        }

        // POST: ThietBi/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, ThietBi thietBi)
        {
            if (id != thietBi.Id) return NotFound();

            if (ModelState.IsValid)
            {
                if (thietBi.UserId != null)
                {
                    var user = await _context.Users.FirstOrDefaultAsync(u => u.Id == thietBi.UserId);
                    if (user != null)
                    {
                        if (string.IsNullOrEmpty(thietBi.Owner)) thietBi.Owner = user.FullName;
                        if (string.IsNullOrEmpty(thietBi.PhongBan)) thietBi.PhongBan = user.Department;
                    }
                }

                try
                {
                    thietBi.NgayCapNhat = DateTime.Now;
                    _context.Update(thietBi);
                    await _context.SaveChangesAsync();
                    TempData["SuccessMessage"] = "Cập nhật thông tin thiết bị thành công!";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ThietBiExists(thietBi.Id)) return NotFound();
                    else throw;
                }
                return RedirectToAction(nameof(Index), new { nhomThietBi = thietBi.NhomThietBi });
            }
            ViewBag.ExistingGroups = await _context.ThietBis.Select(t => t.NhomThietBi).Distinct().ToListAsync();
            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            return View(thietBi);
        }

        // GET: ThietBi/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();

            var thietBi = await _context.ThietBis.FirstOrDefaultAsync(m => m.Id == id);
            if (thietBi == null) return NotFound();

            return View(thietBi);
        }

        // POST: ThietBi/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var thietBi = await _context.ThietBis.FindAsync(id);
            if (thietBi != null)
            {
                _context.ThietBis.Remove(thietBi);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Đã xóa thiết bị thành công!";
            }
            return RedirectToAction(nameof(Index));
        }

        private bool ThietBiExists(int id)
        {
            return _context.ThietBis.Any(e => e.Id == id);
        }
    }
}
