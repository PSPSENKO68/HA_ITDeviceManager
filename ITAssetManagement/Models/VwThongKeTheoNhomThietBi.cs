using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models;

public partial class VwThongKeTheoNhomThietBi
{
    public string NhomThietBi { get; set; } = null!;

    public int? TongSoLuong { get; set; }

    public int? SoLuongDangHong { get; set; }

    public int? SoLuongLuuKho { get; set; }

    public int? SoLuotBaoTri { get; set; }

    public decimal TongChiPhiBaoTriVnd { get; set; }
}
