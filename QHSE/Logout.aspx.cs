using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QHSE
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
            //    if (this.Page.User.Identity.IsAuthenticated)
            //    {
                    FormsAuthentication.SignOut();
                    Response.Redirect("~/Login.aspx");
            //    }
            //}
        }
    }
}