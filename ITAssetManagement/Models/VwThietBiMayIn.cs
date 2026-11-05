using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models;

public partial class VwThietBiMayIn
{
    public int Id { get; set; }

    public int? Stt { get; set; }

    public string? PhanLoai { get; set; }

    public string? TenMayIn { get; set; }

    public string? Ipaddress { get; set; }

    public string? PhongBan { get; set; }

    public string? Owner { get; set; }

    public string? ThoiGianBaoTri { get; set; }

    public string? HienTrang { get; set; }

    public string? KichHoat { get; set; }
}
