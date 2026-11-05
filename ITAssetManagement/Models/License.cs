using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models;

public partial class License
{
    public int Id { get; set; }

    public int? Stt { get; set; }

    public int? UserId { get; set; }

    public string? ComputerName { get; set; }

    public string? GlobalDomain { get; set; }

    public string? LocalDomain { get; set; }

    public string? ActiveAccount { get; set; }

    public string? Owner { get; set; }

    public string? PhongBan { get; set; }

    public string? KichHoat { get; set; }

    public DateTime? NgayCapNhat { get; set; }
}
