using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_V_2018.Models;
namespace Project_V_2018.Controllers
{
    
    public class BankAccountController : Controller
    {
        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        // GET: BankAccount
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult DSTaiKhoan()
        {
            var lst = db.TaiKhoanNganHangs.ToList();
            return PartialView(lst);
        }
    }
}