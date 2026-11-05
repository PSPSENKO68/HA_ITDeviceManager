using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models;

public partial class LichSuDieuChuyen
{
    public int Id { get; set; }

    public int? Stt { get; set; }

    public int? ThietBiId { get; set; }

    public string? ThietBiModel { get; set; }

    public string? ThietBiSerial { get; set; }

    public string LoaiHanhDong { get; set; } = null!;

    public string? Ngay { get; set; }

    public string? PhongBanCu { get; set; }

    public string? PhongBanMoi { get; set; }

    public string? OwnerCu { get; set; }

    public string? OwnerMoi { get; set; }

    public string? ChiTiet { get; set; }

    public string? ChiPhi { get; set; }

    public string? NguoiThucHien { get; set; }

    public DateTime? NgayTao { get; set; }
}
