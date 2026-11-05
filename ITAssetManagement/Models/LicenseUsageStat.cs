using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models
{
    public class LicenseUsageStat
    {
        public string ActiveAccount { get; set; } = string.Empty;
        public int Count { get; set; }
        public int Limit { get; set; } = 10;
        public bool IsOverLimit => Count > Limit;
        public double Percentage => Math.Min((Count / (double)Limit) * 100.0, 100.0);
        public List<string> Owners { get; set; } = new();
        public List<string> ComputerNames { get; set; } = new();
    }
}

