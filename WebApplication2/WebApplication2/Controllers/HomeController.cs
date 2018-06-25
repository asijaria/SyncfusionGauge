using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.InvoiceData = InvoiceData();
            ViewBag.PaymentData = PaymentData();
            return View();
        }

        public List<InvoiceGridData> InvoiceData()
        {
            List<InvoiceGridData> data = new List<InvoiceGridData>();
            data.Add(new InvoiceGridData(101, 13000));
            data.Add(new InvoiceGridData(102, 10000));
            data.Add(new InvoiceGridData(103, 18000));
            data.Add(new InvoiceGridData(104, 15000));
            data.Add(new InvoiceGridData(105, 20000));
            return data;
        }

        public List<PaymentGridData> PaymentData()
        {
            List<PaymentGridData> data = new List<PaymentGridData>();
            data.Add(new PaymentGridData(101, 600));
            data.Add(new PaymentGridData(101, 1000));
            data.Add(new PaymentGridData(101, 2000));
            data.Add(new PaymentGridData(101, 4000));
            data.Add(new PaymentGridData(102, 1200));
            data.Add(new PaymentGridData(102, 1000));
            data.Add(new PaymentGridData(103, 1800));
            data.Add(new PaymentGridData(103, 1500));
            data.Add(new PaymentGridData(103, 2000));
            data.Add(new PaymentGridData(103, 2500));
            data.Add(new PaymentGridData(104, 800));
            data.Add(new PaymentGridData(104, 2000));
            data.Add(new PaymentGridData(104, 1000));
            data.Add(new PaymentGridData(105, 1800));
            data.Add(new PaymentGridData(105, 1500));
            return data;
        }
    }

    public class InvoiceGridData
    {
        public InvoiceGridData(double val1, double val2)
        {
            this.Customer_ID = val1;
            this.Fill_Amount = val2;
        }
        public double Customer_ID
        {
            get;
            set;
        }
        public double Fill_Amount
        {
            get;
            set;
        }
    }

    public class PaymentGridData
    {
        public PaymentGridData(double val1, double val2)
        {
            this.Customer_ID = val1;
            this.Payment = val2;
        }
        public double Customer_ID
        {
            get;
            set;
        }
        public double Payment
        {
            get;
            set;
        }
    }
}