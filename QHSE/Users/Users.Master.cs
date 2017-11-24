using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QHSE.Users
{
    public partial class Users : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Handle the session timeout 
            string sessionExpiredUrl = Request.Url.GetLeftPart(UriPartial.Authority) + "/SessionExpired.aspx";
            StringBuilder script = new StringBuilder();
            script.Append("function expireSession(){ \n");
            script.Append(string.Format(" window.location = '{0}';\n", sessionExpiredUrl));
            script.Append("} \n");
            script.Append(string.Format("setTimeout('expireSession()', {0}); \n", this.Session.Timeout * 60000)); // Convert minutes to milliseconds 
            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "expirescript", script.ToString(), true);
        }
    }
}