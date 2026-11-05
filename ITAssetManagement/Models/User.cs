using System;
using System.Collections.Generic;

namespace ITAssetManagement.Models;

public partial class User
{
    public int Id { get; set; }

    public string Username { get; set; } = null!;

    public string? PasswordHash { get; set; }

    public string FullName { get; set; } = null!;

    public string? Email { get; set; }

    public string? Role { get; set; }

    public string? Department { get; set; }

    public string? Position { get; set; }

    public string? Block { get; set; }

    public bool? IsActive { get; set; }

    public DateTime? CreatedAt { get; set; }
}
