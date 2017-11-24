using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using QHSE.Model;

namespace QHSE
{
    public partial class Register : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            ddlDepartment.DataSource = context.Departments.ToList<Department>();
            ddlDepartment.DataTextField = "Name";
            ddlDepartment.DataValueField = "DepartmentId";
            ddlDepartment.DataBind();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string CS = ConfigurationManager.ConnectionStrings["QHSEConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spRegisteruser", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    long deptId = Convert.ToInt64(ddlDepartment.Text);
                    string encryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text, "MD5");
                    SqlParameter name = new SqlParameter("@Name", tbxName.Text);
                    SqlParameter title = new SqlParameter("@Title", tbxTitle.Text);
                    SqlParameter department = new SqlParameter("@DepartmentId", deptId);
                    SqlParameter username = new SqlParameter("@UserName", UserName.Text);
                    SqlParameter password = new SqlParameter("@Password", encryptedPassword);
                    SqlParameter email = new SqlParameter("@Email", Email.Text);
                    SqlParameter role = new SqlParameter("@Role", ddlRole.Text);

                    cmd.Parameters.Add(name);
                    cmd.Parameters.Add(title);
                    cmd.Parameters.Add(department);
                    cmd.Parameters.Add(username);
                    cmd.Parameters.Add(password);
                    cmd.Parameters.Add(email);
                    cmd.Parameters.Add(role);

                    con.Open();
                    int ReturnCode = (int)cmd.ExecuteScalar();
                    if (ReturnCode == -1)
                    {
                        lblMessage.Text = "User Name or Email already in use, please choose another user name/email address";
                    }
                    else
                    {
                        Response.Redirect("ManageUsers.aspx");
                    }
                }
            }
        }
    }
}