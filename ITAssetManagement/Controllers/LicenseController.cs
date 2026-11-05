using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ITAssetManagement.Models;

namespace ITAssetManagement.Controllers
{
    public class LicenseController : Controller
    {
        private readonly ITAssetDBContext _context;

        public LicenseController(ITAssetDBContext context)
        {
            _context = context;
        }

        // GET: License
        public async Task<IActionResult> Index(string? search, string? kichHoat, string? account)
        {
            // Thống kê toàn bộ tỉ lệ sử dụng ActiveAccount (Tối đa 10 máy/tài khoản)
            var activeAccountLicenses = await _context.Licenses
                .Where(l => !string.IsNullOrEmpty(l.ActiveAccount) && l.ActiveAccount.Trim() != "" && l.ActiveAccount.ToLower() != "n/a" && l.ActiveAccount.ToLower() != "none")
                .ToListAsync();

            var accountStats = activeAccountLicenses
                .GroupBy(l => l.ActiveAccount!.Trim())
                .Select(g => new LicenseUsageStat
                {
                    ActiveAccount = g.Key,
                    Count = g.Count(),
                    Limit = 10,
                    Owners = g.Select(x => x.Owner).Where(o => !string.IsNullOrEmpty(o)).Distinct().ToList()!,
                    ComputerNames = g.Select(x => x.ComputerName).Where(c => !string.IsNullOrEmpty(c)).Distinct().ToList()!
                })
                .OrderByDescending(s => s.Count)
                .ThenBy(s => s.ActiveAccount)
                .ToList();

            ViewBag.AccountStats = accountStats;
            ViewBag.TotalAccounts = accountStats.Count;
            ViewBag.OverLimitCount = accountStats.Count(s => s.IsOverLimit);
            ViewBag.CurrentAccount = account ?? "";

            var query = _context.Licenses.AsQueryable();

            if (!string.IsNullOrEmpty(account))
            {
                query = query.Where(l => l.ActiveAccount == account);
            }

            if (!string.IsNullOrEmpty(kichHoat) && kichHoat != "All")
            {
                query = query.Where(l => l.KichHoat == kichHoat);
            }

            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower();
                query = query.Where(l =>
                    (l.Owner != null && l.Owner.ToLower().Contains(search)) ||
                    (l.ComputerName != null && l.ComputerName.ToLower().Contains(search)) ||
                    (l.GlobalDomain != null && l.GlobalDomain.ToLower().Contains(search)) ||
                    (l.LocalDomain != null && l.LocalDomain.ToLower().Contains(search)) ||
                    (l.ActiveAccount != null && l.ActiveAccount.ToLower().Contains(search)) ||
                    (l.PhongBan != null && l.PhongBan.ToLower().Contains(search))
                );
            }

            ViewBag.CurrentSearch = search ?? "";
            ViewBag.CurrentKichHoat = kichHoat ?? "All";
            ViewBag.TotalCount = await _context.Licenses.CountAsync();
            ViewBag.EnabledCount = await _context.Licenses.CountAsync(l => l.KichHoat == "Enabled" || l.KichHoat == "Kích hoạt" || l.KichHoat == "Active");
            ViewBag.DisabledCount = await _context.Licenses.CountAsync(l => l.KichHoat == "Disabled" || l.KichHoat == "Đã khóa" || l.KichHoat == "Hết hạn");

            var list = await query.OrderBy(l => l.Stt).ThenBy(l => l.Id).ToListAsync();
            return View(list);
        }

        // GET: License/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var license = await _context.Licenses.FirstOrDefaultAsync(m => m.Id == id);
            if (license == null) return NotFound();

            if (license.UserId != null)
            {
                ViewBag.User = await _context.Users.FirstOrDefaultAsync(u => u.Id == license.UserId);
            }

            // Tìm thiết bị liên quan nếu có ComputerName
            if (!string.IsNullOrEmpty(license.ComputerName))
            {
                ViewBag.Device = await _context.ThietBis.FirstOrDefaultAsync(t => 
                    t.Model == license.ComputerName || 
                    t.SerialNumber == license.ComputerName || 
                    (t.Alias != null && t.Alias == license.ComputerName));
            }

            return View(license);
        }

        // GET: License/Create
        public async Task<IActionResult> Create(int? userId)
        {
            var license = new License
            {
                UserId = userId,
                KichHoat = "Enabled",
                NgayCapNhat = DateTime.Now
            };

            if (userId != null)
            {
                var user = await _context.Users.FirstOrDefaultAsync(u => u.Id == userId);
                if (user != null)
                {
                    license.Owner = user.FullName;
                    license.PhongBan = user.Department;
                    license.GlobalDomain = user.Email;
                }
            }

            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            ViewBag.Devices = await _context.ThietBis.Where(t => !string.IsNullOrEmpty(t.Model)).Select(t => t.Model!).Distinct().ToListAsync();

            return View(license);
        }

        // POST: License/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(License license)
        {
            if (ModelState.IsValid)
            {
                if (license.UserId != null)
                {
                    var user = await _context.Users.FirstOrDefaultAsync(u => u.Id == license.UserId);
                    if (user != null)
                    {
                        if (string.IsNullOrEmpty(license.Owner)) license.Owner = user.FullName;
                        if (string.IsNullOrEmpty(license.PhongBan)) license.PhongBan = user.Department;
                    }
                }

                license.NgayCapNhat = DateTime.Now;
                _context.Add(license);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = $"Đã cấp thành công License cho [{license.Owner}] ({license.GlobalDomain})!";
                return RedirectToAction(nameof(Index));
            }

            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            return View(license);
        }

        // GET: License/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();

            var license = await _context.Licenses.FindAsync(id);
            if (license == null) return NotFound();

            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            ViewBag.Devices = await _context.ThietBis.Where(t => !string.IsNullOrEmpty(t.Model)).Select(t => t.Model!).Distinct().ToListAsync();

            return View(license);
        }

        // POST: License/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, License license)
        {
            if (id != license.Id) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    license.NgayCapNhat = DateTime.Now;
                    _context.Update(license);
                    await _context.SaveChangesAsync();
                    TempData["SuccessMessage"] = $"Đã cập nhật thông tin License cho [{license.Owner}] thành công!";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!await _context.Licenses.AnyAsync(e => e.Id == license.Id))
                        return NotFound();
                    else
                        throw;
                }
                return RedirectToAction(nameof(Index));
            }

            ViewBag.Users = await _context.Users.OrderBy(u => u.FullName).ToListAsync();
            return View(license);
        }

        // GET: License/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();

            var license = await _context.Licenses.FirstOrDefaultAsync(m => m.Id == id);
            if (license == null) return NotFound();

            return View(license);
        }

        // POST: License/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var license = await _context.Licenses.FindAsync(id);
            if (license != null)
            {
                string owner = license.Owner ?? "Chưa gán";
                string acc = license.GlobalDomain ?? license.ActiveAccount ?? "License";
                _context.Licenses.Remove(license);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = $"Đã xóa License [{acc}] của [{owner}]!";
            }

            return RedirectToAction(nameof(Index));
        }
    }
}
