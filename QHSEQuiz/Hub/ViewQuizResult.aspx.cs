using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Model;
using QHSEQuiz.Control;

namespace QHSEQuiz.Hub
{
    public partial class ViewQuizResult : System.Web.UI.Page
    {
        int quizId;
        int correctCount = 0;
        int incorrectCount = 0;
        decimal percentage = 0;
        decimal weightedScore = 0;
        QuizEntities context = new QuizEntities();
        int questionCount;
        decimal totalMark;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                quizId = Convert.ToInt32(Session["QuizId"]);
                //int quizId = Convert.ToInt32(Request.QueryString["QuizId"]);
                string quizName = context.Quizs.Where(x => x.QuizId == quizId).Select(x => x.Name).First();

                if (quizName != "")
                    lblQuizName.Text = quizName;

                questionCount = context.Questions.Where(x => x.QuizId == quizId).Select(x => x.QuestionId).Count();
                totalMark = context.Questions.Where(x => x.QuizId == quizId).Sum(x => x.Weighted);
            }
            catch (Exception ex)
            {
                Response.Write(ex);
                Response.Redirect("~/Hub/QuizList.aspx");
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
                    lblRightWrong.Text = "Correct! 正确!";
                    correctCount++;
                    decimal questionScore = context.Questions.Where(x => x.QuestionId == questionId).Select(x => x.Weighted).First();
                    weightedScore = weightedScore + questionScore;
                }

                else if (lblYourAnswer.Text == null || lblYourAnswer.Text == "")
                {
                    lblYourAnswer.Visible = false;
                    lblCorrectAnswer.Visible = false;
                    lblRightWrong.ForeColor = System.Drawing.Color.Red;
                    lblRightWrong.Text = "Cannot mark. This question might have been added after your quiz attempt. - 不能标记. 您的测验尝试后可能会添加此问题。";
                }

                else
                {
                    lblRightWrong.ForeColor = System.Drawing.Color.Red;
                    lblRightWrong.Text = "Incorrect! 不正确!";
                    incorrectCount++;
                }

                decimal percentage = 100 * weightedScore / totalMark;
                lblScore.Text = percentage.ToString() + "%";
                if (percentage >= 80)
                    lblScore.ForeColor = System.Drawing.Color.Green;
                else
                    lblScore.ForeColor = System.Drawing.Color.Red;

                QuizResult qr = context.QuizResults.Where(x => x.ResultId == quizResultId).First();
                //if (qr.Correct == null || qr.Incorrect == null || qr.Result == null)
                //{
                qr.Correct = correctCount;
                qr.Incorrect = incorrectCount;
                qr.Mark = percentage;

                

                if (percentage >= 80)
                    qr.Result = "Passed - 及格";
                else
                    qr.Result = "Failed - 不及格";
                context.SaveChanges();
                //}

            }



        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Logout.aspx");
        }

        protected void btnRetake_Click(object sender, EventArgs e)
        {
            Session["QuizId"] = quizId;
            Response.Redirect("~/Hub/TakeQuiz.aspx");
        }
    }
}