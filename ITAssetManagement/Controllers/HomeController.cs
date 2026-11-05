using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Diagnostics;
using ITAssetManagement.Models;

namespace ITAssetManagement.Controllers;

public class HomeController : Controller
{
    private readonly IHostApplicationLifetime _lifetime;

    public HomeController(IHostApplicationLifetime lifetime)
    {
        _lifetime = lifetime;
    }

    public IActionResult Index()
    {
        return RedirectToAction("Index", "ThietBi");
    }

    public IActionResult Privacy()
    {
        return View();
    }

    public IActionResult ExitApp()
    {
        Task.Run(async () =>
        {
            await Task.Delay(500);
            _lifetime.StopApplication();
        });
        return Content("<script>window.close();</script><div style='text-align:center;padding:50px;font-family:sans-serif;'><h3>Đã tắt ứng dụng Quản lý Tài sản IT.</h3><p>Cửa sổ có thể được đóng an toàn.</p></div>", "text/html");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        var exceptionHandlerPathFeature = HttpContext.Features.Get<IExceptionHandlerPathFeature>();
        ViewBag.ErrorMessage = exceptionHandlerPathFeature?.Error?.Message;
        ViewBag.StackTrace = exceptionHandlerPathFeature?.Error?.StackTrace;
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
