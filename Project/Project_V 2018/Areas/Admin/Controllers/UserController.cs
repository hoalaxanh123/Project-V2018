using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_V_2018.Classes;
using Project_V_2018.Models;
namespace Project_V_2018.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        UserManagement userMNG = new UserManagement();
        // GET: Admin/User
        public ActionResult Index()
        {
            return View();
        }
        bool IsAdmin()
        {
            if (Request.Cookies["LogSession"] != null)
            {
               var user=  MyClass.Instance(Request.Cookies["LogSession"].Value);
                if (user.PhanQuyen != 0)
                    return false;
                return true;
            }
            return false;
        }
        //public ActionResult DoiThongTin()
        //{
        //    //var userName = 
        //    //userMNG.GetUserByUserName(userName);
        //    //return View();
        //}
    }
}