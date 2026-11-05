namespace ITAssetManagement.Models
{
    public class UserAppGroupViewModel
    {
        public int? UserId { get; set; }
        public string Owner { get; set; } = "Chưa gán";
        public string? PhongBan { get; set; }
        public string? May { get; set; }
        public List<ApplicationSoftware> Apps { get; set; } = new();
    }
}

