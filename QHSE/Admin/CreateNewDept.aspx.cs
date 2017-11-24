using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;

namespace QHSE.Admin
{
    public partial class NewDept : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlAdmin.DataSource = context.Employees.Where(x => x.Role == "Admin" || x.Role == "Sub-Admin").Select(x => x.Name).ToList();
                ddlAdmin.DataBind();
                ddlAdmin.Items.Insert(0, new ListItem("", ""));
                ddlAdmin.Items.Insert(1, new ListItem("All", "All"));
            }
        }

        protected void btnCreateDept_Click(object sender, EventArgs e)
        {
            Department dept = new Department();
            dept.Name = tbxDeptName.Text;
            if (ddlAdmin.SelectedValue != "")

            {
                try
                {
                    dept.DeptAdmin = ddlAdmin.Text;

                    context.Departments.Add(dept);
                    context.SaveChanges();
                    Response.Redirect("~/Admin/ManageDepartments.aspx");

                }
                catch (Exception ex)
                {
                    lblError.Text = "Error! New department hasn't been added.";
                }
            }
        }
    }
}