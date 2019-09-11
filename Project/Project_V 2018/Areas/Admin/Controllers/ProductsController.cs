using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_V_2018.Models;
namespace Project_V_2018.Areas.Admin.Controllers
{
    public class ProductsController : Controller
    {
        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        public class SP:SanPham
        {

        }
        // GET: Admin/Products
        public ActionResult Index()
        {
            if(Request.Cookies["LogSession"]!=null)
            {
                var user = MyClass.Instance(Request.Cookies["LogSession"].Value);
                if (user == null)
                    return Redirect("~/Admin/Home");
                var lst = db.SanPhams.ToList();
                return View(lst);
            }
            return Redirect("~/Admin/Home");
        }
        [HttpPost]
        public JsonResult XoaSP(SP sanPham)
        {
            var user = MyClass.Instance(Request.Cookies["LogSession"].Value);
            if (user == null)
                return Json("Home");
            return Json("");
        }
    }
}