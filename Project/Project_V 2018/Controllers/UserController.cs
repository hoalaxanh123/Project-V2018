using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using Project_V_2018.Models;
using Project_V_2018.Classes;
namespace Project_V_2018.Controllers
{

    public class User
    {
        public string TenDN { get; set; }
        public string MatKhau { get; set; }
        public string MatKhauDoi { get; set; }
        public string LuuPhienDN { get; set; }
        public string ThoatHet { get; set; }
    }

    public class UserController : Controller
    {
        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        // GET: User
        HttpCookie cookiePublic = new HttpCookie("");
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult test()
        {
            return View();
        }
        [HttpPost]
        public JsonResult Ajax(User data)
        {
            return Json("True");
        }
        public ActionResult TimKiem_Partial()
        {
            return View();
        }
        public ActionResult Register()
        {
            if (Request.Cookies["LogSession"] != null)
            {
                return Redirect("~/Home");
            }
            return View();
        }
        [HttpPost]
        public bool Check_User_Already()
        {
            var TenDN = Request.Params["TenDN"].ToString().Trim();
            var check = db.NguoiDungs.SingleOrDefault(x => x.TenDangNhap.Trim().ToUpper() == TenDN.ToUpper());
            if (check != null)
                return true;
            else
                return false;
        }
        public bool Check_Email_Already()
        {
            var Email = Request.Params["Email"].ToString().Trim();
            var check = db.NguoiDungs.SingleOrDefault(x => x.Email.Trim().ToUpper() == Email.ToUpper());
            if (check != null)
                return true;
            else
                return false;
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
        bool LoginFuncition(string TenDN, string MatKhau, string LuuPhienDN, string URL)
        {
            if (TenDN != null && MatKhau != null)
            {
                string IP = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName()).AddressList[1].ToString();
                string token = MyClass.MakeToken();
                string Salt = BaseController.GetSaltByUserName(TenDN);
                string MK = MaHoa.HashPassword(MatKhau, Salt);

                var find = db.NguoiDungs.SingleOrDefault(x => x.TenDangNhap.Trim() == TenDN && MK == x.MatKhau.Trim() && x.TrangThai == true);
                if (find != null)
                {
                    if (Request.Cookies["LogSession"] != null)
                    {
                        BaseController.XoaCookieDangNhap();
                    }
                    cookiePublic = BaseController.TaoCookieDangNhap(LuuPhienDN, token);
                    NguoiDung userTemp = new NguoiDung();
                    userTemp.TenDangNhap = find.TenDangNhap;
                    userTemp.PhanQuyen = find.PhanQuyen;
                    userTemp.TenThat = find.TenThat;
                    Session["sessionUser"] = userTemp;
                    Session.Timeout = 20;
                    PhienDangNhap temp = new PhienDangNhap();
                    temp.DiaChiIP = IP;
                    temp.TenDangNhap = TenDN;
                    temp.ThoiGian = DateTime.Now;
                    temp.Token = token;
                    db.PhienDangNhaps.Add(temp);
                    db.SaveChanges();
                    ChuyenGioHangCookieVaoDB();
                    return true;
                }

                else
                    return false;
            }
            else return false;
        }
        [HttpPost]
        public ActionResult LoginResult(string TenDN, string MatKhau, string LuuPhienDN, string URL)
        {
            if (LoginFuncition(TenDN, MatKhau, LuuPhienDN, URL))
            {
                Response.Cookies.Add(cookiePublic);
                return Redirect(URL);
            }
            else
                return View("false");
        }
        NguoiDung TimNguoiDungTheoUserNamevaPassWord(User data)
        {
            //B1.Kiểm tra có cookie đăng nhập hay không
            if (Request.Cookies["LogSession"] == null)
                return null;
            //B2: Kiểm tra xem có user nào trong DB có tên đăng nhập lấy từ cookie ra hay không
            var user = MyClass.Instance(Request.Cookies["LogSession"].Value);
            if (user == null)
            {
                //Nếu trong db mà không có tên đăng nhập trùng với cookie
                //-->cookie fake -->xóa
                BaseController.XoaCookieDangNhap();
                return null;
            }
            string TenDN = user.TenDangNhap.Trim();
            string salt = user.SaltString;
            string MK = MaHoa.HashPassword(data.MatKhau, salt);
            //So sánh tên đăng nhập và mật khẩu nhập vào với thông tin từ server
            if (TenDN != null && MK != null)
            {
                if (user.TenDangNhap.Trim() == data.TenDN && MK == data.MatKhau.Trim())
                    return user;
                else
                    return null;
            }
            else
                return null;

        }
        [HttpPost]
        public JsonResult DoiMatKhauResult(User data)
        {
            var user = TimNguoiDungTheoUserNamevaPassWord(data);
            if (user == null)
                return Json("Mật khẩu cũ không đúng , vui lòng kiểm tra lại");
            string Salt = MaHoa.GetRandomSalt();
            string MKDoi = MaHoa.HashPassword(data.MatKhauDoi, Salt);
            var Thoat = data.ThoatHet;

            //Đổi mật khẩu trong DB
            var find = db.NguoiDungs.SingleOrDefault(x => x.TenDangNhap.Trim() == data.TenDN.Trim() && data.MatKhau.Trim() == x.MatKhau.Trim() && x.TrangThai == true);
            if (find == null)
            {
                return Json("Mật khẩu cũ không đúng , vui lòng kiểm tra lại");
            }
            find.MatKhau = MKDoi;
            db.SaveChanges();
            if (Thoat == "1")
            {
                //Xóa phiên đăng nhập hiện tại
                BaseController.XoaCookieDangNhap();
                //Xóa phiên đăng nhập cũ trong DB
                var lst = db.PhienDangNhaps.Where(x => x.TenDangNhap.Trim() == data.TenDN.Trim()).ToList();
                foreach (var item in lst)
                {
                    db.PhienDangNhaps.Remove(item);
                }
                db.SaveChanges();

                //Tạo lại quá trình đăng nhập mới 
                //Trùng code ->Cải thiện về sau
                string token = MyClass.MakeToken();
                HttpCookie cookie = new HttpCookie("LogSession", token)
                {
                    Expires = DateTime.Now.AddYears(1),
                    HttpOnly = true,
                    Secure = true,
                };
                Response.Cookies.Add(cookie);
                PhienDangNhap temp = new PhienDangNhap();
                string IP = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName()).AddressList[1].ToString();
                temp.DiaChiIP = IP;
                temp.TenDangNhap = data.TenDN.Trim();
                temp.ThoiGian = DateTime.Now;
                temp.Token = token;
                db.PhienDangNhaps.Add(temp);
                db.SaveChanges();
                return Json("Thành công , các thiết bị khác sẽ phải đăng nhập lại nếu muốn truy cập hệ thống");
            }
            else
                return Json("Đổi mật khẩu thành công");
        }
        [HttpPost]
        public bool ChangeUserInfoResult()
        {


            string TenDN = MyClass.Instance(Request.Cookies["LogSession"].Value).TenDangNhap.Trim();
            if (TenDN == null)
                return false;
            var check = db.NguoiDungs.SingleOrDefault(x => x.TenDangNhap.Trim() == TenDN);
            if (check != null)
            {
                check.TenThat = Request.Params["Ten"];
                check.Email = Request.Params["Email"];
                check.NgaySinh = DateTime.Parse(Request.Params["NgaySinh"].Replace('-', '/'));
                check.DiaChi = Request.Params["DiaChi"];
                if (Request.Params["GioiTinh"] == "0")
                    check.GioiTinh = false;
                else
                    check.GioiTinh = true;
                check.SoDienThoai = Request.Params["SDT"];
                if (ModelState.IsValid)
                {
                    try
                    {
                        db.SaveChanges();
                        return true;
                    }
                    catch (Exception)
                    {
                        return false;
                    }
                }
                else
                    return false;

            }
            else
                return false;
        }
        [HttpPost]
        public bool RegisterResult()
        {
            if (Check_Email_Already() && Check_User_Already())
                return false;
            string tenDN = Request.Params["TenDN"].ToUpper().ToString();
            int max = db.NguoiDungs.Count();
            string Salt = MaHoa.GetRandomSalt() + max.ToString();
            NguoiDung user = new NguoiDung();
            user.TenDangNhap = Request.Params["TenDN"];
            user.SaltString = Salt;
            user.MatKhau = MaHoa.HashPassword(Request.Params["MatKhau"], Salt);
            user.TenThat = Request.Params["Ten"];
            user.Email = Request.Params["Email"];
            user.NgaySinh = DateTime.Parse(Request.Params["NgaySinh"].Replace('-', '/'));
            user.DiaChi = Request.Params["DiaChi"];
            user.GioiTinh = (Request.Params["GioiTinh"] == "1");
            user.SoDienThoai = Request.Params["SDT"];
            user.TrangThai = true;
            user.PhanQuyen = 1;
            user.DaXoa = false;
            if (ModelState.IsValid)
            {
                try
                {
                    db.NguoiDungs.Add(user);
                    db.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
            else
                return false;

        }

        public ActionResult Logout(string current)
        {
            if (Request.Cookies["LogSession"] != null)
            {
                HttpCookie myCookie = new HttpCookie("LogSession");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);
            }
            if (Request.Cookies["Cart"] != null)
            {
                HttpCookie myCookie = new HttpCookie("Cart");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);
            }
            Session["sessionUser"] = null;
            return Redirect(current);
        }
        public ActionResult QuanLyTaiKhoan()
        {
            if (Request.Cookies["LogSession"] == null)
                return Redirect("~/Home");
            return View();

        }
        [HttpPost]
        public ActionResult ThongTinTaiKhoan_Partial()
        {
            if (Request.Cookies["LogSession"] == null)
                return null;
            NguoiDung user = MyClass.Instance(Request.Cookies["LogSession"].Value);
            return PartialView(user);
        }
        public ActionResult DonHangCuaToi_Partial()
        {
            if (Request.Cookies["LogSession"] == null)
                return null;
            NguoiDung user = MyClass.Instance(Request.Cookies["LogSession"].Value);
            string TenDN = user.TenDangNhap;
            var lst = db.HoaDons.Where(x => x.TenDangNhap.Trim() == TenDN).ToList();
            if (lst == null)
                return Redirect("~/Home");
            return PartialView(lst);
        }
        public ActionResult CatNhatTaiKhoan()
        {
            if (Request.Cookies["LogSession"] == null)
                return null;
            NguoiDung user = MyClass.Instance(Request.Cookies["LogSession"].Value);
            if (user == null)
                return Redirect("~/Home");
            return PartialView(user);
        }

        [HttpPost]
        public ActionResult DoiMatKhau_Partial()
        {
            return PartialView();
        }

    }
}