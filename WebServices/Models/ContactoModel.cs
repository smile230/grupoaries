using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebServices.Entities;
using Newtonsoft.Json;
using System.Web.Script.Serialization;

namespace WebServices.Models
{
    public class ContactoModel
    {
        public WebServiceTest.ContactDataModel ObtenerContacto(long IdZoho)
        {            
            WebServiceTest.ContactServiceClient Aries = new WebServiceTest.ContactServiceClient();
            JavaScriptSerializer j = new JavaScriptSerializer();
            WebServiceTest.CRMRespuesta Respuesta = Aries.GetContactByIdZoho("grupoaries", "test", IdZoho);
            WebServiceReponse rec = j.Deserialize<WebServiceReponse>(Respuesta.resultado);
            return rec.Data.First();
        }

        public long GuardarContacto(WebServiceTest.ContactDataModel Obj)
        {
            
            WebServiceTest.ContactServiceClient Aries = new WebServiceTest.ContactServiceClient();
            WebServiceTest.CRMRespuesta Respuesta = Aries.AddContact("grupoaries", "test", Obj);
            return Respuesta.idZoho;
        }

        public string ActualizarContacto(Contacto Obj)
        {
            WebServiceTest.ContactDataModel Contacto = new WebServiceTest.ContactDataModel();
            Contacto.Apellido_Materno = Obj.Apellido_Materno;
            Contacto.Average_Time_Spent_Minutes = Obj.Average_Time_Spent_Minutes;
            Contacto.Ciudad_de_correspondencia = Obj.Ciudad_de_correspondencia;
            Contacto.Codigo_de_Pais = Obj.Codigo_de_Pais;
            Contacto.codigo_sincronizacion = Obj.codigo_sincronizacion;
            Contacto.Colonia_para_correspondencia = Obj.colonia_para_correspondencia;
            Contacto.Cuenta_con_Metodo_de_Pago_Comprobable = Obj.Cuenta_con_Metodo_de_Pago_Comprobable;
            Contacto.CURP = Obj.CURP;
            Contacto.Currency = Obj.Currency;
            Contacto.Date_of_Birth = Obj.Date_of_Birth;
            Contacto.Days_Visited = Obj.Days_Visited;
            Contacto.Department = Obj.Department;
            Contacto.Description = Obj.Description;
            Contacto.Domicilio_para_recibir_notificaciones = Obj.Domicilio_para_recibir_notificaciones;
            Contacto.Duplicidad_localizada_en = Obj.Duplicidad_localizada_en;
            Contacto.Edad = Obj.Edad;
            Contacto.Email = Obj.Email;
            Contacto.Email_Opt_Out = Obj.Email_Opt_Out;
            Contacto.Estado_Civil = Obj.Estado_Civil;
            Contacto.Exchange_Rate = Obj.Exchange_Rate;
            Contacto.Fax = Obj.Fax;
            Contacto.First_Name = Obj.First_Name;
            Contacto.First_Visited_Time = Obj.First_Visited_Time;
            Contacto.First_Visited_URL = Obj.First_Visited_URL;
            Contacto.Full_Name = Obj.Full_Name;
            Contacto.Home_Phone = Obj.Home_Phone;
            Contacto.ID_de_Expediente = Obj.ID_de_Expediente;
            Contacto.Last_Name = Obj.Last_Name;
            Contacto.Last_Visited_Time = Obj.Last_Visited_Time;
            WebServiceTest.ContactServiceClient Aries = new WebServiceTest.ContactServiceClient();
            WebServiceTest.CRMRespuesta Respuesta = Aries.UpdateContact("grupoaries", "test", Convert.ToInt64(Obj.IdZoho), Contacto);
            return Respuesta.mensaje;
            
        }
    }
}