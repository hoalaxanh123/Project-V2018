using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_V_2018.Areas.Admin
{
    public class BaseAdminController : Controller
    {
        // GET: Admin/BaseAdmin
        public ActionResult Index()
        {
            return View();
        }
       
    }
}