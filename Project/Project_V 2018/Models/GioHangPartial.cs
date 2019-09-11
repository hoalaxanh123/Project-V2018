using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_V_2018.Models
{
    public partial class GioHang
    {
        public GioHang() { }
        public GioHang(int maSP, int soLuong, string tenDN)
        {
            Vuong_CTK39Entities db = new Vuong_CTK39Entities();
            this.maSanPham = maSP;
            SanPham a = db.SanPhams.SingleOrDefault(x => x.MaSP == maSP);
            this.tenSanPham = a.TenSP;
            this.HinhAnh = a.HinhAnh;
            this.DonGia = (decimal)a.GiaGiam;
            this.SoLuong = soLuong;
            this.ThanhTien = this.SoLuong * this.DonGia;
            this.TenDangNhap = tenDN;

        }

        public GioHang(int maSP, int SoLuong)
        {
            Vuong_CTK39Entities db = new Vuong_CTK39Entities();
            this.maSanPham = maSP;
            SanPham a = db.SanPhams.SingleOrDefault(x => x.MaSP == maSP);
            this.tenSanPham = a.TenSP;
            this.HinhAnh = a.HinhAnh;
            this.DonGia = (decimal)a.GiaGiam;
            this.SoLuong = SoLuong;
            this.ThanhTien = this.SoLuong * this.DonGia;
            this.TenDangNhap = "guest";
        }
        public GioHang(int maSP)
        {
            Vuong_CTK39Entities db = new Vuong_CTK39Entities();
            this.maSanPham = maSP;
            SanPham a = db.SanPhams.SingleOrDefault(x => x.MaSP == maSP);
            this.tenSanPham = a.TenSP;
            this.HinhAnh = a.HinhAnh;
            this.DonGia = (decimal)a.GiaGiam;
            this.SoLuong = SoLuong;
            this.ThanhTien = this.SoLuong * this.DonGia;
            this.TenDangNhap = "guest";
        }
    }
}