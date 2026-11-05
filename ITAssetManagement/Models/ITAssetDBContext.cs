using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ITAssetManagement.Models;

public partial class ITAssetDBContext : DbContext
{
    public ITAssetDBContext()
    {
    }

    public ITAssetDBContext(DbContextOptions<ITAssetDBContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ApplicationSoftware> ApplicationSoftwares { get; set; }

    public virtual DbSet<License> Licenses { get; set; }

    public virtual DbSet<LichSuBaoTri> LichSuBaoTris { get; set; }

    public virtual DbSet<LichSuDieuChuyen> LichSuDieuChuyens { get; set; }

    public virtual DbSet<ThietBi> ThietBis { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<VwChiPhiBaoTriTheoPhongBan> VwChiPhiBaoTriTheoPhongBans { get; set; }

    public virtual DbSet<VwThietBiCanNangCap> VwThietBiCanNangCaps { get; set; }

    public virtual DbSet<VwThietBiHaTangCamera> VwThietBiHaTangCameras { get; set; }

    public virtual DbSet<VwThietBiMang> VwThietBiMangs { get; set; }

    public virtual DbSet<VwThietBiMayIn> VwThietBiMayIns { get; set; }

    public virtual DbSet<VwThietBiMayTinh> VwThietBiMayTinhs { get; set; }

    public virtual DbSet<VwThongKeTheoNhomThietBi> VwThongKeTheoNhomThietBis { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS;Database=ITAssetDB;Trusted_Connection=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ApplicationSoftware>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Applicat__3214EC27DCD93C92");

            entity.ToTable("ApplicationSoftware");

            entity.HasIndex(e => e.UserId, "IX_AppSoft_UserId");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.LoaiPhanMem).HasMaxLength(100);
            entity.Property(e => e.LyDo).HasMaxLength(255);
            entity.Property(e => e.May).HasMaxLength(255);
            entity.Property(e => e.NgayCaiDat).HasMaxLength(50);
            entity.Property(e => e.Owner).HasMaxLength(150);
            entity.Property(e => e.PhongBan).HasMaxLength(100);
            entity.Property(e => e.Stt).HasColumnName("STT");
            entity.Property(e => e.TrangThai)
                .HasMaxLength(50)
                .HasDefaultValue("Đang sử dụng");
            entity.Property(e => e.UngDung).HasMaxLength(200);
        });

        modelBuilder.Entity<License>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__License__3214EC2761E0F4E6");

            entity.ToTable("License");

            entity.HasIndex(e => e.UserId, "IX_License_UserId");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ActiveAccount).HasMaxLength(200);
            entity.Property(e => e.ComputerName).HasMaxLength(100);
            entity.Property(e => e.GlobalDomain).HasMaxLength(200);
            entity.Property(e => e.KichHoat)
                .HasMaxLength(50)
                .HasDefaultValue("Enabled");
            entity.Property(e => e.LocalDomain).HasMaxLength(200);
            entity.Property(e => e.NgayCapNhat)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Owner).HasMaxLength(150);
            entity.Property(e => e.PhongBan).HasMaxLength(100);
            entity.Property(e => e.Stt).HasColumnName("STT");
        });

        modelBuilder.Entity<LichSuBaoTri>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__LichSuBa__3214EC277810C3FA");

            entity.ToTable("LichSuBaoTri");

            entity.HasIndex(e => e.SerialNumber, "IX_BaoTri_Serial");

            entity.HasIndex(e => e.TrangThai, "IX_BaoTri_TrangThai");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ChiPhi)
                .HasDefaultValue(0m)
                .HasColumnType("decimal(18, 2)");
            entity.Property(e => e.LinhKienThayThe).HasMaxLength(500);
            entity.Property(e => e.LoaiHanhDong).HasMaxLength(100);
            entity.Property(e => e.Model).HasMaxLength(255);
            entity.Property(e => e.NgayDuKien).HasMaxLength(50);
            entity.Property(e => e.NgayThucHien).HasMaxLength(50);
            entity.Property(e => e.NguoiThucHien).HasMaxLength(150);
            entity.Property(e => e.SerialNumber).HasMaxLength(100);
            entity.Property(e => e.ThietBiId).HasColumnName("ThietBiID");
            entity.Property(e => e.TieuDe).HasMaxLength(255);
            entity.Property(e => e.TrangThai)
                .HasMaxLength(50)
                .HasDefaultValue("Hoàn thành");
        });

        modelBuilder.Entity<LichSuDieuChuyen>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__LichSuDi__3214EC2775B35AB9");

            entity.ToTable("LichSuDieuChuyen");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ChiPhi).HasMaxLength(100);
            entity.Property(e => e.LoaiHanhDong).HasMaxLength(100);
            entity.Property(e => e.Ngay).HasMaxLength(100);
            entity.Property(e => e.NgayTao)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.NguoiThucHien).HasMaxLength(150);
            entity.Property(e => e.OwnerCu)
                .HasMaxLength(150)
                .HasColumnName("Owner_Cu");
            entity.Property(e => e.OwnerMoi)
                .HasMaxLength(150)
                .HasColumnName("Owner_Moi");
            entity.Property(e => e.PhongBanCu)
                .HasMaxLength(100)
                .HasColumnName("PhongBan_Cu");
            entity.Property(e => e.PhongBanMoi)
                .HasMaxLength(100)
                .HasColumnName("PhongBan_Moi");
            entity.Property(e => e.Stt).HasColumnName("STT");
            entity.Property(e => e.ThietBiId).HasColumnName("ThietBiID");
            entity.Property(e => e.ThietBiModel)
                .HasMaxLength(255)
                .HasColumnName("ThietBi_Model");
            entity.Property(e => e.ThietBiSerial)
                .HasMaxLength(100)
                .HasColumnName("ThietBi_Serial");
        });

        modelBuilder.Entity<ThietBi>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__ThietBi__3214EC272EB349B3");

            entity.ToTable("ThietBi");

            entity.HasIndex(e => e.NhomThietBi, "IX_ThietBi_Nhom");

            entity.HasIndex(e => e.SerialNumber, "IX_ThietBi_Serial");

            entity.HasIndex(e => e.UserId, "IX_ThietBi_UserId");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Alias).HasMaxLength(150);
            entity.Property(e => e.CapNhatMay).HasMaxLength(100);
            entity.Property(e => e.ChiPhiDuKien)
                .HasDefaultValue(0m)
                .HasColumnType("decimal(18, 2)");
            entity.Property(e => e.Cpu)
                .HasMaxLength(200)
                .HasColumnName("CPU");
            entity.Property(e => e.Firmware).HasMaxLength(100);
            entity.Property(e => e.HardDisk).HasMaxLength(200);
            entity.Property(e => e.HienTrang)
                .HasMaxLength(100)
                .HasDefaultValue("Đang sử dụng");
            entity.Property(e => e.HsdbanDau)
                .HasMaxLength(50)
                .HasColumnName("HSDBanDau");
            entity.Property(e => e.HsdgiaHan)
                .HasMaxLength(50)
                .HasColumnName("HSDGiaHan");
            entity.Property(e => e.Ipaddress)
                .HasMaxLength(50)
                .HasColumnName("IPAddress");
            entity.Property(e => e.KhuyenNghiIt).HasColumnName("KhuyenNghiIT");
            entity.Property(e => e.KichHoat)
                .HasMaxLength(50)
                .HasDefaultValue("Enabled");
            entity.Property(e => e.Model).HasMaxLength(255);
            entity.Property(e => e.NgayCapNhat)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.NgayTao)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.NhomThietBi).HasMaxLength(50);
            entity.Property(e => e.NienHanBanDau).HasMaxLength(100);
            entity.Property(e => e.NienHanGiaHan).HasMaxLength(100);
            entity.Property(e => e.Os)
                .HasMaxLength(100)
                .HasColumnName("OS");
            entity.Property(e => e.OutlookStorage).HasMaxLength(100);
            entity.Property(e => e.Owner).HasMaxLength(150);
            entity.Property(e => e.PhanLoai).HasMaxLength(100);
            entity.Property(e => e.PhongBan).HasMaxLength(100);
            entity.Property(e => e.Ram)
                .HasMaxLength(100)
                .HasColumnName("RAM");
            entity.Property(e => e.RansomwareProtection)
                .HasMaxLength(50)
                .HasDefaultValue("Yes");
            entity.Property(e => e.SerialNumber).HasMaxLength(100);
            entity.Property(e => e.Stt).HasColumnName("STT");
            entity.Property(e => e.ThoiGianBaoTri).HasMaxLength(50);
            entity.Property(e => e.ThoiGianDauTu).HasMaxLength(50);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Users__3214EC0701D9C4FD");

            entity.HasIndex(e => e.Department, "IX_Users_Department");

            entity.HasIndex(e => e.FullName, "IX_Users_FullName");

            entity.Property(e => e.Block).HasMaxLength(100);
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Department).HasMaxLength(100);
            entity.Property(e => e.Email).HasMaxLength(150);
            entity.Property(e => e.FullName).HasMaxLength(150);
            entity.Property(e => e.IsActive).HasDefaultValue(true);
            entity.Property(e => e.PasswordHash).HasMaxLength(255);
            entity.Property(e => e.Position).HasMaxLength(150);
            entity.Property(e => e.Role)
                .HasMaxLength(50)
                .HasDefaultValue("User");
            entity.Property(e => e.Username).HasMaxLength(50);
        });

        modelBuilder.Entity<VwChiPhiBaoTriTheoPhongBan>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_ChiPhiBaoTriTheoPhongBan");

            entity.Property(e => e.PhongBan).HasMaxLength(100);
            entity.Property(e => e.TongChiPhiVnd)
                .HasColumnType("decimal(38, 2)")
                .HasColumnName("TongChiPhiVND");
        });

        modelBuilder.Entity<VwThietBiCanNangCap>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_ThietBiCanNangCap");

            entity.Property(e => e.HardDisk).HasMaxLength(200);
            entity.Property(e => e.HienTrang).HasMaxLength(100);
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.KhuyenNghiIt).HasColumnName("KhuyenNghiIT");
            entity.Property(e => e.Model).HasMaxLength(255);
            entity.Property(e => e.NhomThietBi).HasMaxLength(50);
            entity.Property(e => e.Owner).HasMaxLength(150);
            entity.Property(e => e.PhanLoai).HasMaxLength(100);
            entity.Property(e => e.PhongBan).HasMaxLength(100);
            entity.Property(e => e.Ram)
                .HasMaxLength(100)
                .HasColumnName("RAM");
            entity.Property(e => e.SerialNumber).HasMaxLength(100);
        });

        modelBuilder.Entity<VwThietBiHaTangCamera>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_ThietBi_HaTang_Camera");

            entity.Property(e => e.Alias).HasMaxLength(150);
            entity.Property(e => e.Cpu)
                .HasMaxLength(200)
                .HasColumnName("CPU");
            entity.Property(e => e.Firmware).HasMaxLength(100);
            entity.Property(e => e.HardDisk).HasMaxLength(200);
            entity.Property(e => e.HienTrang).HasMaxLength(100);
            entity.Property(e => e.HsdgiaHan)
                .HasMaxLength(50)
                .HasColumnName("HSDGiaHan");
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.Ipaddress)
                .HasMaxLength(50)
                .HasColumnName("IPAddress");
            entity.Property(e => e.KichHoat).HasMaxLength(50);
            entity.Property(e => e.Model).HasMaxLength(255);
            entity.Property(e => e.Owner).HasMaxLength(150);
            entity.Property(e => e.PhanLoai).HasMaxLength(100);
            entity.Property(e => e.PhongBan).HasMaxLength(100);
            entity.Property(e => e.Ram)
                .HasMaxLength(100)
                .HasColumnName("RAM");
            entity.Property(e => e.SerialNumber).HasMaxLength(100);
            entity.Property(e => e.Stt).HasColumnName("STT");
            entity.Property(e => e.ThoiGianBaoTri).HasMaxLength(50);
            entity.Property(e => e.ThoiGianDauTu).HasMaxLength(50);
        });

        modelBuilder.Entity<VwThietBiMang>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_ThietBi_Mang");

            entity.Property(e => e.Alias).HasMaxLength(150);
            entity.Property(e => e.CapNhatMay).HasMaxLength(100);
            entity.Property(e => e.Cpu)
                .HasMaxLength(200)
                .HasColumnName("CPU");
            entity.Property(e => e.Firmware).HasMaxLength(100);
            entity.Property(e => e.HardDisk).HasMaxLength(200);
            entity.Property(e => e.HienTrang).HasMaxLength(100);
            entity.Property(e => e.HsdbanDau)
                .HasMaxLength(50)
                .HasColumnName("HSDBanDau");
            entity.Property(e => e.HsdgiaHan)
                .HasMaxLength(50)
                .HasColumnName("HSDGiaHan");
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.Ipaddress)
                .HasMaxLength(50)
                .HasColumnName("IPAddress");
            entity.Property(e => e.KichHoat).HasMaxLength(50);
            entity.Property(e => e.Model).HasMaxLength(255);
            entity.Property(e => e.NienHanBanDau).HasMaxLength(100);
            entity.Property(e => e.NienHanGiaHan).HasMaxLength(100);
            entity.Property(e => e.Owner).HasMaxLength(150);
            entity.Property(e => e.PhanLoai).HasMaxLength(100);
            entity.Property(e => e.PhongBan).HasMaxLength(100);
            entity.Property(e => e.Ram)
                .HasMaxLength(100)
                .HasColumnName("RAM");
            entity.Property(e => e.SerialNumber).HasMaxLength(100);
            entity.Property(e => e.Stt).HasColumnName("STT");
            entity.Property(e => e.ThoiGianBaoTri).HasMaxLength(50);
            entity.Property(e => e.ThoiGianDauTu).HasMaxLength(50);
        });

        modelBuilder.Entity<VwThietBiMayIn>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_ThietBi_MayIn");

            entity.Property(e => e.HienTrang).HasMaxLength(100);
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.Ipaddress)
                .HasMaxLength(50)
                .HasColumnName("IPAddress");
            entity.Property(e => e.KichHoat).HasMaxLength(50);
            entity.Property(e => e.Owner).HasMaxLength(150);
            entity.Property(e => e.PhanLoai).HasMaxLength(100);
            entity.Property(e => e.PhongBan).HasMaxLength(100);
            entity.Property(e => e.Stt).HasColumnName("STT");
            entity.Property(e => e.TenMayIn).HasMaxLength(255);
            entity.Property(e => e.ThoiGianBaoTri).HasMaxLength(50);
        });

        modelBuilder.Entity<VwThietBiMayTinh>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_ThietBi_MayTinh");

            entity.Property(e => e.CapNhatMay).HasMaxLength(100);
            entity.Property(e => e.ChiPhiDuKien).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.Cpu)
                .HasMaxLength(200)
                .HasColumnName("CPU");
            entity.Property(e => e.HardDisk).HasMaxLength(200);
            entity.Property(e => e.HienTrang).HasMaxLength(100);
            entity.Property(e => e.HsdbanDau)
                .HasMaxLength(50)
                .HasColumnName("HSDBanDau");
            entity.Property(e => e.HsdgiaHan)
                .HasMaxLength(50)
                .HasColumnName("HSDGiaHan");
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.KhuyenNghiIt).HasColumnName("KhuyenNghiIT");
            entity.Property(e => e.KichHoat).HasMaxLength(50);
            entity.Property(e => e.Model).HasMaxLength(255);
            entity.Property(e => e.NienHanBanDau).HasMaxLength(100);
            entity.Property(e => e.NienHanGiaHan).HasMaxLength(100);
            entity.Property(e => e.Os)
                .HasMaxLength(100)
                .HasColumnName("OS");
            entity.Property(e => e.OutlookStorage).HasMaxLength(100);
            entity.Property(e => e.Owner).HasMaxLength(150);
            entity.Property(e => e.PhanLoai).HasMaxLength(100);
            entity.Property(e => e.PhongBan).HasMaxLength(100);
            entity.Property(e => e.Ram)
                .HasMaxLength(100)
                .HasColumnName("RAM");
            entity.Property(e => e.RansomwareProtection).HasMaxLength(50);
            entity.Property(e => e.SerialNumber).HasMaxLength(100);
            entity.Property(e => e.Stt).HasColumnName("STT");
            entity.Property(e => e.ThoiGianBaoTri).HasMaxLength(50);
            entity.Property(e => e.ThoiGianDauTu).HasMaxLength(50);
        });

        modelBuilder.Entity<VwThongKeTheoNhomThietBi>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_ThongKeTheoNhomThietBi");

            entity.Property(e => e.NhomThietBi).HasMaxLength(50);
            entity.Property(e => e.TongChiPhiBaoTriVnd)
                .HasColumnType("decimal(38, 2)")
                .HasColumnName("TongChiPhiBaoTriVND");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
