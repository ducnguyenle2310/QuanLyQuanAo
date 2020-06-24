using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWeb.Models;

namespace MyWeb.Controllers
{
    public class LoaiQuanAoController : Controller
    {
        // GET: LoaiQuanAo
        QuanLiQuanAoEntities1 db = new QuanLiQuanAoEntities1();

        public ActionResult LoaiQuanAoPartial()
        {
            return View(db.LoaiQuanAos.ToList());
        }
        public ViewResult LoaiQuanAo(int MaLoai=0)
        {
            LoaiQuanAo loaiqa = db.LoaiQuanAos.SingleOrDefault(n => n.MaLoai == MaLoai);
            if (loaiqa == null)
                {
                Response.StatusCode = 404;
                return null;
                }
            List<QuanAo> listquanao = db.QuanAos.Where(n => n.MaLoai == MaLoai).ToList();
            if(listquanao.Count==0)
            {
                ViewBag.QuanAo = "Không có sản phẩm nào thuộc loại này!";
            }
            return View(listquanao);
        }
    }
}