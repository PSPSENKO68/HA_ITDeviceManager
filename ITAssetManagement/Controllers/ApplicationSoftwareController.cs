using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ITAssetManagement.Models;

namespace ITAssetManagement.Controllers
{
    public class ApplicationSoftwareController : Controller
    {
        private readonly ITAssetDBContext _context;

        public ApplicationSoftwareController(ITAssetDBContext context)
        {
            _context = context;
        }

        // GET: ApplicationSoftware
        public async Task<IActionResult> Index(string? search, string? loaiPhanMem)
        {
            var query = _context.ApplicationSoftwares.AsQueryable();

            if (!string.IsNullOrEmpty(loaiPhanMem) && loaiPhanMem != "All")
            {
                query = query.Where(a => a.LoaiPhanMem == loaiPhanMem);
            }

            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower();
                query = query.Where(a =>
                    (a.Owner != null && a.Owner.ToLower().Contains(search)) ||
                    (a.May != null && a.May.ToLower().Contains(search)) ||
                    (a.UngDung != null && a.UngDung.ToLower().Contains(search)) ||
                    (a.PhongBan != null && a.PhongBan.ToLower().Contains(search)) ||
                    (a.LyDo != null && a.LyDo.ToLower().Contains(search)) ||
                    (a.GhiChu != null && a.GhiChu.ToLower().Contains(search))
                );
            }

            var list = await query.OrderBy(a => a.Owner).ThenBy(a => a.UngDung).ToListAsync();

            // Nhóm theo User (Owner, Phòng Ban, Tên Máy)
            var grouped = list
                .GroupBy(a => new {
                    Owner = string.IsNullOrWhiteSpace(a.Owner) ? "Chưa gán người dùng" : a.Owner.Trim(),
                    PhongBan = a.PhongBan ?? "",
                    May = a.May ?? "",
                    UserId = a.UserId
                })
                .Select(g => new UserAppGroupViewModel
                {
                    UserId = g.Key.UserId,
                    Owner = g.Key.Owner,
                    PhongBan = g.Key.PhongBan,
                    May = g.Key.May,
                    Apps = g.ToList()
                })
                .OrderBy(g => g.Owner)
                .ToList();

            ViewBag.CurrentSearch = search ?? "";
            ViewBag.CurrentLoai = loaiPhanMem ?? "All";
            ViewBag.TotalCount = list.Count;
            ViewBag.TotalUsers = grouped.Count;
            ViewBag.LicensedCount = list.Count(a => a.LoaiPhanMem != null && (a.LoaiPhanMem.Contains("quyền") || a.LoaiPhanMem.ToLower().Contains("license")));
            ViewBag.FreewareCount = list.Count(a => a.LoaiPhanMem != null && (a.LoaiPhanMem.ToLower().Contains("miễn phí") || a.LoaiPhanMem.ToLower().Contains("free")));
            ViewBag.ActiveCount = list.Count(a => a.TrangThai == null || a.TrangThai.Contains("sử dụng") || a.TrangThai.ToLower().Contains("active"));

            ViewBag.AllRawList = list;
            return View(grouped);
        }

        // GET: ApplicationSoftware/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var app = await _context.ApplicationSoftwares.FirstOrDefaultAsync(m => m.Id == id);
            if (app == null) return NotFound();

            // Lấy thông tin user nếu có
            if (app.UserId != null)
            {
                ViewBag.User = await _context.Users.FirstOrDefaultAsync(u => u.Id == app.UserId);
            }

            return View(app);
        }

        // GET: ApplicationSoftware/Create
        public async Task<IActionResult> Create(int? userId, string? owner, string? phongBan, string? may)
        {
            var app = new ApplicationSoftware
            {
                UserId = userId,
                Owner = owner,
                PhongBan = phongBan,
                May = may,
                LoaiPhanMem = "Bản quyền",
                TrangThai = "Đang sử dụng",
                NgayCaiDat = DateTime.Now.ToString("MM/dd/yyyy")
            };

            // Nếu có userId mà chưa có thông tin tên phòng ban, lấy từ DB
            if (userId != null && string.IsNullOrEmpty(owner))
            {
                var user = await _context.Users.FirstOrDefaultAsync(u => u.Id == userId);
                if (user != null)
                {
                    app.Owner = user.FullName;
                    app.PhongBan = user.Department;
                }
            }

            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            ViewBag.Devices = await _context.ThietBis.Where(t => !string.IsNullOrEmpty(t.Model)).Select(t => t.Model!).Distinct().ToListAsync();

            return View(app);
        }

        // POST: ApplicationSoftware/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(ApplicationSoftware app)
        {
            if (ModelState.IsValid)
            {
                // Nếu chọn user thì gán tên Owner & PhongBan tương ứng nếu chưa có
                if (app.UserId != null)
                {
                    var user = await _context.Users.FirstOrDefaultAsync(u => u.Id == app.UserId);
                    if (user != null)
                    {
                        if (string.IsNullOrEmpty(app.Owner)) app.Owner = user.FullName;
                        if (string.IsNullOrEmpty(app.PhongBan)) app.PhongBan = user.Department;
                    }
                }

                _context.Add(app);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = $"Đã thêm thành công phần mềm [{app.UngDung}] cho [{app.Owner}]!";
                return RedirectToAction(nameof(Index));
            }

            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            return View(app);
        }

        // GET: ApplicationSoftware/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();

            var app = await _context.ApplicationSoftwares.FindAsync(id);
            if (app == null) return NotFound();

            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            return View(app);
        }

        // POST: ApplicationSoftware/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, ApplicationSoftware app)
        {
            if (id != app.Id) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(app);
                    await _context.SaveChangesAsync();
                    TempData["SuccessMessage"] = $"Đã cập nhật thông tin phần mềm [{app.UngDung}]!";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!await _context.ApplicationSoftwares.AnyAsync(e => e.Id == app.Id))
                        return NotFound();
                    else
                        throw;
                }
                return RedirectToAction(nameof(Index));
            }

            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            return View(app);
        }

        // GET: ApplicationSoftware/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();

            var app = await _context.ApplicationSoftwares.FirstOrDefaultAsync(m => m.Id == id);
            if (app == null) return NotFound();

            return View(app);
        }

        // POST: ApplicationSoftware/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var app = await _context.ApplicationSoftwares.FindAsync(id);
            if (app != null)
            {
                string appName = app.UngDung ?? "Phần mềm";
                string ownerName = app.Owner ?? "Người dùng";
                _context.ApplicationSoftwares.Remove(app);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = $"Đã xóa phần mềm [{appName}] của [{ownerName}]!";
            }

            return RedirectToAction(nameof(Index));
        }
    }
}
