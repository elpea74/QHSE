using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Model;

namespace QHSEQuiz.Admin
{
    public partial class CreateQuiz : System.Web.UI.Page
    {
        string quizdetailstable = "Quiz";
        DateTime updatedate = new DateTime();
        QuizEntities context = new QuizEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            updatedate = DateTime.Now;

            //add javascript event
            submitquiz.Attributes.Add("onclick", "javascript: if ( Page_ClientValidate() ){" + submitquiz.ClientID + ".disabled=true; " + submitquiz.ClientID + ".value='Wait...';}" + ClientScript.GetPostBackEventReference(submitquiz, ""));
        }

        //start new quiz
        protected void submitquiz_click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string name = txtname.Text.Trim();
                    string description = txtdescription.Text.Trim();
                    //string completiondesc = txtcompletiondescription.Text.Trim();
                    string start = txtstartdate.Text;
                    string end = txtenddate.Text;
                    DateTime startdate = new DateTime();
                    startdate = Convert.ToDateTime(start);
                    DateTime enddate = new DateTime();
                    enddate = Convert.ToDateTime(end);
                    enddate = enddate.AddHours(23).AddMinutes(59).AddSeconds(59);

                    if ((startdate > enddate) || (startdate < updatedate))
                    {
                        lblalert.Visible = true;
                        lblalert.Text = "Please check Start date and End date!";
                    }
                    else
                    {
                        Quiz q = new Quiz();

                        q.Name = name;
                        q.Description = description;
                        q.StartDate = startdate;
                        q.EndDate = enddate;



                        context.Quizs.Add(q);
                        context.SaveChanges();

                        int quizId = q.QuizId;
                        List<QHSEQuiz.Model.Hub> hubList = context.Hubs.Where(x => x.UserName.Contains("hub")).ToList();
                        foreach (QHSEQuiz.Model.Hub hub in hubList)
                        {
                            QuizDateRange dateRange = new QuizDateRange();
                            dateRange.HubId = hub.HubID;
                            dateRange.QuizId = q.QuizId;
                            dateRange.StartDate = startdate;
                            dateRange.EndDate = enddate;

                            context.QuizDateRanges.Add(dateRange);
                            context.SaveChanges();
                        }

                        //SqlCommand insertnew = new SqlCommand("insert into " + quizdetailstable + " (name, description, completiondescription, startdate, enddate, termsandconditions, lastupdated) values (@name, @description, @completiondescription, @startdate, @enddate, @termsandconditions, @lastupdated)");
                        //insertnew.Parameters.AddWithValue("name", name);
                        //insertnew.Parameters.AddWithValue("description", description);
                        ////insertnew.Parameters.AddWithValue("completiondescription", completiondesc);
                        //insertnew.Parameters.AddWithValue("startdate", startdate);
                        //insertnew.Parameters.AddWithValue("enddate", enddate);
                        ////insertnew.Parameters.AddWithValue("termsandconditions", quizterms);
                        ////insertnew.Parameters.AddWithValue("lastupdated", updatedate);

                        //db insertnewquiz = new db();
                        //insertnewquiz.ExecuteQuery(insertnew);
                        Session["QuizId"] = q.QuizId;
                        Response.Redirect("~/Admin/ManageQuestions.aspx", false);

                    }
                }
                catch
                {
                    lblalert.Visible = true;
                    lblalert.Text = "Please enter the complusory fields and try again!";
                }
            }
            else
            {
                lblalert.Visible = true;
                lblalert.Text = "Please enter the complusory fields and try again!";
            }
        }
    }
}