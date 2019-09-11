using Project_V_2018.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_V_2018.Classes
{
    public class Products
    {
        Vuong_CTK39Entities db = null;

        public Products()
        {
            db = new Vuong_CTK39Entities();
        }
        public List<SanPham> GetAll()
        {
            return db.SanPhams.ToList();
        }



    }
}