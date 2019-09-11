using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_V_2018.Models;
using PagedList;
using PagedList.Mvc;
namespace Project_V_2018.Controllers
{
    public class HomeController : Controller
    {

        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        // GET: Home_
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult TaiKhoanGiaoDich()
        {
            var TK = db.TaiKhoanNganHangs.ToList();
            return View(TK);
        }
        public ActionResult Error404()
        {
            return View();
        }
        public ActionResult KetQuaTimKiem(int? _Page)
        {
            string TuKhoa = Request.Params["txt_TimKiem"];
            int maLoai = int.Parse(Request.Params["Loai"]);
            ViewBag.TuKhoa = TuKhoa;
            ViewBag.MaLoai = maLoai;
            List<SanPham> lstSach;
            if (maLoai<=0)
            {
               lstSach = db.SanPhams.Where(n => n.TenSP.Contains(TuKhoa) && n.TonKho > 0 && n.TrangThai == true).ToList();
            }
            else
            {
               lstSach = db.SanPhams.Where(n => n.TenSP.Contains(TuKhoa) && n.TonKho > 0 && n.TrangThai == false  && n.MaLoai == maLoai).ToList();
            }
            int pageNumber = (_Page ?? 1);
            int pageSize = 30;
            if (lstSach.Count == 0)
            {
                ViewBag.ThongBao = "Không tìm thấy sản phẩm bạn yêu cầu !";
                return View();
            }

            ViewBag.ThongBao = "Đã tìm thấy " + lstSach.Count.ToString() + " sản phẩm :";
            return View(lstSach.OrderBy(n => n.TenSP).ToPagedList(pageNumber, pageSize));
        }

        [HttpGet]
        public ActionResult KetQuaTimKiem(string _TuKhoa,int maLoai, int? _Page)
        {
            ViewBag.TuKhoa = _TuKhoa;
            ViewBag.MaLoai = maLoai;
            List<SanPham> lstSach;
            if (maLoai <= 0)
            {
                lstSach = db.SanPhams.Where(n => n.TenSP.Contains(_TuKhoa) && n.TonKho > 0 && n.TrangThai == true ).ToList();
            }
            else
            {
                lstSach = db.SanPhams.Where(n => n.TenSP.Contains(_TuKhoa) && n.TonKho > 0 && n.TrangThai == true && n.MaLoai == maLoai).ToList();
            }
            int pageNumber = (_Page ?? 1);
            int pageSize = 30;
            if (lstSach.Count == 0)
            {
                ViewBag.ThongBao = "Không tìm thấy sản phẩm bạn yêu cầu !";
                return View();
            }
            ViewBag.ThongBao = "Đã tìm thấy " + lstSach.Count.ToString() + "sản phẩm :";
            return View(lstSach.OrderBy(n => n.TenSP).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Introduce()
        {
            var CH = db.CuaHangs.Single(x => x.ID == 1);
            return View(CH);
        }
        public ActionResult Security()
        {
            return View();
        }
        public ActionResult HDMuaHang()
        {
            return View();
        }
        public ActionResult HDThanhToan()
        {
            return View();
        }
        public PartialViewResult Products_Partical()
        {
            var SanPham = db.SanPhams.ToList().Where(x => x.TrangThai==true);
            return PartialView(SanPham);
        }
        public PartialViewResult ADV_Partical()
        {
            var SPMoi = db.SanPhams.Take(6).Where(x => x.Moi == true);
            return PartialView(SPMoi);
        }
        public PartialViewResult Footer_Partical()
        {
            var CH = db.CuaHangs.SingleOrDefault(x=>x.ID==1);
            return PartialView(CH);
        }

        public PartialViewResult Partner_Paritical()
        {
            return null;
        }
        public PartialViewResult SlideShow_Partical()
        {
            List<Slider> lst= db.Sliders.OrderBy(x=>x.ThuTu).ThenBy(x=>x.NgayTao).ToList();
            return PartialView(lst);
        }
        public ActionResult Info_Partical()
        {
            var CH = db.CuaHangs.SingleOrDefault(x => x.ID == 1);
            if (CH == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(CH);
        }
        public ActionResult Views()
        {
            return View();
        }
        public PartialViewResult Header_Partical()
        {
            var LoaiSP = db.LoaiHangs.ToList().OrderBy(x => x.MaLoai);
            return PartialView(LoaiSP);
        }
    }
}