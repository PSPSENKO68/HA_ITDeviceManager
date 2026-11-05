using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models;

public partial class VwThietBiCanNangCap
{
    public int Id { get; set; }

    public string NhomThietBi { get; set; } = null!;

    public string? PhanLoai { get; set; }

    public string? Model { get; set; }

    public string? SerialNumber { get; set; }

    public string? PhongBan { get; set; }

    public string? Owner { get; set; }

    public string? Ram { get; set; }

    public string? HardDisk { get; set; }

    public string? KhuyenNghiIt { get; set; }

    public string? DanhGiaKhiBaoTri { get; set; }

    public string? HienTrang { get; set; }
}
