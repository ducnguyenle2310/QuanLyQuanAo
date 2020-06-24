using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWeb.Models;
namespace MyWeb.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        QuanLiQuanAoEntities1 db = new QuanLiQuanAoEntities1();
        public ActionResult Index()
        {
            return View();
        }
      
    }

}