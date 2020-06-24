using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWeb.Models;

namespace MyWeb.Controllers
{
    public class QuanLySanPhamController : Controller
    {
        QuanLiQuanAoEntities1 db = new QuanLiQuanAoEntities1();
        // GET: QuanLySanPham
        public ActionResult Index()
        {
            return View(db.QuanAos.ToList());

        }
        //Thêm mới
        [HttpGet]
        public ActionResult ThemMoi()
        {
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.ToList(), "MaNCC", "TenNCC");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList(), "MaNSX", "TenNSX");
            return View();
        }
        [HttpPost]
        public ActionResult ThemMoi(QuanAo quanao, HttpPostedFileBase fileUpload)
        {

            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.ToList(), "MaNCC", "TenNCC");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList(), "MaNSX", "TenNSX");
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "Chọn hình ảnh";
                return View();
            }
            //Thêm vào csdl
            if (ModelState.IsValid)
            {
                //Lưu tên của file
                var fileName = Path.GetFileName(fileUpload.FileName);
                //Lưu đường dẫn của file
                var path = Path.Combine(Server.MapPath("~/Images"), fileName);
                //Kiểm tra hình ảnh đã tồn tại chưa
                if (System.IO.File.Exists(path))
                {
                    ViewBag.ThongBao = "Hình ảnh đã tồn tại";
                }
                else
                {
                    fileUpload.SaveAs(path);
                }
                quanao.Anh = fileUpload.FileName;
                db.QuanAos.Add(quanao);
                db.SaveChanges();
            }
            return View();
        }
        //Chỉnh Sửa sản phẩm
        [HttpGet]
        public ActionResult ChinhSua(int MaQuanAo)
        {
            //Lấy ra đói tượng quần áo theo mã
            QuanAo quanao = db.QuanAos.SingleOrDefault(n => n.MaQuanAo == MaQuanAo);
            if (quanao == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.ToList(), "MaNCC", "TenNCC", quanao.MaNCC);
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList(), "MaNSX", "TenNSX", quanao.MaNSX);
            return View(quanao);
        }
        [HttpPost]
        public ActionResult ChinhSua(QuanAo quanao)
        {


            //Thêm vào csdl
            if (ModelState.IsValid)
            {
                //Thực hiện cập nhật trong model
                db.Entry(quanao).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.ToList(), "MaNCC", "TenNCC", quanao.MaNCC);
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList(), "MaNSX", "TenNSX", quanao.MaNSX);
            return RedirectToAction("Index");
        }

        public ActionResult HienThi(int MaQuanAo)
        {
            //Lấy ra đói tượng quần áo theo mã
            QuanAo quanao = db.QuanAos.SingleOrDefault(n => n.MaQuanAo == MaQuanAo);
            if (quanao == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(quanao);

        }
        //Xóa sẳn phẩm
        [HttpGet]
        public ActionResult Xoa (int MaQuanAo)
        {
            //Lấy ra đói tượng quần áo theo mã
            QuanAo quanao = db.QuanAos.SingleOrDefault(n => n.MaQuanAo == MaQuanAo);
            if (quanao == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(quanao);
        }
        [HttpPost,ActionName("Xoa")]
        public ActionResult XacNhanXoa (int MaQuanAo)
        {
            QuanAo quanao = db.QuanAos.SingleOrDefault(n => n.MaQuanAo == MaQuanAo);
            if (quanao == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.QuanAos.Remove(quanao);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
    }
}