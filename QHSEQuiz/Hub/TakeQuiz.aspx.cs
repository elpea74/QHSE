﻿using System;
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
    public partial class TakeQuiz : System.Web.UI.Page
    {
        QuizEntities context = new QuizEntities();
        //int order;
        //int questionId;
        //string question;
        //int choice;
        List<int> questionIdList = new List<int>();
        List<int> choiceList = new List<int>();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int quizId = Convert.ToInt32(Session["QuizId"]);
                //int quizId = Convert.ToInt32(Request.QueryString["QuizId"]);
                string quizName = context.Quizs.Where(x => x.QuizId == quizId).Select(x => x.Name).First();

                if (quizName != "")
                    lblQuizName.Text = quizName;
                if (ddlEmployment.SelectedValue == "Permanent staff")
                    tbxHRMS.Enabled = true;
                else
                {
                    tbxHRMS.Text = "";
                    tbxHRMS.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex + ". Redirecting back to Quiz List");
                Response.Redirect("~/Hub/QuizList.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //questionIdList = (List<int>)Session["questionIdList"];
            //choiceList = (List<int>)Session["choiceList"];
            if (Page.IsValid)
            {
                IIdentity id = User.Identity;
                dynamic profile = ProfileBase.Create(id.Name);
                string username = id.Name;

                foreach (GridViewRow row in gvQuestions.Rows)
                {
                    RadioButtonList rblOptions = (RadioButtonList)row.FindControl("rblOptions");
                    Label lblQuestionId = (Label)row.FindControl("lblQuestionId");
                    Label lblQuestion = (Label)row.FindControl("lblQuestion");

                    if (rblOptions.SelectedItem != null)
                    {
                        int qId = Convert.ToInt32(lblQuestionId.Text);
                        int choiceId = Convert.ToInt32(rblOptions.SelectedValue);
                        questionIdList.Add(qId);
                        choiceList.Add(choiceId);
                    }
                }

                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Yes")
                {
                    QuizResult qr = new QuizResult();
                    int quizId = Convert.ToInt32(Session["QuizId"]);
                    qr.QuizId = quizId;
                    qr.Username = username;
                    qr.Name = tbxName.Text;
                    if (tbxHRMS.Text != "")
                        qr.HRMS = Convert.ToInt32(tbxHRMS.Text);
                    //qr.Name = context.Employees.Where(x => x.UserName == username).Select(x => x.Name).First();
                    qr.TimeSubmitted = DateTime.Now;
                    context.QuizResults.Add(qr);
                    context.SaveChanges();

                    QuizResult qr2 = context.QuizResults.Where(x => x.Username == username).Where(x => x.QuizId == quizId).OrderByDescending(x => x.ResultId).First();
                    int quizResultId = qr2.ResultId;

                    for (int i = 0; i < questionIdList.Count; i++)
                    {
                        QuestionResponse qresp = new QuestionResponse();
                        qresp.ResultId = qr2.ResultId;
                        qresp.QuestionId = questionIdList.ElementAt(i);
                        qresp.OptionId = choiceList.ElementAt(i);
                        qresp.TimeSubmitted = DateTime.Now;
                        context.QuestionResponses.Add(qresp);
                        context.SaveChanges();
                    }

                    Session["ResultId"] = quizResultId;
                    Response.Redirect("~/Hub/ViewQuizResult.aspx");
                }
            }

        }

        protected void HRMSValidate(object source, ServerValidateEventArgs args)
        {
            if (ddlEmployment.SelectedValue == "Permanent staff" && tbxHRMS.Text.Length <= 0)
            {
                args.IsValid = false;
            }
            
        }
    }


}