using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Model;
using QHSEQuiz.Control;
using System.Security.Principal;
using System.Web.Profile;

namespace QHSEQuiz.Hub
{
    public partial class QuizList : System.Web.UI.Page
    {
        QuizEntities context = new QuizEntities();
        QuizControl qc = new QuizControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            IIdentity id = User.Identity;
            dynamic profile = ProfileBase.Create(id.Name);
            string username = id.Name;

            gvQuizList.DataSource = qc.GetAvailableQuizzes();
            gvQuizList.DataBind();


            //foreach (GridViewRow row in gvQuizList.Rows)
            //{
            //    Label lblQuizId = (Label)row.FindControl("lblQuizId");
            //    int quizId = Convert.ToInt32(lblQuizId.Text);
            //    int currentYear = DateTime.Now.Year;
            //    //LinkButton lbtnTakeQuiz = (LinkButton)row.FindControl("lbtnTakeQuiz");
            //    //Label lblCompleted = (Label)row.FindControl("lblCompleted");

            //    List<QuizResult> qrList = context.QuizResults.Where(x => x.Username == username).Where(x => x.QuizId == quizId).Where(x => x.TimeSubmitted.Value.Year == currentYear).ToList<QuizResult>();

            //    if (qrList.Count > 0)
            //    {
            //        row.Visible = false;

            //        //lbtnTakeQuiz.Visible = false;
            //        //lblCompleted.Visible = true;
            //    }
            //}


            if (gvQuizList.Rows.Count <= 0)
                lblNoQuiz.Text = "No quiz available. - 没有测验。";
            else
            {
                lblNoQuiz.Visible = false;
            }
        }

        protected void gvQuizList_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int rowIndex = Convert.ToInt32(e.CommandArgument); // Get the current row
            //Label lblQuizId = (Label)gvQuizList.FindControl("lblQuizId");
            //int quizId = Convert.ToInt32(gvQuizList.Rows[rowIndex].Cells[0].Text);
            Label lblQuizId = (Label)gvQuizList.Rows[rowIndex].FindControl("lblQuizId");
            int quizId = Convert.ToInt32(lblQuizId.Text);

            Session["QuizId"] = quizId;
            Response.Redirect("~/Hub/TakeQuiz.aspx");
        }
    }
}