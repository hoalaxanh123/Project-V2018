using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using BCrypt.Net;
namespace Project_V_2018.Models
{
    public class MaHoa
    {
        public static string GetRandomSalt()
        {
            return BCrypt.Net.BCrypt.GenerateSalt(12);
        }
        public static string HashPassword(string password , string Salt)
        {
            return BCrypt.Net.BCrypt.HashPassword(password, Salt);
        }
        public static bool ValidatePassword(string password, string passwordDB)
        {
            return password.CompareTo(passwordDB)==0;
        }
    }
}