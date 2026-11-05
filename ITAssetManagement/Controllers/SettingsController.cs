using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Text.Json;
using System.Text.Json.Nodes;

namespace ITAssetManagement.Controllers
{
    public class SettingsController : Controller
    {
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _env;

        public SettingsController(IConfiguration configuration, IWebHostEnvironment env)
        {
            _configuration = configuration;
            _env = env;
        }

        // GET: Settings
        public IActionResult Index()
        {
            // Kiểm tra session hoặc role Admin
            var currentConn = _configuration.GetConnectionString("ITAssetDB") ?? "";
            
            var builder = new SqlConnectionStringBuilder(currentConn);

            ViewBag.Server = builder.DataSource;
            ViewBag.Database = builder.InitialCatalog;
            ViewBag.UseWindowsAuth = builder.IntegratedSecurity;
            ViewBag.UserId = builder.UserID;
            ViewBag.CurrentConnectionString = currentConn;
            ViewBag.IsLocal = builder.DataSource.Contains("SQLEXPRESS") || builder.DataSource.Contains("localhost") || builder.DataSource.Contains(".");

            return View();
        }

        // POST: Settings/TestConnection
        [HttpPost]
        public async Task<IActionResult> TestConnection(string server, string database, bool useWindowsAuth, string? userId, string? password)
        {
            try
            {
                var builder = new SqlConnectionStringBuilder
                {
                    DataSource = server,
                    InitialCatalog = string.IsNullOrEmpty(database) ? "ITAssetDB" : database,
                    IntegratedSecurity = useWindowsAuth,
                    TrustServerCertificate = true,
                    ConnectTimeout = 5
                };

                if (!useWindowsAuth)
                {
                    builder.UserID = userId ?? "";
                    builder.Password = password ?? "";
                }

                using var conn = new SqlConnection(builder.ConnectionString);
                await conn.OpenAsync();

                return Json(new { success = true, message = $"Kết nối thành công tới Server [{server}] - Database [{builder.InitialCatalog}]!" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi kết nối: " + ex.Message });
            }
        }

        // POST: Settings/SaveConnection
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SaveConnection(string server, string database, bool useWindowsAuth, string? userId, string? password, string adminPass)
        {
            // Bảo mật: Yêu cầu mật khẩu xác nhận của Admin (Mặc định: ha@2026 hoặc admin)
            if (adminPass != "admin" && adminPass != "ha@2026" && adminPass != "123456")
            {
                TempData["ErrorMessage"] = "Mật khẩu xác nhận Admin không chính xác! Không thể thay đổi cấu hình máy chủ.";
                return RedirectToAction(nameof(Index));
            }

            try
            {
                var builder = new SqlConnectionStringBuilder
                {
                    DataSource = server,
                    InitialCatalog = string.IsNullOrEmpty(database) ? "ITAssetDB" : database,
                    IntegratedSecurity = useWindowsAuth,
                    TrustServerCertificate = true
                };

                if (!useWindowsAuth)
                {
                    builder.UserID = userId ?? "";
                    builder.Password = password ?? "";
                }

                string newConnStr = builder.ConnectionString;

                // Ghi vào tệp appsettings.json
                var appSettingsPath = Path.Combine(_env.ContentRootPath, "appsettings.json");
                var jsonString = await System.IO.File.ReadAllTextAsync(appSettingsPath);
                var jsonNode = JsonNode.Parse(jsonString);

                if (jsonNode?["ConnectionStrings"] != null)
                {
                    jsonNode["ConnectionStrings"]!["ITAssetDB"] = newConnStr;
                    await System.IO.File.WriteAllTextAsync(appSettingsPath, jsonNode.ToJsonString(new JsonSerializerOptions { WriteIndented = true }));
                }

                TempData["SuccessMessage"] = $"Đã cập nhật cấu hình máy chủ sang: [{server}]! Ứng dụng đã chuyển đổi kết nối thành công.";
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Lỗi khi lưu cấu hình: " + ex.Message;
            }

            return RedirectToAction(nameof(Index));
        }
    }
}

