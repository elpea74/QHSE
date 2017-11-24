using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Model;

namespace QHSEQuiz.Admin
{
    public partial class EditQuestion : System.Web.UI.Page
    {
        int questionId;
        QuizEntities context;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                questionId = Convert.ToInt32(Request.QueryString["QuestionId"]);
                Question q = context.Questions.Where(x => x.QuestionId == questionId).First();
                tbxOrder.Text = q.OrderInQuiz.ToString();
                tbxQuestion.Text = q.Description;
                tbxWeighted.Text = q.Weighted.ToString();
            }
            catch
            {

                Response.Redirect("~/Admin/ManageQuestions.aspx");
            }
        }
    }
}