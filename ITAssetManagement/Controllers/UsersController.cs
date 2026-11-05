using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ITAssetManagement.Models;

namespace ITAssetManagement.Controllers
{
    public class UsersController : Controller
    {
        private readonly ITAssetDBContext _context;

        public UsersController(ITAssetDBContext context)
        {
            _context = context;
        }

        // GET: Users
        public async Task<IActionResult> Index(string? search, string? role)
        {
            var query = _context.Users.AsQueryable();

            if (!string.IsNullOrEmpty(role) && role != "All")
            {
                query = query.Where(u => u.Role == role);
            }

            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower();
                query = query.Where(u =>
                    u.Username.ToLower().Contains(search) ||
                    u.FullName.ToLower().Contains(search) ||
                    (u.Email != null && u.Email.ToLower().Contains(search)) ||
                    (u.Department != null && u.Department.ToLower().Contains(search)) ||
                    (u.Position != null && u.Position.ToLower().Contains(search))
                );
            }

            ViewBag.CurrentSearch = search ?? "";
            ViewBag.CurrentRole = role ?? "All";
            ViewBag.TotalCount = await _context.Users.CountAsync();
            ViewBag.ActiveCount = await _context.Users.CountAsync(u => u.IsActive == true);
            ViewBag.Roles = await _context.Users
                .Where(u => u.Role != null)
                .Select(u => u.Role!)
                .Distinct()
                .ToListAsync();

            var list = await query.OrderBy(u => u.Id).ToListAsync();
            return View(list);
        }

        // GET: Users/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var user = await _context.Users.FirstOrDefaultAsync(m => m.Id == id);
            if (user == null) return NotFound();

            // Lấy danh sách thiết bị đang giao cho user (theo UserId hoặc theo Tên Owner)
            ViewBag.Devices = await _context.ThietBis
                .Where(t => t.UserId == user.Id || (!string.IsNullOrEmpty(t.Owner) && t.Owner == user.FullName))
                .ToListAsync();

            // Lấy danh sách license cấp cho user
            ViewBag.Licenses = await _context.Licenses
                .Where(l => l.UserId == user.Id || (!string.IsNullOrEmpty(l.Owner) && l.Owner == user.FullName))
                .ToListAsync();

            // Lấy danh sách phần mềm đã cài đặt
            ViewBag.Apps = await _context.ApplicationSoftwares
                .Where(a => a.UserId == user.Id || (!string.IsNullOrEmpty(a.Owner) && a.Owner == user.FullName))
                .ToListAsync();

            return View(user);
        }

        // GET: Users/Create
        public IActionResult Create()
        {
            var user = new User
            {
                Role = "User",
                IsActive = true,
                CreatedAt = DateTime.Now
            };
            return View(user);
        }

        // POST: Users/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(User user)
        {
            if (ModelState.IsValid)
            {
                if (!string.IsNullOrWhiteSpace(user.Username))
                {
                    user.Username = user.Username.Trim();
                    // Kiểm tra trùng username nếu có nhập
                    bool exists = await _context.Users.AnyAsync(u => u.Username != null && u.Username.ToLower() == user.Username.ToLower());
                    if (exists)
                    {
                        ModelState.AddModelError("Username", "Tên đăng nhập (Username) này đã tồn tại trong hệ thống!");
                        return View(user);
                    }
                }
                else
                {
                    user.Username = null;
                }

                user.FullName = user.FullName.Trim();
                user.CreatedAt = DateTime.Now;

                _context.Add(user);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = $"Đã thêm thành công nhân sự [{user.FullName}]" + (!string.IsNullOrEmpty(user.Username) ? $" ({user.Username})" : "") + "!";
                return RedirectToAction(nameof(Index));
            }
            return View(user);
        }

        // GET: Users/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();

            var user = await _context.Users.FindAsync(id);
            if (user == null) return NotFound();

            return View(user);
        }

        // POST: Users/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, User user)
        {
            if (id != user.Id) return NotFound();

            if (ModelState.IsValid)
            {
                if (!string.IsNullOrWhiteSpace(user.Username))
                {
                    user.Username = user.Username.Trim();
                    // Kiểm tra trùng username với user khác nếu có nhập
                    bool duplicate = await _context.Users.AnyAsync(u => u.Username != null && u.Username.ToLower() == user.Username.ToLower() && u.Id != id);
                    if (duplicate)
                    {
                        ModelState.AddModelError("Username", "Tên đăng nhập (Username) này đã được sử dụng bởi người khác!");
                        return View(user);
                    }
                }
                else
                {
                    user.Username = null;
                }

                try
                {
                    user.FullName = user.FullName.Trim();
                    _context.Update(user);
                    await _context.SaveChangesAsync();
                    TempData["SuccessMessage"] = $"Đã cập nhật thông tin nhân sự [{user.FullName}] thành công!";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!await _context.Users.AnyAsync(e => e.Id == user.Id))
                        return NotFound();
                    else
                        throw;
                }
                return RedirectToAction(nameof(Index));
            }
            return View(user);
        }

        // GET: Users/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();

            var user = await _context.Users.FirstOrDefaultAsync(m => m.Id == id);
            if (user == null) return NotFound();

            // Đếm số tài sản đang liên kết để cảnh báo
            ViewBag.DeviceCount = await _context.ThietBis.CountAsync(t => t.UserId == user.Id || t.Owner == user.FullName);
            ViewBag.LicenseCount = await _context.Licenses.CountAsync(l => l.UserId == user.Id || l.Owner == user.FullName);
            ViewBag.AppCount = await _context.ApplicationSoftwares.CountAsync(a => a.UserId == user.Id || a.Owner == user.FullName);

            return View(user);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user != null)
            {
                string name = user.FullName;
                _context.Users.Remove(user);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = $"Đã xóa nhân sự [{name}] khỏi danh sách hệ thống!";
            }

            return RedirectToAction(nameof(Index));
        }
    }
}
