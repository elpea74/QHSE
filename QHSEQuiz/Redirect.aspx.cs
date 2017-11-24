using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Model;
using System.Security.Principal;
using System.Web.Profile;

namespace QHSEQuiz
{
    public partial class Redirect : System.Web.UI.Page
    {
        QuizEntities context = new QuizEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            IIdentity id = User.Identity;
            dynamic profile = ProfileBase.Create(id.Name);
            //Session["username"] = profile.username;

            if (User.IsInRole("Admin") || User.IsInRole("Sub-Admin"))
            {
                Response.Redirect("~/Admin/QuizResultList.aspx");
            }
            else if (User.IsInRole("Hub"))
            {
                Response.Redirect("~/Hub/QuizList.aspx");
            }
            else
            {
                Response.Write("User doesn't have a role, please log in again");
            }
            //else
            //{
            //    Response.Write("User doesn't have a role, please log in again");
            //    Response.Redirect("~/Login.aspx");
            //}
        }
    }
}