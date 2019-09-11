using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Project_V_2018
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                           name: "Đổi linh liên hệ",
                           url: "lien-he",
                           defaults: new { controller = "Home", action = "Info_Partical" },
                           namespaces: new[] { "Project_V_2018.Controllers" }
                       );

            routes.MapRoute(
               name: "Đổi linh tin tức",
               url: "tin-tuc",
               defaults: new { controller = "Home", action = "News" },
                namespaces: new[] { "Project_V_2018.Controllers" }
           );
            routes.MapRoute(
               name: "Đổi linh header ",
               url: "Home/Header_Partical",
               defaults: new { controller = "Home", action = "Index" },
                namespaces: new[] { "Project_V_2018.Controllers" }
           );
            routes.MapRoute(
               name: "Đổi linh quản lý tài khoản ",
               url: "quan-ly-tai-khoan",
               defaults: new { controller = "User", action = "QuanLyTaiKhoan" },
                namespaces: new[] { "Project_V_2018.Controllers" }
           );
            routes.MapRoute(
              name: "Đổi linh giới thiệu ",
              url: "gioi-thieu",
              defaults: new { controller = "Home", action = "Introduce" },
                namespaces: new[] { "Project_V_2018.Controllers" }
          );
            routes.MapRoute(
              name: "Đổi linh kiểm tra đơn hàng ",
              url: "kiem-tra-don-hang",
              defaults: new { controller = "Order", action = "KiemTraDonHang" },
                namespaces: new[] { "Project_V_2018.Controllers" }
          );

            routes.MapRoute(
         name: "Đổi linh kiểm tra đăng ký ",
         url: "dang-ky",
         defaults: new { controller = "User", action = "Register" },
                namespaces: new[] { "Project_V_2018.Controllers" }

     );
            routes.MapRoute(
         name: "Đổi linh hướng dẫn mua hàng ",
         url: "huong-dan-mua-hang",
         defaults: new { controller = "Home", action = "HDMuaHang" },
                namespaces: new[] { "Project_V_2018.Controllers" }

     );

            routes.MapRoute(
         name: "Đổi linh hướng dẫn thanh toán ",
         url: "huong-dan-thanh-toan",
         defaults: new { controller = "Home", action = "HDThanhToan" },
                namespaces: new[] { "Project_V_2018.Controllers" }

     );
            routes.MapRoute(
       name: "Đổi linh hướng tài khoản giao dịch ",
       url: "tai-khoan-giao-dich",
       defaults: new { controller = "Home", action = "TaiKhoanGiaoDich" },
              namespaces: new[] { "Project_V_2018.Controllers" }

   );
            routes.MapRoute(
       name: "Đổi linh chính sách bảo mật ",
       url: "chinh-sach-bao-mat",
       defaults: new { controller = "Home", action = "Security" },
              namespaces: new[] { "Project_V_2018.Controllers" }

   );
            routes.MapRoute(
      name: "Đổi linh tiến hành thanh toán",
      url: "thanh-toan",
      defaults: new { controller = "Cart", action = "TienHanhThanhToan" },
             namespaces: new[] { "Project_V_2018.Controllers" }

  ); routes.MapRoute(
      name: "Đổi linh thử",
      url: "thanh-toan.html",
      defaults: new { controller = "Cart", action = "TienHanhThanhToan" },
             namespaces: new[] { "Project_V_2018.Controllers" }

  );
            routes.MapRoute(
                name: "trang-chu",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Project_V_2018.Controllers" }
            );

        }
    }
}
