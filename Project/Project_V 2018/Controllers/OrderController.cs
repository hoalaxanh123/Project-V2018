using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_V_2018.Models;
namespace Project_V_2018.Controllers
{
    public class OrderController : Controller
    {
        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        // GET: Order
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult KetQuaDangKyGioHang()
        {
            return View();
        }
        public ActionResult KiemTraDonHang()
        {
            return View();

        }
        [HttpPost]
        public ActionResult TimHD_Partial()
        {
           
            try
            {
                int maHD = int.Parse(Request.Params["MaHD"]);
                HoaDon Hd = db.HoaDons.SingleOrDefault(x => x.MaHD == maHD);
                return View(Hd);
            }
            catch (Exception)
            {
                return (null);
            }
           
            
        }

        [HttpPost]
        public bool TaoHoaDon()
        {
            string temp = Request.Params["data"];
            return false;
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
        [HttpPost]
        public bool XacNhanDonHang()
        {
            if (IsAdmin_Local() == false)
                return false;
            int ID =int.Parse( Request.Params["ID"]);
            var order = db.HoaDons.SingleOrDefault(x => x.MaHD == ID);
            order.TrangThai = 1;
            db.SaveChanges();
            return false;
        }

        public ActionResult XemHoaDon(int MaHD)
        {
            int maHoaDon = MaHD;
            try
            {
                HoaDon Hd = db.HoaDons.SingleOrDefault(x => x.MaHD == maHoaDon);
                if (Hd == null)
                    return Redirect("~/Home");
                return View(Hd);
            }
            catch (Exception)
            {
                return Redirect("~/Home");
            }
           
        }
        public PartialViewResult DanhSachCTHoaDon_Partial()
        {
            int maHD = int.Parse(Request.Params["MaHD"]);
            var lst = db.ChiTietHoaDons.Where(x => x.MaHD == maHD);
            return PartialView(lst);
        }

    }
}