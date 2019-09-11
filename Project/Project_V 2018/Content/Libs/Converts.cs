using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Project_V_2018.Content.Libs
{
    public static class Converts
    {
        public static string Convert_VND(decimal SoTien)
        {
            return SoTien.ToString("0,0", System.Globalization.CultureInfo.InvariantCulture) + " VND";
        }
    }
}