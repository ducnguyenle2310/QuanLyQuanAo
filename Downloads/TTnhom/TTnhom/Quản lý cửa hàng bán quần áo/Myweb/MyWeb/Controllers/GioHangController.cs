using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWeb.Models;

namespace MyWeb.Controllers
{
    public class GioHangController : Controller
    {
        QuanLiQuanAoEntities1 db = new QuanLiQuanAoEntities1();
      // Lấy giỏ hàng
      public List<GioHang> LayGioHang()
        {
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang == null)
            {
                listGioHang = new List<GioHang>();
                Session["GioHang"] = listGioHang;

            }
            return listGioHang;

        }
        //Thêm giỏ hàng
        public ActionResult ThemGioHang(int iMaQuanAo, string url)
        {
            QuanAo quanao = db.QuanAos.SingleOrDefault(n => n.MaQuanAo == iMaQuanAo);
            if(quanao==null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Lấy ra session giỏ hàng
            List<GioHang> listGioHang = LayGioHang();
            // Kiểm tra quần áo này đã tồn tại trong session[quanao] chưa
            GioHang gh = listGioHang.Find(n => n.iMaQuanAo == iMaQuanAo);
            if(gh == null)
            {
                gh = new GioHang(iMaQuanAo);
                //Add sp mới thêm
                listGioHang.Add(gh);
                return Redirect(url);
            }
            else
            {
                gh.iSoLuong++;
                return Redirect(url);
            }
        }
        //Cập nhật gỏ hàng
        public ActionResult CapNhatGioHang(int iMaSP, FormCollection f)
        {
            QuanAo quanao = db.QuanAos.SingleOrDefault(n => n.MaQuanAo == iMaSP);
            if (quanao == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> listGioHang = LayGioHang();
            GioHang sanpham = listGioHang.SingleOrDefault(n => n.iMaQuanAo == iMaSP);
            if (sanpham != null)
            {
                sanpham.iSoLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction( "GioHang");
        }
        //Xóa Giỏ hàng
        public ActionResult XoaGioHang(int iMaSP)
        {
            QuanAo quanao = db.QuanAos.SingleOrDefault(n => n.MaQuanAo == iMaSP);
            if (quanao == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> listGioHang = LayGioHang();
            GioHang sanpham = listGioHang.SingleOrDefault(n => n.iMaQuanAo == iMaSP);
            if (sanpham != null)
            {
                listGioHang.RemoveAll(n => n.iMaQuanAo == iMaSP);
                
            }
            if (listGioHang.Count == 0)
            {
                return RedirectToAction("Index","Home");
            }
            return RedirectToAction("GioHang");
        }
        //Xây dựng giỏ hàng
        public ActionResult GioHang()
        {
            if(Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> listGioHang = LayGioHang();

            return View(listGioHang);
        }
        //Tính tổng số lượng
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if(listGioHang != null)
            {
                iTongSoLuong = listGioHang.Sum(n => n.iSoLuong);

            }
            return iTongSoLuong;
        }
        //Tính tổng tiền
        private double TongTien()
        {
            double dTongTien = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                dTongTien = listGioHang.Sum(n => n.ThanhTien);

            }
            return dTongTien;
        }
        //tạo partial giỏ hàng
        public ActionResult GioHangPartial()
        {
                if(TongSoLuong()==0)
            {
                return PartialView();
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }
        public ActionResult SuaGioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> listGioHang = LayGioHang();

            return View(listGioHang);
        }

    }
}