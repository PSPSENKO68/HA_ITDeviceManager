using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models;

public partial class ThietBi
{
    public int Id { get; set; }

    public int? Stt { get; set; }

    public int? UserId { get; set; }

    public string NhomThietBi { get; set; } = null!;

    public string? PhanLoai { get; set; }

    public string? Model { get; set; }

    public string? Alias { get; set; }

    public string? SerialNumber { get; set; }

    public string? Ipaddress { get; set; }

    public string? Firmware { get; set; }

    public string? PhongBan { get; set; }

    public string? Owner { get; set; }

    public string? Os { get; set; }

    public string? Cpu { get; set; }

    public string? Ram { get; set; }

    public string? HardDisk { get; set; }

    public string? RansomwareProtection { get; set; }

    public string? OutlookStorage { get; set; }

    public string? ThoiGianDauTu { get; set; }

    public string? HsdbanDau { get; set; }

    public string? ThoiGianBaoTri { get; set; }

    public string? HsdgiaHan { get; set; }

    public string? NienHanBanDau { get; set; }

    public string? NienHanGiaHan { get; set; }

    public string? PhanHoiNguoiDung { get; set; }

    public string? DanhGiaKhiBaoTri { get; set; }

    public string? KhuyenNghiIt { get; set; }

    public decimal? ChiPhiDuKien { get; set; }

    public string? HienTrang { get; set; }

    public string? CapNhatMay { get; set; }

    public string? KichHoat { get; set; }

    public DateTime? NgayTao { get; set; }

    public DateTime? NgayCapNhat { get; set; }
}
