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
    public class ProductsController : Controller
    {
        // GET: Sach
        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult TrangChuSP_Partial()
        {
            var lst = db.SanPhams.Take(24).Where(x => x.HienThiTrenTrangChu==true && x.Hot==true && x.TrangThai==true).ToList();
            return PartialView(lst);
        }
        [HttpPost]
        public ActionResult Products_All()
        {
            int page = int.Parse(Request.Params["Page"]);
            if (page < 0)
                page = 1;

            int limit = int.Parse(Request.Params["Limit"]);
            int maLoai = int.Parse(Request.Params["MaLoai"]);
            ViewBag.MaLoai = maLoai;
            int TongSP = db.SanPhams.ToList().Count;

            if (limit < 0)
                limit = TongSP;
            int soTrang = TongSP / limit;
            if (TongSP % limit != 0)
                soTrang++;
            if (page > soTrang)
                page = soTrang;

            var listPR = db.SanPhams.Where(x=>x.MaLoai==maLoai).ToList().OrderBy(x => x.MaSP).ToPagedList(page, limit);
            
            if (page > soTrang)
                return Redirect("~/Home");
            return PartialView(listPR);
        }
        [HttpPost]
        public ActionResult ThanhPhanTrang_Partial()
        {
            int TongSP = db.SanPhams.ToList().Count;
            if(TongSP==0)
                return PartialView(1);
            int limit = int.Parse(Request.Params["Limit"]);
            if (limit < 0)
                limit = TongSP;
            int soTrang = TongSP / limit;
            if (TongSP % limit != 0)
                soTrang++;
            return PartialView(soTrang);
        }
        public ViewResult ProductDetail_Partical(int MaSP)
        {
            try
            {
                var pr = db.SanPhams.SingleOrDefault(s => s.MaSP == MaSP);
                if (pr == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                return View(pr);
            }
            catch (Exception)
            {
                Response.StatusCode = 404;
                return null;
            }


        }
        public PartialViewResult HostProducts_LeftMenu_Partical()
        {
            var listPR = db.SanPhams.Take(4).Where(x => x.Hot == true);
            return PartialView(listPR);
        }
        public PartialViewResult Products_LoadByCast_Partial(int MaLoai)
        {
            ViewBag.MaLoai = MaLoai;
            return PartialView();
            //var listPR = db.SanPhams.Take(limit).Where(x => x.MaLoai == MaLoai).ToList();
            //return PartialView(listPR);
        }
    }
}