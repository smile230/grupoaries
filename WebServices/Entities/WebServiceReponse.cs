using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebServices.Entities
{
    public class WebServiceReponse
    {
        public string EntityId { get; set; }
        public List<WebServiceTest.ContactDataModel> Data { get; set; }
    }
}