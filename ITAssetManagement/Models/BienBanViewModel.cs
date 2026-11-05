using System.ComponentModel.DataAnnotations;

namespace ITAssetManagement.Models
{
    public class BienBanViewModel
    {
        [Display(Name = "Loại biên bản")]
        public string LoaiBienBan { get; set; } = "Cấp phát"; // "Cấp phát" hoặc "Thu hồi"

        [Display(Name = "Số biên bản")]
        public string SoBienBan { get; set; } = ""; // Unique: YYMMDD.HHmmss

        [Display(Name = "Ngày bàn giao")]
        public string NgayBanGiao { get; set; } = DateTime.Today.ToString("dd/MM/yyyy");

        // Bên bàn giao
        [Display(Name = "Người bàn giao")]
        public string NguoiBanGiao { get; set; } = "Nguyễn Hoàng Khánh Duy";

        [Display(Name = "Chức vụ")]
        public string ChucVu_BG { get; set; } = "IT Helpdesk";

        [Display(Name = "Bộ phận")]
        public string BoPhan_BG { get; set; } = "IT";

        // Bên nhận bàn giao
        [Display(Name = "Người nhận bàn giao")]
        public string NguoiNhan { get; set; } = "";

        [Display(Name = "Chức vụ")]
        public string ChucVu_Nhan { get; set; } = "";

        [Display(Name = "Bộ phận")]
        public string BoPhan_Nhan { get; set; } = "";

        [Display(Name = "Lý do bàn giao")]
        public string LyDoBanGiao { get; set; } = "Phục vụ cho công việc";

        // Thiết bị
        public int? ThietBiId { get; set; }

        [Display(Name = "Tên thiết bị / Model")]
        public string TenThietBi { get; set; } = "";

        [Display(Name = "Serial Number")]
        public string? SerialNumber { get; set; }

        [Display(Name = "Đặc tính kỹ thuật (RAM, CPU, Ổ cứng)")]
        public string DacTinhKyThuat { get; set; } = "";

        [Display(Name = "Thời gian cấp / thu hồi")]
        public string ThoiGianCap { get; set; } = DateTime.Today.ToString("MM/yyyy");

        // Phần mềm & Tài khoản
        [Display(Name = "Email Microsoft Office 365")]
        public string Email_M365 { get; set; } = "";

        [Display(Name = "Tên Domain (Domain Name)")]
        public string Domain_Name { get; set; } = "";

        [Display(Name = "Có tài khoản Sales Project")]
        public bool HasSalesProject { get; set; } = false;

        [Display(Name = "Email Sales Project")]
        public string? Email_Sales { get; set; }

        // Phân quyền ERP
        [Display(Name = "Các mục truy cập trong hệ thống ERP")]
        public string MucTruyCap_ERP { get; set; } = "1. Khai báo vật tư, hàng hóa, dịch vụ\n2. Phân hệ quản lý sản xuất (MFG)\n3. Change Password";
    }
}

