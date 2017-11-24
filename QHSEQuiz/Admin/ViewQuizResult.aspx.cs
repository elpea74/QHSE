using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Model;
using QHSEQuiz.Control;

namespace QHSEQuiz.Admin
{
    public partial class ViewQuizResult : System.Web.UI.Page
    {
        int correctCount = 0;
        int incorrectCount = 0;
        decimal percentage = 0;
        QuizEntities context = new QuizEntities();
        int questionCount;
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                int quizId = Convert.ToInt32(Session["QuizId"]);
                //int quizId = Convert.ToInt32(Request.QueryString["QuizId"]);

                string quizName = context.Quizs.Where(x => x.QuizId == quizId).Select(x => x.Name).First();

                if (quizName != "")
                    lblQuizName.Text = quizName;

                string username = Session["Username"].ToString();
                string takerName = context.QuizResults.Where(x => x.QuizId == quizId).Where(x => x.Username == username).Select(x => x.Name).First();


                if (takerName != "")
                    lblName.Text = takerName;

                string hubName = context.Hubs.Where(x => x.UserName == username).Select(x => x.Name).First();
                if (hubName != "")
                    lblHub.Text = hubName;
                else
                    lblHub.Visible = false;
                
                questionCount = context.Questions.Where(x => x.QuizId == quizId).Select(x => x.QuestionId).Count();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
                Response.Redirect("~/Admin/QuizResultList.aspx");
            }

        }

        protected void gvQuestions_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int quizResultId = Convert.ToInt32(Session["ResultId"]);

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                QuizControl qc = new QuizControl();

                Label lblQuestionId = (Label)e.Row.FindControl("lblQuestionId");
                Label lblRightWrong = (Label)e.Row.FindControl("lblRightWrong");
                Label lblYourAnswer = (Label)e.Row.FindControl("lblYourAnswer");
                Label lblCorrectAnswer = (Label)e.Row.FindControl("lblCorrectAnswer");

                int questionId = Convert.ToInt32(lblQuestionId.Text);


                lblYourAnswer.Text = qc.GetOwnAnswer(questionId, quizResultId);
                lblCorrectAnswer.Text = qc.GetCorrectAnswer(questionId);

                if (lblYourAnswer.Text == lblCorrectAnswer.Text)
                {
                    lblRightWrong.ForeColor = System.Drawing.Color.Green;
                    lblRightWrong.Text = "Correct!";
                    //correctCount++;
                }

                else if (lblYourAnswer.Text == null || lblYourAnswer.Text == "")
                {
                    lblYourAnswer.Visible = false;
                    lblCorrectAnswer.Visible = false;
                    lblRightWrong.ForeColor = System.Drawing.Color.Red;
                    lblRightWrong.Text = "Cannot mark. This question might have been added after your quiz attempt.";
                }

                else
                {
                    lblRightWrong.ForeColor = System.Drawing.Color.Red;
                    lblRightWrong.Text = "Incorrect!";
                    //incorrectCount++;
                }

                decimal? percentage = context.QuizResults.Where(x => x.ResultId == quizResultId).Select(x => x.Mark).First();

                //decimal percentage = 100 * correctCount / (correctCount + incorrectCount);
                lblScore.Text = percentage.ToString() + "%";
                if (percentage >= 80)
                    lblScore.ForeColor = System.Drawing.Color.Green;
                else
                    lblScore.ForeColor = System.Drawing.Color.Red;

                //QuizResult qr = context.QuizResults.Where(x => x.ResultId == quizResultId).First();
                ////if (qr.Correct == null || qr.Incorrect == null || qr.Result == null)
                ////{
                //qr.Correct = correctCount;
                //qr.Incorrect = incorrectCount;
                //if (percentage >= 80)
                //    qr.Result = "Pass - 通过";
                //else
                //    qr.Result = "Fail - 失败";
                //context.SaveChanges();
                ////}

            }

        }

        protected void btnResultList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/QuizResultList.aspx");
        }

       
    }
}