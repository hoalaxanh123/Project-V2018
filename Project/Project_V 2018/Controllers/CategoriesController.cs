using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_V_2018.Models;
namespace Project_V_2018.Controllers
{
    public class CategoriesController : Controller
    {
        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        // GET: Categories
        public ActionResult Index()
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