using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using Project_V_2018.Models;
namespace Project_V_2018.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Request.Cookies["LogSession"] != null)
            {
                string token = Request.Cookies["LogSession"].Value;
                NguoiDung temp_NguoiDung = MyClass.Instance(token);
                if (temp_NguoiDung == null)
                    return View("Login", "Home");
                else
                    return View();
            }
            else
                return View("Login");
        }

        public ActionResult test()
        {
            return View();
        }
        public ActionResult HeadAdmin()
        {
            return View();
        }
        public void ChuyenGioHangCookieVaoDB()
        {
            try
            {
                //Nếu đăng nhập vô mà trong cookie có mặt hàng nào đó -->chuyển vô DB rồi xóa cookie
                var cookie = Request.Cookies["Cart"];
                if (cookie != null)
                {
                    var user = MyClass.Instance(Request.Cookies["LogSession"].Value);
                    if (user == null)
                        return;
                    string ValueCookie = Server.UrlDecode(cookie.Value);
                    List<GioHang> lst = JsonConvert.DeserializeObject<List<GioHang>>(ValueCookie);
                    foreach (var item in lst)
                    {
                        item.TenDangNhap = user.TenDangNhap;
                        db.GioHangs.Add(item);
                    }
                    db.SaveChanges();
                    //Lấy vô rồi bỏ
                    if (Request.Cookies["Cart"] != null)
                    {
                        HttpCookie myCookie = new HttpCookie("Cart");
                        myCookie.Expires = DateTime.Now.AddDays(-1d);
                        Response.Cookies.Add(myCookie);
                    }
                }
            }
            catch (Exception)
            {

            }

        }
        ////public ActionResult Login(FormCollection f)
        ////{
        ////    ViewBag.KetQua = "";
        ////    if (Request.Cookies["LogSession"] == null)
        ////    {
        ////        if (Request.Params["TenDangNhap"] != null && Request.Params["MatKhau"] != null)
        ////        {

        ////            string IP = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName()).AddressList[1].ToString();
        ////            string token = MyClass.MakeToken();
        ////            string TenDN = Request.Params["TenDangNhap"];
        ////            string MK = MaHoa.Encrypt(Request.Params["MatKhau"]);

        ////            var find = db.NguoiDungs.SingleOrDefault(x => x.TenDangNhap == TenDN && x.MatKhau.Trim().CompareTo(MK) == 0 && x.TrangThai == true);
        ////            if (find != null)
        ////            {
        ////                if (Request.Cookies["LogSession"] != null)
        ////                {
        ////                    HttpCookie myCookie = new HttpCookie("LogSession");
        ////                    myCookie.Expires = DateTime.Now.AddDays(-1d);
        ////                    Response.Cookies.Add(myCookie);
        ////                }
        ////                HttpCookie cookie = new HttpCookie("LogSession", token)
        ////                {
        ////                    Expires = DateTime.Now.AddYears(1)
        ////                };
        ////                Response.Cookies.Add(cookie);
        ////                PhienDangNhap temp = new PhienDangNhap();
        ////                temp.DiaChiIP = IP;
        ////                temp.TenDangNhap = TenDN;
        ////                temp.ThoiGian = DateTime.Now;
        ////                temp.Token = token;
        ////                db.PhienDangNhaps.Add(temp);
        ////                db.SaveChanges();
        ////                ChuyenGioHangCookieVaoDB();
        ////                return Redirect("~/Admin/Home");
        ////            }
        ////            else
        ////            {
        ////                ViewBag.KetQua = "Tên đăng nhập hoặc mật khẩu không đúng";
        ////            }
        ////        }
        ////    }
        ////    else
        ////    {
        ////        var user = MyClass.Instance(Request.Cookies["LogSession"].Value);
        ////        if (user != null)
        ////        {
        ////            if (user.PhanQuyen == 0)
        ////                return Redirect("~/Admin/Home");
        ////            else
        ////                return Redirect("~/Home");

        ////        }
        ////    }
        ////    return View();
        ////}

        public ActionResult Logout()
        {
            //Kill Cookie
            if(Request.Cookies["LogSession"]!=null)
            {
                HttpCookie a = new HttpCookie("LogSession");
                a.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(a);
            }
            return View("Login");
        }


    }
}