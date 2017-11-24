using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Model;
using System.Data;
using System.Configuration;

namespace QHSEQuiz.Admin
{
    public partial class ManageHub : System.Web.UI.Page
    {
        SqlConnection con;
        QuizEntities context = new QuizEntities();
        string conStr = ConfigurationManager.ConnectionStrings["QuizConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            //LinkButton linkbtnDeleteUser = (LinkButton)gvUser.FindControl("linkbtnDeleteUser");

            BindGrid();

            //if (!IsPostBack)
            //{
            //    ddlDepartment.DataSource = context.Departments.ToList<Department>();
            //    ddlDepartment.DataValueField = "Name";
            //    ddlDepartment.DataTextField = "Name";
            //    ddlDepartment.DataBind();
            //    ddlDepartment.Items.Insert(0, new ListItem("All", "All"));

            //    lblTotalRow.Text = "Number of people: " + gvUser.Rows.Count;

            //}

        }

        protected void gvUser_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string username = e.Row.Cells[1].Text;
                foreach (LinkButton button in e.Row.Cells[5].Controls.OfType<LinkButton>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + username + "?')){ return false; };";
                    }
                }
            }

        }

        protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string username = gvUser.Rows[e.RowIndex].Cells[1].Text;

            string query = "SELECT DISTINCT UserId FROM aspnet_Users WHERE UserName = '" + username + "'";
            con = new SqlConnection(conStr);
            SqlDataAdapter adapter = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            //DataSet dataset = new DataSet();
            //adapter.Fill(dataset);

            Guid userId = Guid.Parse(dt.Rows[0][0].ToString());



            using (QuizEntities context = new QuizEntities())
            {
                QHSEQuiz.Model.Hub hub = context.Hubs.Where(x => x.UserName == username).First();
                context.Hubs.Remove(hub);

                //aspnet_Profile profile = context.aspnet_Profile.Where(x => x.PropertyValuesString == username).First();
                //context.aspnet_Profile.Remove(profile);

                aspnet_Users user = context.aspnet_Users.Where(x => x.UserName == username).First();
                context.aspnet_Users.Remove(user);

                aspnet_Membership mem = context.aspnet_Membership.Where(x => x.UserId == userId).First();
                context.aspnet_Membership.Remove(mem);

                aspnet_UsersInRoles userInRole = context.aspnet_UsersInRoles.Where(x => x.UserId == userId).First();
                context.aspnet_UsersInRoles.Remove(userInRole);


                context.SaveChanges();
                Response.Redirect("~/Admin/ManageUsers.aspx");
            }



        }

        protected void BindGrid()
        {
            string query = "SELECT [UserName], [Name], [HubID], [Role], Email FROM [Hub] WHERE [Name] LIKE 'Hub%'" /*WHERE [NAME] like '%" + tbxSearch.Text.ToLower() + "%' ORDER BY Name"*/;
            con = new SqlConnection(conStr);
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            con.Close();

            ViewState["dt"] = dt;
            gvUser.DataSource = ViewState["dt"];
            gvUser.DataBind();
        }

        protected void BindGridByDept(string dept)
        {
            //string query = "SELECT [UserName], [Name], HRMS, [Title], [Department], [Email], [Role], [EmployeeID] FROM [Employee] WHERE [Department] = '" + dept + "' ORDER BY Role, Name, Department";
            //con = new SqlConnection(conStr);
            //SqlCommand cmd = new SqlCommand(query, con);
            //con.Open();

            //SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //adapter.Fill(dt);
            //con.Close();

            //ViewState["dt"] = dt;
            //gvUser.DataSource = ViewState["dt"];
            //gvUser.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //if (tbxSearch.Text != "")
            //{
            //    //if (ddlDepartment.SelectedValue == "All")
            //    //{
            //    //    BindGrid();

            //    //    //lblTotalRow.Text = "Number of people: " + gvUser.Rows.Count;
            //    //}
            //    //else
            //    //{
            //    BindGrid();

            //    //string query = "SELECT [UserName], [Name], [HRMS], [Title], [Department], [Email], [Role], [EmployeeID] FROM [Employee] WHERE [Department] = '" + ddlDepartment.Text + "' AND [NAME] like '%" + tbxSearch.Text + "%' OR [Department] = '" + ddlDepartment.Text + "' AND [HRMS] like '%" + tbxSearch.Text + "%' ORDER BY Role, Name, Department";
            //    //con = new SqlConnection(conStr);
            //    //SqlCommand cmd = new SqlCommand(query, con);
            //    //con.Open();

            //    //SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            //    //DataTable dt = new DataTable();
            //    //adapter.Fill(dt);
            //    //con.Close();

            //    //ViewState["dt"] = dt;
            //    //gvUser.DataSource = ViewState["dt"];
            //    //gvUser.DataBind();

            //    //lblTotalRow.Text = "Number of people: " + gvUser.Rows.Count;
            //    //    }
            //    //}
            //    //else
            //    //{
            //    //    if (ddlDepartment.SelectedValue == "All")
            //    //    {
            //    //        BindGrid();

            //    //        //lblTotalRow.Text = "Number of people: " + gvUser.Rows.Count;
            //    //    }
            //    //    else
            //    //    {
            //    //        BindGridByDept(ddlDepartment.Text);

            //    //        lblTotalRow.Text = "Number of people: " + gvUser.Rows.Count;
            //    //    }

            //    //}
            //}
        }

        protected void btnNewHub_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/CreateHub.aspx");
        }
    }
}