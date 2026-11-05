using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models;

public partial class VwChiPhiBaoTriTheoPhongBan
{
    public string PhongBan { get; set; } = null!;

    public int? SoLuongThietBi { get; set; }

    public int? SoLuotBaoTri { get; set; }

    public decimal TongChiPhiVnd { get; set; }
}
