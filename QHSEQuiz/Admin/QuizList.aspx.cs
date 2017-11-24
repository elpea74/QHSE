using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Control;
using QHSEQuiz.Model;

namespace QHSEQuiz.Admin
{
    public partial class QuizList : System.Web.UI.Page
    {
        string quizdetailstable = "Quiz";
        QuizEntities context = new QuizEntities();
        List<Quiz> quizList;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                quizList = context.Quizs.ToList();
                gvQuizList.DataSource = quizList;
                gvQuizList.DataBind();
                //Bindquiz();
            }
           
        }

        //get the recent quiz
        //protected void Bindquiz()
        //{
        //    DataTable dTable = new DataTable();
        //    SqlCommand getQuizzes = new SqlCommand("select QuizId, Name, StartDate, EndDate from " + quizdetailstable);

        //    QuizControl getQuizList = new QuizControl();
        //    dTable = getQuizList.returnDataTable(getQuizzes);

        //    if (dTable.Rows.Count > 0)
        //    {
        //        currrepeater.Visible = true;
        //        lblmessage.Visible = false;

        //        currrepeater.DataSource = dTable;
        //        currrepeater.DataBind();
        //    }
        //    else
        //    {
        //        currrepeater.Visible = false;
        //        lblmessage.Visible = true;
        //        lblmessage.Text = "Nothing available at the moment" + "<br /><br />";
        //    }
        //}

        //edit quiz
        //protected void currrepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    int quizid = Convert.ToInt32(e.CommandArgument);
            
        //    if (e.CommandName == "edit")
        //    {
        //        Response.Redirect("EditQuiz.aspx?q=" + quizid, false);
        //    }
        //    else if (e.CommandName == "responses")
        //    {
        //        Response.Redirect("QuizResultList.aspx?q=" + quizid, false);
        //    }
        //    else if (e.CommandName == "questions")
        //    {
        //        Response.Redirect("ManageQuestions.aspx", false);
        //        Session["QuizId"] = quizid;
        //    }
        //    else
        //    {
        //    }
        //}

        protected void gvQuizList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int quizId = Convert.ToInt32(gvQuizList.DataKeys[e.Row.RowIndex].Value);
                GridView gvDateRange = e.Row.FindControl("gvDateRange") as GridView;
                gvDateRange.DataSource = (from x in context.QuizDateRanges
                                          from y in context.Hubs
                                          where x.QuizId == quizId
                                          where y.HubID == x.HubId
                                          where y.Name.Contains("Hub")
                                          select new
                                          {
                                              Hub = y.Name,
                                              StartDate = x.StartDate,
                                              EndDate = x.EndDate
                                          }).ToList();
                gvDateRange.DataBind();
            }
        }

        protected void gvDateRange_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}