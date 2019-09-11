using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_V_2018.Models;
namespace Project_V_2018.Controllers
{
    public class BaseController : Controller
    {
        // GET: Base
        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        public static bool IsAdmin()
        {
            BaseController a = new BaseController();
            return a.IsAdmin_Local();
        }
        public static HttpCookie TaoCookieDangNhap(string SaveMe, string token)
        {
            BaseController a = new BaseController();
            return a.TaoCookieDangNhapLocal(SaveMe, token);
        }
        public static void XoaCookieDangNhap()
        {
            BaseController a = new BaseController();
            a.XoaCookieDN();
        }  public static void XoaCookieGioHang()
        {
            BaseController a = new BaseController();
            a.XoaCookieGH();
        }
        public  string GetSaltByUserName_Local(string userName)
        {
            return (db.NguoiDungs.SingleOrDefault(x => x.TenDangNhap.Trim() == userName)).SaltString;
        }
       
        public static string GetSaltByUserName(string userName)
        {
            BaseController a = new BaseController();
            return a.GetSaltByUserName_Local( userName);
        }
        public void XoaCookieDN()
        {
            if (Request.Cookies["LogSession"] != null)
            {
                HttpCookie myCookie = new HttpCookie("LogSession");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);
            }
        }
        public void XoaCookieGH()
        {
            if (Request.Cookies["Cart"] != null)
            {
                HttpCookie myCookie = new HttpCookie("Cart");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);
            }
        }
        public HttpCookie TaoCookieDangNhapLocal(string SaveMe, string token)
        {
            var time = DateTime.Now;
            if (SaveMe == "True")
                time = time.AddYears(1);
            else
                time = time.AddDays(1);
            HttpCookie cookie = new HttpCookie("LogSession", token)
            {
                HttpOnly = true,
                Secure = true,
                Expires = time
            };

            return cookie;
        }
        public bool IsAdmin_Local()
        {
            if (Request.Cookies["LogSession"] != null)
            {
                var user = MyClass.Instance(Request.Cookies["LogSession"].Value);
                if (user != null)
                {
                    if (user.PhanQuyen == 0)
                    {
                        return true;
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            else
                return false;
        }
    }
}