using Microsoft.EntityFrameworkCore;
using ITAssetManagement.Models;
using System.Diagnostics;

// 1. SINGLE-INSTANCE & TỰ ĐỘNG KHÔI PHỤC TIẾN TRÌNH TREO
var currentProc = Process.GetCurrentProcess();
var existingProcs = Process.GetProcessesByName("ITAssetManagement")
    .Where(p => p.Id != currentProc.Id)
    .ToList();

if (existingProcs.Any())
{
    bool isAlive = false;
    try
    {
        using var client = new HttpClient { Timeout = TimeSpan.FromMilliseconds(500) };
        var res = await client.GetAsync("http://127.0.0.1:5000/api/heartbeat/ping");
        isAlive = res.IsSuccessStatusCode;
    }
    catch { }

    if (isAlive)
    {
        // Ứng dụng đã chạy sẵn ở background -> Kích hoạt lại cửa sổ và thoát launcher thứ hai
        OpenAppWindow();
        return;
    }
    else
    {
        // Tiến trình cũ bị đóng băng / không phản hồi -> Dọn dẹp để tiến trình mới chạy trơn tru
        foreach (var p in existingProcs)
        {
            try { p.Kill(); } catch { }
        }
        await Task.Delay(400);
    }
}

// 2. CẤU HÌNH WEB APP KESTREL
var builder = WebApplication.CreateBuilder(args);

builder.WebHost.UseUrls("http://127.0.0.1:5000");

builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<ITAssetDBContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("ITAssetDB")));

var app = builder.Build();

app.UseDeveloperExceptionPage();

app.UseRouting();
app.UseAuthorization();

app.MapStaticAssets();

// API Ping kiểm tra trạng thái máy chủ (phục vụ Single-Instance launcher)
app.MapGet("/api/heartbeat/ping", () => Results.Ok(new { status = "alive" }));

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}")
    .WithStaticAssets();

// Tự động mở cửa sổ Edge App Mode khi server sẵn sàng
app.Lifetime.ApplicationStarted.Register(() =>
{
    Task.Run(async () =>
    {
        await Task.Delay(600);
        OpenAppWindow();
    });
});

app.Run();

void OpenAppWindow()
{
    try
    {
        Process.Start(new ProcessStartInfo
        {
            FileName = "msedge.exe",
            Arguments = "--app=http://127.0.0.1:5000 --window-size=1400,900",
            UseShellExecute = true
        });
    }
    catch
    {
        try
        {
            Process.Start(new ProcessStartInfo
            {
                FileName = "chrome.exe",
                Arguments = "--app=http://127.0.0.1:5000 --window-size=1400,900",
                UseShellExecute = true
            });
        }
        catch
        {
            Process.Start(new ProcessStartInfo
            {
                FileName = "http://127.0.0.1:5000",
                UseShellExecute = true
            });
        }
    }
}
