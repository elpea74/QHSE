using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Model;


namespace QHSEQuiz.Admin
{
    public partial class AddQuestion : System.Web.UI.Page
    {
        int quizId;
        QuizEntities context = new QuizEntities();
        List<string> choiceList = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            int? newIndex = 0;
            try
            {
                if (!IsPostBack)
                {
                    quizId = Convert.ToInt32(Session["QuizId"]);
                    int? lastIndex = context.Questions.Where(x => x.QuizId == quizId).OrderByDescending(x => x.OrderInQuiz).Select(x => x.OrderInQuiz).First();
                    if (lastIndex != null)
                    {
                        newIndex = lastIndex + 1;
                    }
                    else
                    {
                        newIndex = 1;
                    }
                    tbxOrder.Text = newIndex.ToString();



                }

                if (ddlType.Text == "True/False")
                {
                    truefalsediv.Visible = true;
                    div3choice.Visible = false;
                    div4choice.Visible = false;
                }
                else if (ddlType.Text == "3-choice")
                {
                    truefalsediv.Visible = false;
                    div3choice.Visible = true;
                    div4choice.Visible = false;
                }
                else if (ddlType.Text == "4-choice")
                {
                    truefalsediv.Visible = false;
                    div3choice.Visible = false;
                    div4choice.Visible = true;
                }
            }
            catch
            {
                Response.Redirect("~/Admin/QuizList.aspx");
            }
        }

        protected void btnSubmit3choiceQuestion_Click(object sender, EventArgs e)
        {
            choiceList.Clear();
            Session["choiceList"] = null;

            ddl3choiceAnswer.Visible = true;
            btnSubmit3choiceAnswer.Visible = true;

            tbx3choiceQuestion.ReadOnly = true;
            tbx3choiceQuestion.BackColor = System.Drawing.Color.LightGray;

            tbxWeighted.ReadOnly = true;
            tbxWeighted.BackColor = System.Drawing.Color.LightGray;

            tbxOrder.ReadOnly = true;
            tbxOrder.BackColor = System.Drawing.Color.LightGray;

            tbx3choiceoption1.ReadOnly = true;
            tbx3choiceoption1.BackColor = System.Drawing.Color.LightGray;

            tbx3choiceoption2.ReadOnly = true;
            tbx3choiceoption2.BackColor = System.Drawing.Color.LightGray;

            tbx3choiceoption3.ReadOnly = true;
            tbx3choiceoption3.BackColor = System.Drawing.Color.LightGray;

            btnSubmit3choiceQuestion.Visible = false;

            choiceList.Add(tbx3choiceoption1.Text);
            choiceList.Add(tbx3choiceoption2.Text);
            choiceList.Add(tbx3choiceoption3.Text);

            ddl3choiceAnswer.DataSource = choiceList;
            ddl3choiceAnswer.DataBind();

            Session["choiceList"] = choiceList;

        }

        protected void btnSubmit3choiceAnswer_Click(object sender, EventArgs e)
        {
            string answer = ddl3choiceAnswer.Text;

            try
            {
                Question q = new Question();
            q.OrderInQuiz = Convert.ToInt32(tbxOrder.Text);
            q.QuizId = Convert.ToInt32(Session["QuizId"]);
            q.Weighted = Convert.ToDecimal(tbxWeighted.Text);
            q.Type = ddlType.SelectedValue;
            q.Description = tbx3choiceQuestion.Text;

            context.Questions.Add(q);
            context.SaveChanges();

            foreach (string choice in choiceList)
            {
                QuestionOption qo = new QuestionOption();
                qo.QuestionId = q.QuestionId;
                qo.Description = choice;

                context.QuestionOptions.Add(qo);
                context.SaveChanges();
            }

            QuestionAnswer qa = new QuestionAnswer();
            qa.QuestionId = q.QuestionId;
            qa.OptionId = context.QuestionOptions.Where(x => x.Description == answer).Where(x => x.QuestionId == q.QuestionId).Select(x => x.OptionId).First();
            context.QuestionAnswers.Add(qa);
            context.SaveChanges();

            Response.Redirect("~/Admin/ManageQuestions.aspx");
            }

            catch
            {
                lblError.Text = "Error saving data!";
            }
        }

        protected void btnSubmit4choiceQuestion_Click(object sender, EventArgs e)
        {
            choiceList.Clear();
            Session["choiceList"] = null;

            ddl4choiceAnswer.Visible = true;
            btnSubmit4choiceAnswer.Visible = true;

            tbx4choiceQuestion.ReadOnly = true;
            tbx4choiceQuestion.BackColor = System.Drawing.Color.LightGray;

            tbx4choiceoption1.ReadOnly = true;
            tbx4choiceoption1.BackColor = System.Drawing.Color.LightGray;

            tbx4choiceoption2.ReadOnly = true;
            tbx4choiceoption2.BackColor = System.Drawing.Color.LightGray;

            tbx4choiceoption3.ReadOnly = true;
            tbx4choiceoption3.BackColor = System.Drawing.Color.LightGray;

            tbx4choiceoption4.ReadOnly = true;
            tbx4choiceoption4.BackColor = System.Drawing.Color.LightGray;

            btnSubmit4choiceQuestion.Visible = false;

            choiceList.Add(tbx4choiceoption1.Text);
            choiceList.Add(tbx4choiceoption2.Text);
            choiceList.Add(tbx4choiceoption3.Text);
            choiceList.Add(tbx4choiceoption4.Text);

            ddl4choiceAnswer.DataSource = choiceList;
            ddl4choiceAnswer.DataBind();

            Session["choiceList"] = choiceList;
        }

        protected void btnSubmit4choiceAnswer_Click(object sender, EventArgs e)
        {
            string answer = ddl4choiceAnswer.Text;

            try
            {
                Question q = new Question();
            q.OrderInQuiz = Convert.ToInt32(tbxOrder.Text);
            q.QuizId = Convert.ToInt32(Session["QuizId"]);
            q.Weighted = Convert.ToDecimal(tbxWeighted.Text);
            q.Type = ddlType.SelectedValue;
            q.Description = tbx4choiceQuestion.Text;

            context.Questions.Add(q);
            context.SaveChanges();

            foreach (string choice in choiceList)
            {
                QuestionOption qo = new QuestionOption();
                qo.QuestionId = q.QuestionId;
                qo.Description = choice;

                context.QuestionOptions.Add(qo);
                context.SaveChanges();
            }

            QuestionAnswer qa = new QuestionAnswer();
            qa.QuestionId = q.QuestionId;
            qa.OptionId = context.QuestionOptions.Where(x => x.Description == answer).Where(x => x.QuestionId == q.QuestionId).Select(x => x.OptionId).First();
            context.QuestionAnswers.Add(qa);
            context.SaveChanges();

            Response.Redirect("~/Admin/ManageQuestions.aspx");
            }

            catch
            {
                lblError.Text = "Error saving data!";
            }
        }

        protected void btnTFSubmitQuestion_Click(object sender, EventArgs e)
        {
            choiceList.Clear();
            Session["choiceList"] = null;

            ddlTFAnswer.Visible = true;
            btnTFSubmitAnswer.Visible = true;

            tbxTFQuestion.ReadOnly = true;
            tbxTFQuestion.BackColor = System.Drawing.Color.LightGray;

            btnTFSubmitQuestion.Visible = false;

            choiceList.Add(tbxTrue.Text);
            choiceList.Add(tbxFalse.Text);

            ddlTFAnswer.DataSource = choiceList;
            ddlTFAnswer.DataBind();

            Session["choiceList"] = choiceList;
        }

        protected void btnTFSubmitAnswer_Click(object sender, EventArgs e)
        {
            string answer = ddlTFAnswer.Text;

            try
            {
                Question q = new Question();
                q.OrderInQuiz = Convert.ToInt32(tbxOrder.Text);
                q.QuizId = Convert.ToInt32(Session["QuizId"]);
                q.Weighted = Convert.ToDecimal(tbxWeighted.Text);
                q.Type = ddlType.SelectedValue;
                q.Description = tbxTFQuestion.Text;

                context.Questions.Add(q);
                context.SaveChanges();

                choiceList = (List<string>)Session["choiceList"];
                foreach (string choice in choiceList)
                {
                    QuestionOption qo = new QuestionOption();
                    qo.QuestionId = q.QuestionId;
                    qo.Description = choice;

                    context.QuestionOptions.Add(qo);
                    context.SaveChanges();
                }

                QuestionAnswer qa = new QuestionAnswer();
                qa.QuestionId = q.QuestionId;
                qa.OptionId = context.QuestionOptions.Where(x => x.QuestionId == q.QuestionId).Where(x => x.Description == answer).Select(x => x.OptionId).First();
                context.QuestionAnswers.Add(qa);
                context.SaveChanges();

                Response.Redirect("~/Admin/ManageQuestions.aspx");
            }

            catch
            {
                lblError.Text = "Error saving data!";
            }
        }
    }
}