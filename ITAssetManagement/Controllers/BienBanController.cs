using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.IO.Compression;
using System.Security;
using ITAssetManagement.Models;

namespace ITAssetManagement.Controllers
{
    public class BienBanController : Controller
    {
        private readonly ITAssetDBContext _context;
        private readonly IWebHostEnvironment _env;

        public BienBanController(ITAssetDBContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        // GET: BienBan
        public async Task<IActionResult> Index()
        {
            var history = await _context.LichSuDieuChuyens
                .OrderByDescending(d => d.Id)
                .Take(50)
                .ToListAsync();

            ViewBag.TotalCount = await _context.LichSuDieuChuyens.CountAsync();
            return View(history);
        }

        // GET: BienBan/Create
        public async Task<IActionResult> Create(string? loai, int? thietBiId, int? userId)
        {
            var model = new BienBanViewModel
            {
                LoaiBienBan = loai ?? "Cấp phát",
                SoBienBan = DateTime.Now.ToString("yyMMdd.HHmmss"),
                NgayBanGiao = DateTime.Today.ToString("dd/MM/yyyy"),
                ThoiGianCap = DateTime.Today.ToString("MM/yyyy"),
                MucTruyCap_ERP = "1. Khai báo vật tư, hàng hóa, dịch vụ\n2. Phân hệ quản lý sản xuất (MFG)\n3. Change Password"
            };

            if (model.LoaiBienBan == "Thu hồi")
            {
                model.LyDoBanGiao = "Nghỉ việc";
                // Khi thu hồi: Bên giao là nhân viên, bên nhận là IT
                model.NguoiNhan = "Nguyễn Hoàng Khánh Duy";
                model.ChucVu_Nhan = "IT Helpdesk";
                model.BoPhan_Nhan = "IT";
            }

            // Nạp thiết bị nếu có
            if (thietBiId.HasValue)
            {
                var dev = await _context.ThietBis.FirstOrDefaultAsync(t => t.Id == thietBiId.Value);
                if (dev != null)
                {
                    model.ThietBiId = dev.Id;
                    model.TenThietBi = dev.Model ?? "Thiết bị IT";
                    model.SerialNumber = dev.SerialNumber;
                    
                    var specs = new List<string>();
                    if (!string.IsNullOrEmpty(dev.Ram)) specs.Add($"RAM {dev.Ram}");
                    if (!string.IsNullOrEmpty(dev.HardDisk)) specs.Add($"Bộ nhớ {dev.HardDisk}");
                    if (!string.IsNullOrEmpty(dev.Cpu)) specs.Add(dev.Cpu);
                    model.DacTinhKyThuat = specs.Any() ? string.Join("\n", specs) : "Chuẩn tiêu chuẩn văn phòng";
                    
                    if (!string.IsNullOrEmpty(dev.ThoiGianDauTu)) model.ThoiGianCap = dev.ThoiGianDauTu;

                    if (model.LoaiBienBan == "Thu hồi" && !string.IsNullOrEmpty(dev.Owner))
                    {
                        model.NguoiBanGiao = dev.Owner;
                        model.BoPhan_BG = dev.PhongBan ?? "";

                        // Tự động tìm user trong bảng Users theo dev.Owner để nạp ChucVu, Email M365 và Domain
                        var ownerUser = await _context.Users.FirstOrDefaultAsync(u => u.FullName == dev.Owner);
                        if (ownerUser != null)
                        {
                            model.ChucVu_BG = ownerUser.Position ?? "Nhân viên";
                            if (!string.IsNullOrEmpty(ownerUser.Department)) model.BoPhan_BG = ownerUser.Department;
                            model.Email_M365 = ownerUser.Email ?? "";
                            model.Domain_Name = (ownerUser.Username ?? "").ToUpper();

                            var lic = await _context.Licenses.FirstOrDefaultAsync(l => l.UserId == ownerUser.Id || l.Owner == ownerUser.FullName);
                            if (lic != null)
                            {
                                if (!string.IsNullOrEmpty(lic.LocalDomain)) model.Domain_Name = lic.LocalDomain.ToUpper();
                                if (!string.IsNullOrEmpty(lic.GlobalDomain)) model.Email_M365 = lic.GlobalDomain;
                            }
                        }
                    }
                }
            }

            // Nạp nhân sự nếu có
            if (userId.HasValue)
            {
                var user = await _context.Users.FirstOrDefaultAsync(u => u.Id == userId.Value);
                if (user != null)
                {
                    if (model.LoaiBienBan == "Cấp phát")
                    {
                        model.NguoiNhan = user.FullName;
                        model.ChucVu_Nhan = user.Position ?? "Nhân viên";
                        model.BoPhan_Nhan = user.Department ?? "";
                    }
                    else
                    {
                        model.NguoiBanGiao = user.FullName;
                        model.ChucVu_BG = user.Position ?? "Nhân viên";
                        model.BoPhan_BG = user.Department ?? "";
                    }

                    model.Email_M365 = user.Email ?? "";
                    model.Domain_Name = user.Username.ToUpper();

                    // Tìm license tương ứng để lấy domain chuẩn
                    var lic = await _context.Licenses.FirstOrDefaultAsync(l => l.UserId == user.Id || l.Owner == user.FullName);
                    if (lic != null)
                    {
                        if (!string.IsNullOrEmpty(lic.LocalDomain)) model.Domain_Name = lic.LocalDomain.ToUpper();
                        if (!string.IsNullOrEmpty(lic.GlobalDomain)) model.Email_M365 = lic.GlobalDomain;
                    }
                }
            }

            ViewBag.Devices = await _context.ThietBis
                .Where(t => (!string.IsNullOrEmpty(t.Model) && t.Model.Trim() != "") || (!string.IsNullOrEmpty(t.SerialNumber) && t.SerialNumber.Trim() != ""))
                .OrderBy(t => t.Model)
                .Select(t => new { 
                    t.Id, 
                    Model = !string.IsNullOrEmpty(t.Model) ? t.Model.Trim() : (t.NhomThietBi ?? "Thiết bị IT #" + t.Id), 
                    SerialNumber = t.SerialNumber ?? "", 
                    Cpu = t.Cpu ?? "", 
                    Ram = t.Ram ?? "", 
                    HardDisk = t.HardDisk ?? "", 
                    ThoiGianDauTu = t.ThoiGianDauTu ?? "", 
                    Owner = !string.IsNullOrEmpty(t.Owner) ? t.Owner.Trim() : "Kho IT", 
                    PhongBan = t.PhongBan ?? "",
                    NhomThietBi = t.NhomThietBi ?? "Máy tính"
                })
                .ToListAsync();

            ViewBag.Users = await _context.Users
                .OrderBy(u => u.FullName)
                .Select(u => new { 
                    u.Id, 
                    FullName = u.FullName ?? "", 
                    Position = u.Position ?? "Nhân viên", 
                    Department = u.Department ?? "", 
                    Email = u.Email ?? "", 
                    Username = u.Username ?? "" 
                })
                .ToListAsync();

            return View(model);
        }

        // POST: BienBan/Preview
        [HttpPost]
        public IActionResult Preview(BienBanViewModel model)
        {
            return View(model);
        }

        // POST: BienBan/ExportWord
        [HttpPost]
        public IActionResult ExportWord(BienBanViewModel model)
        {
            string templateFolder = Path.Combine(_env.ContentRootPath, "..", "data", "Bienban");
            if (!Directory.Exists(templateFolder))
            {
                templateFolder = Path.Combine(_env.ContentRootPath, "data", "Bienban");
            }

            string templatePath = model.LoaiBienBan == "Thu hồi"
                ? Path.Combine(templateFolder, "ThuHoi", "ThuHoiTBCNTT.docx")
                : Path.Combine(templateFolder, "CapPhat", "CapphatTBCNTT.docx");

            if (!System.IO.File.Exists(templatePath))
            {
                TempData["ErrorMessage"] = "Không tìm thấy file mẫu Word gốc tại: " + templatePath;
                return RedirectToAction(nameof(Create));
            }

            // Đọc trực tiếp từ file mẫu gốc
            byte[] docxBytes = System.IO.File.ReadAllBytes(templatePath);
            byte[] outputBytes;

            using (var memoryStream = new MemoryStream())
            {
                memoryStream.Write(docxBytes, 0, docxBytes.Length);

                using (var archive = new ZipArchive(memoryStream, ZipArchiveMode.Update, true))
                {
                    var docEntry = archive.GetEntry("word/document.xml");
                    if (docEntry != null)
                    {
                        string xmlContent;
                        using (var reader = new StreamReader(docEntry.Open(), System.Text.Encoding.UTF8))
                        {
                            xmlContent = reader.ReadToEnd();
                        }

                        // Helper định dạng ngắt dòng an toàn cho Word OpenXML
                        string FormatMultilineXml(string? input)
                        {
                            if (string.IsNullOrWhiteSpace(input)) return "";
                            var lines = input.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.RemoveEmptyEntries)
                                .Select(l => SecurityElement.Escape(l.Trim()));
                            return string.Join("</w:t><w:br/><w:t xml:space=\"preserve\">", lines);
                        }

                        string Escape(string? s) => SecurityElement.Escape(s ?? "");

                        // Danh sách thay thế trực tiếp vào file Word mẫu gốc
                        var replacements = new Dictionary<string, string>
                        {
                            { "«SoBienBan»", Escape(model.SoBienBan) },
                            { "«NgayBanGiao»", Escape(model.NgayBanGiao) },
                            { "«NguoiBanGiao»", Escape(model.NguoiBanGiao) },
                            { "«ChucVu_BG»", Escape(model.ChucVu_BG) },
                            { "«BoPhan_BG»", Escape(model.BoPhan_BG) },
                            { "«NguoiNhan»", Escape(model.NguoiNhan) },
                            { "«ChucVu_Nhan»", Escape(model.ChucVu_Nhan) },
                            { "«BoPhan_Nhan»", Escape(model.BoPhan_Nhan) },
                            { "«LyDoBanGiao»", Escape(model.LyDoBanGiao) },
                            { "«TenThietBi»", Escape(model.TenThietBi) },
                            { "«ThoiGianCap»", Escape(model.ThoiGianCap) },
                            { "«Email_M365»", Escape(model.Email_M365) },
                            { "«Domain_Name»", Escape(model.Domain_Name) },
                            { "«DacTinhKyThuat»", FormatMultilineXml(model.DacTinhKyThuat) },
                            { "«MucTruyCap_ERP»", FormatMultilineXml(model.MucTruyCap_ERP) }
                        };

                        foreach (var kvp in replacements)
                        {
                            xmlContent = xmlContent.Replace(kvp.Key, kvp.Value);
                        }

                        docEntry.Delete();
                        var newDocEntry = archive.CreateEntry("word/document.xml", CompressionLevel.Optimal);
                        using (var writer = new StreamWriter(newDocEntry.Open(), new System.Text.UTF8Encoding(false)))
                        {
                            writer.Write(xmlContent);
                            writer.Flush();
                        }
                    }

                    // Loại bỏ triệt để cấu hình mailMerge khỏi settings.xml để Word không hiện popup SQL
                    var settingsEntry = archive.GetEntry("word/settings.xml");
                    if (settingsEntry != null)
                    {
                        string settingsXml;
                        using (var sReader = new StreamReader(settingsEntry.Open(), System.Text.Encoding.UTF8))
                        {
                            settingsXml = sReader.ReadToEnd();
                        }

                        if (settingsXml.Contains("mailMerge"))
                        {
                            settingsXml = System.Text.RegularExpressions.Regex.Replace(settingsXml, @"<w:mailMerge>.*?</w:mailMerge>", "", System.Text.RegularExpressions.RegexOptions.Singleline);
                            settingsEntry.Delete();
                            var newSettingsEntry = archive.CreateEntry("word/settings.xml", CompressionLevel.Optimal);
                            using (var sWriter = new StreamWriter(newSettingsEntry.Open(), new System.Text.UTF8Encoding(false)))
                            {
                                sWriter.Write(settingsXml);
                                sWriter.Flush();
                            }
                        }
                    }
                }

                outputBytes = memoryStream.ToArray();
            }

            string safeName = $"BienBan_{model.LoaiBienBan}_{model.SoBienBan}.docx";
            return File(outputBytes, "application/vnd.openxmlformats-officedocument.wordprocessingml.document", safeName);
        }

        // POST: BienBan/SaveHistory
        [HttpPost]
        public async Task<IActionResult> SaveHistory(BienBanViewModel model)
        {
            var history = new LichSuDieuChuyen
            {
                LoaiHanhDong = model.LoaiBienBan,
                Ngay = model.NgayBanGiao,
                NguoiThucHien = model.LoaiBienBan == "Cấp phát" ? model.NguoiBanGiao : model.NguoiNhan,
                ChiTiet = $"Số BB: {model.SoBienBan} | Thiết bị: {model.TenThietBi} ({model.SerialNumber}) | Lý do: {model.LyDoBanGiao}",
                ThietBiId = model.ThietBiId,
                ThietBiSerial = model.SerialNumber,
                NgayTao = DateTime.Now
            };

            if (model.LoaiBienBan == "Cấp phát")
            {
                history.OwnerCu = "Kho IT / Dự phòng";
                history.PhongBanCu = "IT";
                history.OwnerMoi = model.NguoiNhan;
                history.PhongBanMoi = model.BoPhan_Nhan;

                // Cập nhật người sở hữu máy
                if (model.ThietBiId.HasValue)
                {
                    var dev = await _context.ThietBis.FindAsync(model.ThietBiId.Value);
                    if (dev != null)
                    {
                        dev.Owner = model.NguoiNhan;
                        dev.PhongBan = model.BoPhan_Nhan;
                    }
                }
            }
            else // Thu hồi
            {
                history.OwnerCu = model.NguoiBanGiao;
                history.PhongBanCu = model.BoPhan_BG;
                history.OwnerMoi = "Kho IT / Thu hồi";
                history.PhongBanMoi = "IT";

                // Đưa máy về kho IT
                if (model.ThietBiId.HasValue)
                {
                    var dev = await _context.ThietBis.FindAsync(model.ThietBiId.Value);
                    if (dev != null)
                    {
                        dev.Owner = "Kho dự phòng (IT)";
                        dev.PhongBan = "IT";
                    }
                }
            }

            _context.LichSuDieuChuyens.Add(history);
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = $"Đã lưu lịch sử bàn giao thành công! Số biên bản: #{model.SoBienBan}";
            return RedirectToAction(nameof(Index));
        }
    }
}
