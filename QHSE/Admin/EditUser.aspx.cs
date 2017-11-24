using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;
using System.Web.Security;
using System.Threading.Tasks;
using QHSE.Controllers;

namespace QHSE.Admin
{
    public partial class EditUser : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        Controllers.UserControl uc = new Controllers.UserControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Request.QueryString["username"];
            if (!IsPostBack)
            {
                Employee emp = context.Employees.Where(x => x.UserName == username).First<Employee>();

                tbxUserName.Text = emp.UserName;

                if (emp.HRMS != null)
                {
                    tbxHRMS.Text = emp.HRMS.ToString();
                }
                tbxName.Text = emp.Name;
                tbxEmail.Text = emp.Email;
                tbxTitle.Text = emp.Title;
                ddlRole.SelectedValue = emp.Role;
                ddlDept.SelectedValue = emp.Department;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            Employee emp = new Employee();

                //emp.HRMS = Convert.ToInt32(tbxHRMS.Text);
                emp.Name = tbxName.Text;
                emp.UserName = tbxUserName.Text;
                emp.Title = tbxTitle.Text;
                if (tbxHRMS.Text != "")
                {
                    emp.HRMS = tbxHRMS.Text;
                }

                emp.Department = ddlDept.Text;
                emp.Email = tbxEmail.Text;
                emp.Role = ddlRole.SelectedValue;

                if (tbxChangePassword.Text != "")
                {
                    MembershipUser m = Membership.GetUser(tbxUserName.Text);
                    m.ChangePassword(m.ResetPassword(), tbxChangePassword.Text);
                    
                }

                string newPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(tbxChangePassword.Text, "MD5");
                emp.Password = newPassword;

                uc.UpdateEmployee(emp);


                //Roles.AddUserToRole(tbxUserName.Text, ddlRole.SelectedValue);


                Response.Redirect("~/Admin/ManageUsers.aspx");
          

        }
        
    }
}