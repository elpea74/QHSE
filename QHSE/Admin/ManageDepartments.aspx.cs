using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;
using QHSE.Controllers;

namespace QHSE.Admin
{
    public partial class ManageDepartments : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            this.BindGrid();
            //SqlDataSource2.SelectCommand = "Select Name, DeptAdmin From DEPARTMENT WHERE Name LIKE '%Hub%'";
            //gvDept.DataSourceID = "SqlDataSource2";
            //gvDept.DataBind();


        }

        protected void BindGrid()
        {
            //SqlDataSource2.SelectCommand = "Select Name, DeptAdmin From DEPARTMENT WHERE Name LIKE '%Hub%'";
            //gvDept.DataSourceID = "SqlDataSource2";
            gvDept.DataSource = context.Departments.ToList();
            gvDept.DataBind();
        }

        protected void gvDept_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDept.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void gvDept_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDept.EditIndex = -1;
            this.BindGrid();
        }

        protected void gvDept_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDept.Rows[e.RowIndex];
            string admin = (row.FindControl("ddlAdmin") as DropDownList).Text;
            string deptName = (row.FindControl("tbxDeptName") as TextBox).Text;
            //using (context = new QHSEEntities())
            //{
            
                Department d = context.Departments.Where(x => x.Name == deptName).First<Department>();
                d.Name = deptName;
                d.DeptAdmin = admin;

                context.SaveChanges();
            //}
            gvDept.EditIndex = -1;
            gvDept.DataSource = context.Departments.Where(x => x.Name.Contains("Hub")).ToList();
            gvDept.DataBind();
            //this.BindGrid();
        }

        protected void gvDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            string deptName = (string)gvDept.SelectedDataKey.Value;

            Department dept = context.Departments.Where(x => x.Name == deptName).First();

        }

        protected void btnNewDept_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/CreateNewDept.aspx");
        }
    }
}