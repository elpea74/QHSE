using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Model;

namespace QHSEQuiz.Admin
{
    public partial class ManageQuestions : System.Web.UI.Page
    {
        QuizEntities context = new QuizEntities();
        int quizId;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.BindGrid();
            }
            catch
            {
                Response.Redirect("~/Admin/QuizList.aspx");
            }
        }

        protected void gvQuestions_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int qId = Convert.ToInt32(gvQuestions.DataKeys[e.RowIndex].Values[0]);
                using (QuizEntities context = new QuizEntities())
                {
                    Question question = (from x in context.Questions
                                         where x.QuestionId == qId
                                         select x).FirstOrDefault();
                    context.Questions.Remove(question);
                    context.SaveChanges();

                }
                this.BindGrid();
            }
            catch
            {
                Response.Redirect("~/Admin/QuizList.aspx");
            }
        }

        protected void btnNewQuestion_Click(object sender, EventArgs e)
        {
            Session["QuizId"] = quizId;
            Response.Redirect("~/Admin/AddQuestion.aspx");
        }

        protected void BindGrid()
        {
            
            if (Request.QueryString["QuizId"] != "" && Request.QueryString["QuizId"] != null)
            { 
                quizId = Convert.ToInt32(Request.QueryString["QuizId"]);
                try
                {
                    gvQuestions.DataSource = (from x in context.Questions
                                              where x.QuizId == quizId
                                              orderby x.OrderInQuiz
                                              select new
                                              {
                                                  QuestionId = x.QuestionId,
                                                  OrderInQuiz = x.OrderInQuiz,
                                                  Description = x.Description,
                                                  Weighted = x.Weighted,
                                                  Type = x.Type
                                              }).ToList();
                    gvQuestions.DataBind();
                }

                catch (Exception ex)
                {
                    Response.Write(ex);
                    Response.Redirect("~/Admin/QuizList.apsx");
                }
            }
            else
            {
                Response.Redirect("~/Admin/QuizList.apsx");
            }
        }
    }
}