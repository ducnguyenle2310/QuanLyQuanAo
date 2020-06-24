using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWeb.Models
{
    public class GioHang
    {

        QuanLiQuanAoEntities1 db = new QuanLiQuanAoEntities1();
        public int iMaQuanAo { get; set; }
        public string sTenQuanAo { get; set; }
        public string sAnh { get; set; }
        public double dDonGia { get; set; }
        public int iSoLuong { get; set; }
        public double ThanhTien
        {
            get { return iSoLuong * dDonGia; }
        }

        //Ham tao cho gio hang
        public GioHang(int MaQuanAo)
        {
            iMaQuanAo = MaQuanAo;
            QuanAo quanao = db.QuanAos.Single(n => n.MaQuanAo == iMaQuanAo);
            sTenQuanAo = quanao.TenQuanAo;
            sAnh = quanao.Anh;
            dDonGia = double.Parse(quanao.GiaBan.ToString());
            iSoLuong = 1;
        }
    }
}