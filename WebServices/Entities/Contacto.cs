using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebServices.Entities
{
    public class Contacto
    {
        public string IdZoho { get; set; }
        public string Apellido_Materno { get; set; }
        public string Average_Time_Spent_Minutes { get; set; }
        public string Ciudad_de_correspondencia { get; set; }
        public string Codigo_de_Pais { get; set; }
        public string codigo_sincronizacion { get; set; }
        public string colonia_para_correspondencia { get; set; }
        public string Cuenta_con_Metodo_de_Pago_Comprobable { get; set; }
        public string CURP { get; set; }
        public string Currency { get; set; }
        public string Date_of_Birth { get; set; }
        public string Days_Visited { get; set; }
        public string Department { get; set; }
        public string Description { get; set; }
        public bool Domicilio_para_recibir_notificaciones { get; set; }
        public string Duplicidad_localizada_en { get; set; }
        public string Edad { get; set; }
        public string Email { get; set; }
        public bool Email_Opt_Out { get; set; }
        public string Estado_Civil { get; set; }
        public string Exchange_Rate { get; set; }
        public string Fax { get; set; }
        public string First_Name { get; set; }
        public string First_Visited_Time { get; set; }
        public string First_Visited_URL { get; set; }
        public string Full_Name { get; set; }
        public string Home_Phone { get; set; }
        public string ID_de_Expediente { get; set; }
        public string Last_Name { get; set; }
        public string Last_Visited_Time { get; set; }
    }
}