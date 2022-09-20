using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebServices.Models;
using System.Data;
using Newtonsoft.Json;
using WebServices.Entities;
using System.Web.Script.Serialization;


namespace WebServices.Controllers
{
    public class ContactoController : Controller
    {
        ContactoModel Modelo = new ContactoModel();
        // GET: Contacto
        public ActionResult Index()
        {
            return View();
        }

        // GET: Contacto/Create
        public ActionResult Create()
        {
            return View();
        }

        

        // GET: Contacto/Edit/5
        public ActionResult Edit()
        {
            return View();
        }

        // POST: Contacto/Edit/5
        [HttpPost]
        public JsonResult ActualizarContacto(Contacto Contacto)
        {
            return Json(Modelo.ActualizarContacto(Contacto), JsonRequestBehavior.AllowGet);
        }

        public long GuardarContacto(WebServiceTest.ContactDataModel Obj)
        {
            return Modelo.GuardarContacto(Obj);
        }

        public JsonResult ObtenerContacto(string IdZoho)
        { 
            return Json(Modelo.ObtenerContacto(Convert.ToInt64(IdZoho)), JsonRequestBehavior.AllowGet);
        }
    }
}
