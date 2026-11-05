using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models;

public partial class VwThietBiMang
{
    public int Id { get; set; }

    public int? Stt { get; set; }

    public string? PhanLoai { get; set; }

    public string? Model { get; set; }

    public string? Alias { get; set; }

    public string? SerialNumber { get; set; }

    public string? Ipaddress { get; set; }

    public string? Firmware { get; set; }

    public string? PhongBan { get; set; }

    public string? Owner { get; set; }

    public string? Cpu { get; set; }

    public string? Ram { get; set; }

    public string? HardDisk { get; set; }

    public string? ThoiGianDauTu { get; set; }

    public string? HsdbanDau { get; set; }

    public string? ThoiGianBaoTri { get; set; }

    public string? HsdgiaHan { get; set; }

    public string? NienHanBanDau { get; set; }

    public string? NienHanGiaHan { get; set; }

    public string? HienTrang { get; set; }

    public string? CapNhatMay { get; set; }

    public string? KichHoat { get; set; }
}
