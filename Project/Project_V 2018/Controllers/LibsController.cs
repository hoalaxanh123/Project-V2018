using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_V_2018.Controllers
{
    public class LibsController : Controller
    {
        // GET: Libs
        public ActionResult Index()
        {
            return View();
        }
        public static string Convert_VND(decimal money)
        {
            return money.ToString("0,0", System.Globalization.CultureInfo.InvariantCulture);
        }
    }
}