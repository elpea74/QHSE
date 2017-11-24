using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Controllers;
using QHSE.Model;
using System.Security.Principal;
using System.Web.Profile;

namespace QHSE.Users
{
    public partial class OwnResultList : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            IIdentity id = User.Identity;
            dynamic profile = ProfileBase.Create(id.Name);
            string username = id.Name;

            gvResult.DataSource = (from x in context.QuizResults
                                   from y in context.Quizs
                                   where x.Username == username
                                   where x.QuizId == y.QuizId
                                   select new
                                   {
                                       ResultId = x.ResultId,
                                       QuizId = x.QuizId,
                                       Name = y.Name,
                                       TimeSubmitted = x.TimeSubmitted,
                                       Result = x.Result
                                   }).ToList();
            gvResult.DataBind();

            if (gvResult.Rows.Count <= 0)
                lblNoResult.Text = "No results available.";
            else
            {
                lblNoResult.Visible = false;
            }
        }

        protected void gvResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //get result ID to pass to View Details page
            Label lblResultId = (Label)gvResult.Rows[rowIndex].FindControl("lblResultId");
            int resultId = Convert.ToInt32(lblResultId.Text);
            Session["ResultId"] = resultId;

            //get quiz ID to pass to View Details page
            Label lblQuizId = (Label)gvResult.Rows[rowIndex].FindControl("lblQuizId");
            int quizId = Convert.ToInt32(lblQuizId.Text);
            Session["QuizId"] = quizId;

            Response.Redirect("~/Users/ViewQuizResult.aspx");

        }

        protected void gvResult_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}