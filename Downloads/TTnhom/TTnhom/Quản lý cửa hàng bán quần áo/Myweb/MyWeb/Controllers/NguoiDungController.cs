using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWeb.Models;


namespace MyWeb.Controllers
{
    public class NguoiDungController : Controller
    {
        QuanLiQuanAoEntities1 db = new QuanLiQuanAoEntities1();
        // GET: NguoiDung
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangKy()
        {

            return View();
        }
        [HttpPost]
        public ActionResult DangKy(KhachHang kh)
        {
            //Chèn dữ liệu vào bảng khách hàng
            db.KhachHangs.Add(kh);
            //Lưu vào csdl
            db.SaveChanges();
            return View();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            string sTaiKhoan = f.Get("txtTaiKhoan").ToString();
            string sMatKhau = f.Get("txtMatKhau").ToString();
            KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan && n.MatKhau == sMatKhau);
            if (kh != null)
            {
                ViewBag.ThongBao = "Chúc mừng bạn đăng nhập thành công";
                Session["TaiKhoan"] = kh;
                if (sTaiKhoan == "admin")
                {
                    return RedirectToAction("Index", "QuanLySanPham");
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
            }
            ViewBag.ThongBao = "Tên tài khoản hoặc mật khẩu không đúng !";
            return View();
        }
    }
}