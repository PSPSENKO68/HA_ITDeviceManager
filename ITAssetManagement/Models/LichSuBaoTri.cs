using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models;

public partial class LichSuBaoTri
{
    public int Id { get; set; }

    public int? ThietBiId { get; set; }

    public string? SerialNumber { get; set; }

    public string? Model { get; set; }

    public string? TieuDe { get; set; }

    public string LoaiHanhDong { get; set; } = null!;

    public string? ChiTiet { get; set; }

    public string? LinhKienThayThe { get; set; }

    public decimal? ChiPhi { get; set; }

    public string? NguoiThucHien { get; set; }

    public string? NgayThucHien { get; set; }

    public string? NgayDuKien { get; set; }

    public string? TrangThai { get; set; }

    public string? GhiChu { get; set; }
}
