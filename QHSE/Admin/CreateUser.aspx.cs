using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;

namespace QHSE
{
    public partial class CreateUser : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            string createdUsername = CreateUserWizard1.UserName;
            string createdPassword = CreateUserWizard1.Password;
            //dynamic profile = ProfileBase.Create(createdUsername);
            CreateUserWizardStep step1 = (CreateUserWizardStep)CreateUserWizard1.FindControl("Step1");
            DropDownList k1 = (DropDownList)step1.ContentTemplateContainer.FindControl("ddlDept");
            DropDownList k2 = (DropDownList)step1.ContentTemplateContainer.FindControl("ddlRole");
            TextBox k3 = (TextBox)step1.ContentTemplateContainer.FindControl("tbxName");
            TextBox k4 = (TextBox)step1.ContentTemplateContainer.FindControl("UserName");
            TextBox tbxTitle = (TextBox)step1.ContentTemplateContainer.FindControl("tbxTitle");
            TextBox tbxEmail = (TextBox)step1.ContentTemplateContainer.FindControl("tbxEmail");
            TextBox tbxHRMS = (TextBox)step1.ContentTemplateContainer.FindControl("tbxHRMS");
            Roles.AddUserToRole(createdUsername, k2.Text);

            //profile.dept = k1.Text;
            //profile.role = k2.SelectedItem.Text;
            //profile.name = k3.Text;
            //profile.username = k4.Text;
            //profile.Save();

            string encryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(createdPassword, "MD5");

            try
            {
                Employee emp = new Employee();

                if (tbxHRMS.Text != "")
                emp.HRMS = tbxHRMS.Text;

                emp.Name = k3.Text;
                emp.Title = tbxTitle.Text;
                emp.HRMS = tbxHRMS.Text;
                emp.Department = k1.Text;
                emp.UserName = createdUsername;
                emp.Password = encryptedPassword;
                emp.Email = tbxEmail.Text;
                emp.Role = k2.SelectedItem.Text;

                context.Employees.Add(emp);
                context.SaveChanges();
            }
            
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Diagnostics.Trace.TraceInformation("Property: {0} Error: {1}",
                                                validationError.PropertyName,
                                                validationError.ErrorMessage);
                    }
                }
            }

        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/Admin/ManageUsers.aspx");
        }
    }
}