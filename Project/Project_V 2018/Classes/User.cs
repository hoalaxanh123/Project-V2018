using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Project_V_2018.Models;
namespace Project_V_2018.Classes
{

    public class UserManagement
    {
        Vuong_CTK39Entities db = null;


        public UserManagement()
        {
            db = new Vuong_CTK39Entities();
        }

        public NguoiDung GetUserByUserName(string UserName)
        {
            return db.NguoiDungs.SingleOrDefault(x => x.TenDangNhap.Trim() == UserName);

            
        }




    }
}