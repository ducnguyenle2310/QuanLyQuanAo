using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWeb.Models;

namespace MyWeb.Controllers
{
    public class QuanAoController : Controller
    {
        // GET: QuanAo
        QuanLiQuanAoEntities1 db = new QuanLiQuanAoEntities1();
        public PartialViewResult QuanAoPartial()
        {
            var listQuanAo = db.QuanAos.ToList();
            return PartialView(listQuanAo);
        }

        //Xem chi tiết
        public ViewResult XemChiTiet(int MaQuanAo)
        {
            QuanAo quanao = db.QuanAos.SingleOrDefault(n=>n.MaQuanAo == MaQuanAo);
            if( quanao == null)
            {
                Response.StatusCode = 404;
                return null;

           }
            return View(quanao);
        }
    }

}