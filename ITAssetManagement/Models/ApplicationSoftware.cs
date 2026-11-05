using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models;

public partial class ApplicationSoftware
{
    public int Id { get; set; }

    public int? Stt { get; set; }

    public int? UserId { get; set; }

    public string? Owner { get; set; }

    public string? PhongBan { get; set; }

    public string? May { get; set; }

    public string? UngDung { get; set; }

    public string? LyDo { get; set; }

    public string? LoaiPhanMem { get; set; }

    public string? TrangThai { get; set; }

    public string? NgayCaiDat { get; set; }

    public string? GhiChu { get; set; }
}
