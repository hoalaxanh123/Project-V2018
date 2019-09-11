using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_V_2018.Models;
namespace Project_V_2018.Controllers
{
    public class StoreController : Controller
    {
        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        // GET: Store
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult HoTroTrucTuyen_Partial()
        {
            var ThongTin = db.TaiKhanMXHs.ToList();
            if (ThongTin == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ThongTin);
        }
        public ActionResult BuyGuide_Partical()
        {
            var CH = db.CuaHangs.SingleOrDefault(x => x.ID == 1);
            if (CH == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(CH);
        }
        public PartialViewResult HotLine_Header_Partical()
        {
            var CH = db.CuaHangs.SingleOrDefault(x => x.ID == 1);
            if (CH == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return PartialView(CH);
        }
        public PartialViewResult Logo_Header_Partical()
        {
            var CH = db.CuaHangs.SingleOrDefault(x => x.ID == 1);
            if (CH == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return PartialView(CH);
        }
    }
}