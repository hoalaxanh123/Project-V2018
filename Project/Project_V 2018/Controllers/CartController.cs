using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Project_V_2018.Models;
using Project_V_2018.Classes;
namespace Project_V_2018.Controllers
{
    public class Data
    {
        public string MaSP { get; set; }
        public string SoLuong { get; set; }
    }

    public class CartController : Controller
    {
        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        // GET: Cart
        //----------------------------------------------Cookie--------------------------------------
        public void CartsToCookie(List<GioHang> LST)
        {
            try
            {
                string JSonList = JsonConvert.SerializeObject(LST, Formatting.Indented);
                HttpCookie cookie = new HttpCookie("Cart")
                {
                    Value = Server.UrlEncode(JSonList),
                    Expires = DateTime.Now.AddYears(1)


                };
                if (Request.Cookies["Cart"] != null)
                {
                    HttpCookie myCookie = new HttpCookie("Cart");
                    myCookie.Expires = DateTime.Now.AddDays(-1d);
                    Response.Cookies.Add(myCookie);
                }
                Response.Cookies.Add(cookie);
            }
            catch (Exception)
            {

            }

        }
        public List<GioHang> CookieToCarts()
        {
            try
            {
                if (Request.Cookies["LogSession"] == null)
                {
                    var cookie = Request.Cookies["Cart"];
                    if (cookie == null)
                    {
                        List<GioHang> async = new List<GioHang>();
                        return async;
                    }
                    string ValueCookie = Server.UrlDecode(cookie.Value);//Decode dịch ngược mã  các ký tự đặc biệt tham khảo http://www.aspnut.com/reference/encoding.asp
                                                                        //ViewBag.ValueCookie = ValueCookie;// show value cookie to View
                    var lst_GH = JsonConvert.DeserializeObject<List<GioHang>>(ValueCookie);// convert json to  list object
                    if (lst_GH == null)
                    {
                        lst_GH = new List<GioHang>();
                    }
                    return lst_GH;
                }
                else
                {
                    var lst_GH = db.GioHangs.ToList();
                    if (lst_GH == null)
                    {
                        lst_GH = new List<GioHang>();
                    }
                    return lst_GH;
                }
            }
            catch (Exception)
            {
                //Trường hợp cookie giỏ hàng k hợp lệ -->tiễn
                if (Request.Cookies["Cart"] != null)
                {
                    HttpCookie myCookie = new HttpCookie("Cart");
                    myCookie.Expires = DateTime.Now.AddDays(-1d);
                    Response.Cookies.Add(myCookie);
                }
                var lst_GH = db.GioHangs.ToList();
                if (lst_GH == null)
                {
                    lst_GH = new List<GioHang>();
                }
                return lst_GH;
            }

        }
        [HttpPost]
        public JsonResult ThemGioHang(Data data)
        {
            int maSP, soLuong;
            maSP = int.Parse(data.MaSP);
            soLuong = int.Parse(data.SoLuong);
            if (soLuong > 100)
                soLuong = 100;
            if (soLuong < 0)
                soLuong = 1;
            //Kiểm tra xem sản phẩm có trong database hay chưa
            //Chống kỹ thuật hack bằng thay url
            SanPham sp = db.SanPhams.SingleOrDefault(x => x.MaSP == maSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return Json("false");
            }

            if (Request.Cookies["LogSession"] == null)
            {
                List<GioHang> lstGioHang = CookieToCarts();
                GioHang gioHang = lstGioHang.Find(n => n.maSanPham == maSP);

                if (gioHang == null)
                {
                    gioHang = new GioHang(maSP, soLuong);
                    lstGioHang.Add(gioHang);
                }
                else
                {
                    gioHang.SoLuong += soLuong;
                    if (gioHang.SoLuong > 100)
                        gioHang.SoLuong = 100;
                    gioHang.ThanhTien = gioHang.SoLuong * gioHang.DonGia;
                    lstGioHang.RemoveAll(x => x.maSanPham == maSP);
                    lstGioHang.Add(gioHang);
                }
                CartsToCookie(lstGioHang);
                return Json("true");

            }
            else
            {
                var user = MyClass.Instance(Request.Cookies["LogSession"].Value);
                if (user == null)
                    return Json("faile");
                GioHang temp = CookieToCarts().Find(x => x.TenDangNhap == user.TenDangNhap && x.maSanPham == maSP);

                if (temp == null)
                {
                    GioHang gioHang = new GioHang(maSP, soLuong, user.TenDangNhap);
                    db.GioHangs.Add(gioHang);
                    db.SaveChanges();
                }
                else
                {
                    GioHang gioHang = db.GioHangs.Find(temp.MaGioHang);
                    gioHang.SoLuong += soLuong;
                    gioHang.ThanhTien = gioHang.SoLuong * gioHang.DonGia;
                    gioHang.TenDangNhap = user.TenDangNhap;
                    db.SaveChanges();
                }
            }
            return Json("true");
        }

        public ActionResult TienHanhThanhToan()
        {
            //MVC !=postback
            if (Request.Cookies["LogSession"] == null)
            {
                if (Request.Cookies["Cart"] == null)
                    return Redirect("~/Cart/GioHang");
                List<GioHang> lstGioHang = CookieToCarts();
                if (lstGioHang.Count == 0)
                    return Redirect("~/Home");
                return View(lstGioHang);
            }
            else
            {
                NguoiDung a = MyClass.Instance(Request.Cookies["LogSession"].Value);
                if (a == null)
                {
                    BaseController.XoaCookieDangNhap();
                    return Redirect("~/Cart/GioHang");
                }

                if (db.GioHangs.Where(x => x.TenDangNhap.Trim() == a.TenDangNhap.Trim()).ToList().Count == 0)
                {
                    return Redirect("~/Cart/GioHang");
                }
                List<GioHang> lstGioHang = CookieToCarts();
                if (lstGioHang.Count == 0)
                    return Redirect("~/Cart/GioHang");
                return View(lstGioHang);
            }
        }
        public ActionResult GioHang()
        {
            if (Request.Cookies["LogSession"] == null)
            {
                if (Request.Cookies["Cart"] == null)
                {
                    List<GioHang> lst = new List<GioHang>();
                    return View(lst);
                }
                List<GioHang> lstGioHang = CookieToCarts();
                lstGioHang.Sort((a, b) => a.tenSanPham.CompareTo(b.tenSanPham));
                return View(lstGioHang);
            }
            else
            {
                List<GioHang> lstGioHang = CookieToCarts();
                lstGioHang.Sort((a, b) => a.tenSanPham.CompareTo(b.tenSanPham));
                return View(lstGioHang);
            }
        }
        public ActionResult DSGioHang_Partial()
        {
            if (Request.Cookies["LogSession"] == null)
            {
                if (Request.Cookies["Cart"] == null)
                {
                    return null;
                }
                List<GioHang> lstGioHang = CookieToCarts();
                lstGioHang.Sort(
                    (a, b) => a.tenSanPham.CompareTo(b.tenSanPham)
                    );
                return PartialView(lstGioHang);
            }
            else
            {
                List<GioHang> lstGioHang = CookieToCarts();
                lstGioHang.Sort(
                    (a, b) => a.tenSanPham.CompareTo(b.tenSanPham)
                    );
                return PartialView(lstGioHang);
            }

        }
        public int TinhTongSoLuong()
        {
            List<GioHang> lstGioHang = new List<GioHang>();
            lstGioHang = CookieToCarts();
            int TongSoLuong = 0;
            if (lstGioHang != null)
                TongSoLuong = lstGioHang.Sum(x => x.SoLuong);
            return TongSoLuong;
        }
        public decimal TinhTongTien()
        {
            List<GioHang> lstGioHang = new List<GioHang>();
            lstGioHang = CookieToCarts();
            decimal TongTien = 0;
            if (lstGioHang != null)
                TongTien = lstGioHang.Sum(x => x.ThanhTien);
            return TongTien;
        }
        [HttpPost]
        public ActionResult GioHangPartial()
        {
            ViewBag.TongSoLuong = TinhTongSoLuong();
            return PartialView();
        }
        [HttpPost]
        public ActionResult GioHangTongTien()
        {
            ViewBag.TongTien = TinhTongTien();
            return PartialView();
        }
        [HttpPost]
        public JsonResult SuaGioHang(Data data)
        {
            int maSP, soLuong;
            maSP = int.Parse(data.MaSP);
            soLuong = int.Parse(data.SoLuong);
            if (soLuong < 0)
                soLuong = 1;
            //Kiểm tra xem sản phẩm có trong database hay chưa
            //Chống kỹ thuật hack bằng thay url
            SanPham sp = db.SanPhams.SingleOrDefault(x => x.MaSP == maSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return Json("False");
            }
            if (Request.Cookies["LogSession"] == null)
            {
                List<GioHang> lstGioHang = CookieToCarts();
                //Kiểm tra xem sản phẩm đã có trong session giỏ hàng hay chưa
                GioHang gioHang = lstGioHang.Find(n => n.maSanPham == maSP);
                if (gioHang != null)
                {
                    gioHang.SoLuong = soLuong;
                    gioHang.ThanhTien = gioHang.SoLuong * gioHang.DonGia;
                    lstGioHang.RemoveAll(x => x.maSanPham == maSP);
                    lstGioHang.Add(gioHang);
                }
                CartsToCookie(lstGioHang);
                return Json("true");
            }
            else
            {
                var user = MyClass.Instance(Request.Cookies["LogSession"].Value);
                if (user == null)
                    return Json("faile");
                GioHang temp = CookieToCarts().Find(x => x.TenDangNhap == user.TenDangNhap && x.maSanPham == maSP);
                GioHang gioHang = db.GioHangs.Find(temp.MaGioHang);
                if (temp != null)
                {
                    gioHang.SoLuong = soLuong;
                    gioHang.ThanhTien = gioHang.SoLuong * gioHang.DonGia;
                    db.SaveChanges();
                }
                else
                    return Json("false");
                return Json("true");
            }
        }

        [HttpPost]
        public ActionResult TaoHoaDon()
        {
            if (Request.Cookies["LogSession"] == null)
            {
                if (Request.Cookies["Cart"] == null)
                    return Redirect("~/Cart/GioHang");
            }
            else
            {
                NguoiDung a = MyClass.Instance(Request.Cookies["LogSession"].Value);
                if (a == null)
                {
                    BaseController.XoaCookieDangNhap();
                    return Redirect("~/Cart/GioHang");
                }
                if (db.GioHangs.Where(x => x.TenDangNhap.Trim() == a.TenDangNhap.Trim()).ToList().Count == 0)
                {
                    return Redirect("~/Cart/GioHang");
                }
            }
            string hoTen = Request.Params["HoTen"].Trim();
            string diachi = Request.Params["DiaChi"].Trim();
            string sDT = Request.Params["SoDienThoai"].Trim();
            string eMail = Request.Params["Email"].Trim();


          

            int kieuThanhToan = int.Parse(Request.Params["KieuThanhToan"].Trim());
            string ghiChu = Request.Params["GhiChu"].Trim();
            string TenDangNhap = Request.Params["TenDangNhap1"].Trim();

            HoaDon hd = new HoaDon();
            hd.PhuongThucThanhToan = kieuThanhToan;
            hd.DaXoa = false;
            hd.DiaChi = diachi;
            hd.Email = eMail;
            hd.GhiChu = ghiChu;
            hd.NgayTao = DateTime.Now;
            hd.NguoiTao = hoTen;
            hd.SDT = sDT;
            hd.TrangThai = 0;
            hd.TrangThai = 0;
            hd.TenDangNhap = TenDangNhap;
            hd.TongTien = TinhTongTien();
            db.HoaDons.Add(hd);
            db.SaveChanges();
            if (Request.Cookies["LogSession"] == null)
            {
                var lst = CookieToCarts();
                foreach (var item in lst)
                {
                    ChiTietHoaDon ctHD = new ChiTietHoaDon();
                    ctHD.DaXoa = false;
                    ctHD.GiaThanh = item.DonGia;
                    ctHD.MaHD = hd.MaHD;
                    ctHD.SoLuong = item.SoLuong;
                    ctHD.TenSanPham = item.tenSanPham;
                    ctHD.ThanhTien = item.ThanhTien;
                    db.ChiTietHoaDons.Add(ctHD);
                    db.SaveChanges();
                }
                if (Request.Cookies["Cart"] != null)
                {
                    HttpCookie myCookie = new HttpCookie("Cart");
                    myCookie.Expires = DateTime.Now.AddDays(-1d);
                    Response.Cookies.Add(myCookie);
                }

             

            }
            else
            {
                var lst = CookieToCarts();
                foreach (var item in lst)
                {
                    ChiTietHoaDon ctHD = new ChiTietHoaDon();
                    ctHD.DaXoa = false;
                    ctHD.GiaThanh = item.DonGia;
                    ctHD.MaHD = hd.MaHD;
                    ctHD.SoLuong = item.SoLuong;
                    ctHD.TenSanPham = item.tenSanPham;
                    ctHD.ThanhTien = item.ThanhTien;
                    db.ChiTietHoaDons.Add(ctHD);
                    db.GioHangs.Remove(item);
                    db.SaveChanges();
                }
                if (Request.Cookies["Cart"] != null)
                {
                    HttpCookie myCookie = new HttpCookie("Cart");
                    myCookie.Expires = DateTime.Now.AddDays(-1d);
                    Response.Cookies.Add(myCookie);
                }
            }
            //Gửi email đi
            var cH = db.CuaHangs.SingleOrDefault(x => x.ID == 1);
            string mailCH = cH.Email;
            string web = cH.Website;
            string tenCH = cH.TenCuaHang;
            string link = web + "/Order/XemHoaDon?MaHD=" + hd.MaHD;
            //gửi link cho chủ cửa hàng
            MyClass.SendEmail(mailCH, "Bạn có đơn đặt hàng mới", "Xin chào " + tenCH + ",\nBạn đang có đơn đặt hàng mới , nhấn vào đây để xem thông tin đơn hàng (Lưu ý , bạn phải đăng nhập với tài khoản quản trị) : \n" + link);
            //gửi link cho khách hàng
            if(eMail!="")
            MyClass.SendEmail(eMail, "Bạn có đơn đặt hàng mới", "Xin chào " + hoTen + ",\nBạn đang có đơn đặt hàng mới , nhấn vào đây để xem thông tin đơn hàng : \n" + link+"\nNếu bạn không phải người đặt hàng này , hãy bỏ qua mail này.\nXin trân trọng cảm ơn");
            return Redirect("~/Order/XemHoaDon?MaHD=" + hd.MaHD);
        }

        [HttpPost]
        public JsonResult XoaGioHang(Data data)
        {
            int maSP = int.Parse(data.MaSP);
            //Kiểm tra xem sản phẩm có trong database hay chưa
            //Chống kỹ thuật hack bằng thay url
            SanPham sp = db.SanPhams.SingleOrDefault(x => x.MaSP == maSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return Json("false");
            }
            if (Request.Cookies["LogSession"] == null)
            {
                List<GioHang> lstGioHang = CookieToCarts();
                GioHang gioHang = lstGioHang.SingleOrDefault(x => x.maSanPham == maSP);
                if (gioHang != null)
                {
                    lstGioHang.RemoveAll(x => x.maSanPham == maSP);
                }
                CartsToCookie(lstGioHang);
            }
            else
            {
                var user = MyClass.Instance(Request.Cookies["LogSession"].Value);
                if (user == null)
                    return Json("false");
                GioHang temp = CookieToCarts().Find(x => x.TenDangNhap == user.TenDangNhap && x.maSanPham == maSP);
                GioHang gioHang = db.GioHangs.Find(temp.MaGioHang);
                if (temp != null)
                {
                    db.GioHangs.Remove(gioHang);
                    db.SaveChanges();
                }
                else
                    return Json("false");
            }
            return Json("true");
        }

        //----------------------------------------------Session--------------------------------------

        //public ActionResult TienHanhThanhToan()
        //{
        //    if (Session["GioHang"] == null)
        //    {
        //        return Redirect("~/Home");
        //    }
        //    List<GioHang> lstGioHang = LayGioHang();
        //    if (lstGioHang.Count == 0)
        //        return Redirect("~/Home");
        //    return View(lstGioHang);
        //}
        //public ActionResult GioHang()
        //{
        //    if (Session["GioHang"] == null)
        //    {
        //        //return RedirectToAction("Index", "Home");
        //        return null;
        //    }
        //    List<GioHang> lstGioHang = LayGioHang();
        //    return View(lstGioHang);
        //}
        //public ActionResult DSGioHang_Partial()
        //{
        //    if (Session["GioHang"] == null)
        //    {
        //        return null;
        //    }
        //    List<GioHang> lstGioHang = LayGioHang();
        //    return PartialView(lstGioHang);
        //}
        //public int TinhTongSoLuong()
        //{
        //    int TongSoLuong = 0;
        //    List<GioHang> lstGioHang = LayGioHang();
        //    if (lstGioHang != null)
        //        TongSoLuong = lstGioHang.Sum(x => x.SoLuong);
        //    return TongSoLuong;
        //}
        //public decimal TinhTongTien()
        //{
        //    decimal TongTien = 0;
        //    List<GioHang> lstGioHang = LayGioHang();
        //    if (lstGioHang != null)
        //        TongTien = lstGioHang.Sum(x => x.ThanhTien);
        //    return TongTien;
        //}
        //public List<GioHang> LayGioHang()
        //{
        //    Session.Timeout = 9999;
        //    List<GioHang> ListGioHang = Session["GioHang"] as List<GioHang>;
        //    if (Session["GioHang"] == null)
        //    {
        //        ListGioHang = new List<GioHang>();
        //        Session["GioHang"] = ListGioHang;
        //    }
        //    return ListGioHang;
        //}

        //[HttpPost]
        //public ActionResult GioHangPartial()
        //{
        //    ViewBag.TongSoLuong = TinhTongSoLuong();
        //    return PartialView();
        //}

        //[HttpPost]
        //public ActionResult GioHangTongTien()
        //{
        //    ViewBag.TongTien = TinhTongTien();
        //    return PartialView();
        //}

        //[HttpPost]
        //public JsonResult ThemGioHang(Data data)
        //{

        //    int maSP, soLuong;
        //    maSP = int.Parse(data.MaSP);
        //    soLuong = int.Parse(data.SoLuong);
        //    //Kiểm tra xem sản phẩm có trong database hay chưa
        //    //Chống kỹ thuật hack bằng thay url
        //    SanPham sp = db.SanPhams.SingleOrDefault(x => x.MaSP == maSP);
        //    if (sp == null)
        //    {
        //        Response.StatusCode = 404;
        //        return Json("false");
        //    }
        //    List<GioHang> lstGioHang = LayGioHang();
        //    //Kiểm tra xem sản phẩm đã có trong session giỏ hàng hay chưa
        //    GioHang gioHang = lstGioHang.Find(n => n.maSanPham == maSP);
        //    //Nếu chưa -->tạo
        //    if (gioHang == null)
        //    {
        //        gioHang = new GioHang(maSP, soLuong);
        //        gioHang.SoLuong = soLuong;
        //        lstGioHang.Add(gioHang);
        //    }
        //    else
        //    {
        //        gioHang.SoLuong += soLuong;
        //        gioHang.ThanhTien = gioHang.SoLuong * gioHang.DonGia;
        //        lstGioHang.RemoveAll(x => x.maSanPham == maSP);
        //        lstGioHang.Add(gioHang);
        //    }
        //    return Json("true");
        //}

        //[HttpPost]
        //public JsonResult SuaGioHang(Data data)
        //{
        //    int maSP, soLuong;
        //    maSP = int.Parse(data.MaSP);
        //    soLuong = int.Parse(data.SoLuong);
        //    //Kiểm tra xem sản phẩm có trong database hay chưa
        //    //Chống kỹ thuật hack bằng thay url
        //    SanPham sp = db.SanPhams.SingleOrDefault(x => x.MaSP == maSP);
        //    if (sp == null)
        //    {
        //        Response.StatusCode = 404;
        //        return Json("False");
        //    }
        //    List<GioHang> lstGioHang = LayGioHang();
        //    //Kiểm tra xem sản phẩm đã có trong session giỏ hàng hay chưa
        //    GioHang gioHang = lstGioHang.Find(n => n.maSanPham == maSP);
        //    //Nếu chưa -->tạo
        //    if (gioHang != null)
        //    {
        //        gioHang.SoLuong = soLuong;
        //        gioHang.ThanhTien = gioHang.SoLuong * gioHang.DonGia;
        //        lstGioHang.RemoveAll(x => x.maSanPham == maSP);
        //        lstGioHang.Add(gioHang);
        //    }
        //    return Json("true");
        //}

        //[HttpPost]
        //public ActionResult TaoHoaDon()
        //{

        //    string hoTen = Request.Params["HoTen"].Trim();
        //    string diachi = Request.Params["DiaChi"].Trim();
        //    string sDT = Request.Params["SoDienThoai"].Trim();
        //    string eMail = Request.Params["Email"].Trim();
        //    string ghiChu = Request.Params["GhiChu"].Trim();
        //    string TenDangNhap = Request.Params["TenDangNhap1"].Trim();

        //    HoaDon hd = new HoaDon();
        //    hd.DaXoa = false;
        //    hd.DiaChi = diachi;
        //    hd.Email = eMail;
        //    hd.GhiChu = ghiChu;
        //    hd.NgayTao = DateTime.Now;
        //    hd.NguoiTao = hoTen;
        //    hd.SDT = sDT;
        //    hd.TrangThai = 0;
        //    hd.TrangThai = 0;
        //    hd.TenDangNhap = TenDangNhap;
        //    hd.TongTien = TinhTongTien();
        //    db.HoaDons.Add(hd);
        //    db.SaveChanges();

        //    var lst = LayGioHang();
        //    foreach (var item in lst)
        //    {
        //        ChiTietHoaDon ctHD = new ChiTietHoaDon();
        //        ctHD.DaXoa = false;
        //        ctHD.GiaThanh = item.DonGia;
        //        ctHD.MaHD = hd.MaHD;
        //        ctHD.SoLuong = item.SoLuong;
        //        ctHD.TenSanPham = item.tenSanPham;
        //        ctHD.ThanhTien = item.ThanhTien;
        //        db.ChiTietHoaDons.Add(ctHD);
        //        db.SaveChanges();
        //    }
        //    Session["GioHang"] = null;
        //    return Redirect("~/Order/XemHoaDon?MaHD=" + hd.MaHD);
        //}

        //[HttpPost]
        //public JsonResult XoaGioHang(Data data)
        //{
        //    int maSP = int.Parse(data.MaSP);
        //    //Kiểm tra xem sản phẩm có trong database hay chưa
        //    //Chống kỹ thuật hack bằng thay url
        //    SanPham sp = db.SanPhams.SingleOrDefault(x => x.MaSP == maSP);
        //    if (sp == null)
        //    {
        //        Response.StatusCode = 404;
        //        return Json("false");
        //    }
        //    List<GioHang> lstGioHang = LayGioHang();
        //    GioHang gioHang = lstGioHang.SingleOrDefault(x => x.maSanPham == maSP);
        //    if (gioHang != null)
        //    {
        //        lstGioHang.RemoveAll(x => x.maSanPham == maSP);
        //    }
        //    return Json("true");
        //}

    }
}