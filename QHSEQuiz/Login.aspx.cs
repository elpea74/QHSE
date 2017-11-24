using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QHSEQuiz
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Request.IsAuthenticated && !string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                    // This is an unauthorized, authenticated request...
                    Response.Redirect("~/AccessDenied.aspx");

                if (this.Page.User.Identity.IsAuthenticated)
                {
                    if (User.IsInRole("Admin"))
                    {
                        Response.Redirect("~/Admin/QuizResultList.aspx");
                    }
                    else if (User.IsInRole("Hub"))
                    {
                        Response.Redirect("~/Hub/QuizList.aspx");
                    }
                    else
                    {
                        FormsAuthentication.SignOut();
                        Response.Redirect("~/Login.aspx");
                    }

                }


            }
        }
    }
}