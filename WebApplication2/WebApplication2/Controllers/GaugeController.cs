using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{
    public class GaugeController : Controller
    {
        ModelEntities model = new ModelEntities();

        // GET: Gauge
        public ActionResult Index()
        {
            var DataSource2 = GetInvoiceData();
            ViewBag.dataSource2 = DataSource2;
            return View();
        }
        
        public ActionResult DataSource(Syncfusion.JavaScript.DataManager dataManager)
        {
            List<Invoice> data = GetInvoiceData();
            return Json(data);
        }

        public List<Invoice> GetInvoiceData() {
            return model.Invoices.ToList();
        }
    }
}