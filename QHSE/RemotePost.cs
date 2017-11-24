using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.Specialized;

namespace QHSE
{
    public class RemotePost
    {
        private NameValueCollection Inputs = new NameValueCollection();
        public string Url = "";
        public string Method = "post";
        public string FormName = "form1";

        public void Add(string name, string value)
        {
            Inputs.Add(name, value);
        }

        public void Post()
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Write("");
           HttpContext.Current.Response.Write(string.Format("", FormName));
            HttpContext.Current.Response.Write(string.Format("", FormName, Method, Url));
            for (int i = 0; i < Inputs.Keys.Count; i++)
            {
                HttpContext.Current.Response.Write(string.Format("", Inputs.Keys[i], Inputs[Inputs.Keys[i]]));
            }
            HttpContext.Current.Response.Write("");
            HttpContext.Current.Response.Write("");
            HttpContext.Current.Response.End();
        }


    }
}