using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Project_V_2018.Models;
namespace Project_V_2018.Models
{
    public class MyClass
    {
        Vuong_CTK39Entities db = new Vuong_CTK39Entities();
        public static void SendEmail(string mailNhan, string tieuDe, string NoiDung)
        {
            MailMessage mail = new MailMessage("nguyenvanvuong975@gmail.com", mailNhan);
            SmtpClient client = new SmtpClient();
            client.Port = 587;
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Host = "smtp.gmail.com";
            NetworkCredential NetworkCred = new NetworkCredential("trashmailtest804@gmail.com", "huynhvade");
            client.Credentials = NetworkCred;
            mail.Subject = tieuDe;
            mail.Body = NoiDung;
            client.Send(mail);
        }
        public static string TrangThaiDonHang(int type)
        {
            switch (type)
            {
                case 0:
                    return "Đang chờ xử lý";
                case 1:
                    return "Đã xác nhận đơn hàng và đang xử lý";
                case 2:
                    return "Đã giao hàng và thu tiền";
                default:
                    return null;
            }
        }
        public NguoiDung TryToLogin(string Value)
        {
            if (HttpContext.Current.Request.Cookies["LogSession"] != null)
            {
                string IP = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName()).AddressList[1].ToString();
                string token = Value;
                if (IP != null && token != "")
                {
                    var find = db.PhienDangNhaps.SingleOrDefault(x => x.Token.CompareTo(token) == 0 && x.DiaChiIP.CompareTo(IP) == 0);
                    if (find != null)
                    {
                        var user = db.NguoiDungs.SingleOrDefault(x => x.DaXoa == false && x.TrangThai == true && x.TenDangNhap == find.TenDangNhap);
                        if (user != null)
                        {
                            //Tạo session mới
                            NguoiDung userTemp = new NguoiDung();
                            userTemp.TenDangNhap = user.TenDangNhap;
                            userTemp.PhanQuyen = user.PhanQuyen;
                            userTemp.TenThat = user.TenThat;
                            HttpContext.Current.Session["sessionUser"] = userTemp;
                            return user;
                        }
                        else
                            return null;
                    }
                    else
                        return null;
                }
                else
                    return null;


            }
            else
                return null;


        }
        public static string PhuongThucThanhToan(int type)
        {
            switch (type)
            {
                case 0:
                    return "Ship cod ( nhanh )";
                case 1:
                    return "Ship cod ( chậm )";
                case 2:
                    return "Nội thành - Nhận tại cửa hàng hoặc giao hàng tận nơi ( có phí ship )";
                default:
                    return "";
            }
        }
        public static NguoiDung Instance(string Value)
        {
            MyClass a = new MyClass();
            return a.TryToLogin(Value);
        }
        public static string ToVND(decimal money)
        {
            if (money == 0)
                return "0";
            return String.Format("{0:0,0}", money);
        }
        public static string CoKhong(bool C)
        {
            if (C)
                return "Có";
            else
                return "Không";
        }
        static int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }
        static string RandomString(int size)
        {
            byte[] randomArray = new byte[size];
            string randomString;
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            rng.GetBytes(randomArray);
            randomString = Convert.ToBase64String(randomArray);
            return randomString;
        }
        public static string MakeToken()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(RandomString(5));
            builder.Append(RandomNumber(1000, 2000));
            builder.Append(RandomString(6));
            builder.Append(RandomNumber(700, 900));
            builder.Append(RandomString(7));
            builder.Append(RandomNumber(3000, 4000));
            builder.Append(RandomString(8));
            builder.Append(RandomNumber(4000, 6000));
            return MaHoa.HashPassword(builder.ToString(), MaHoa.GetRandomSalt());
        }
    }
}