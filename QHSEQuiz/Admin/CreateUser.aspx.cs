using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Model;
using System.Web.Security;
using System.Data.Entity.Validation;

namespace QHSEQuiz.Admin
{
    public partial class CreateUser : System.Web.UI.Page
    {
        QuizEntities context = new QuizEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            string createdUsername = CreateUserWizard1.UserName;
            string createdPassword = CreateUserWizard1.Password;
            //dynamic profile = ProfileBase.Create(createdUsername);
            CreateUserWizardStep step1 = (CreateUserWizardStep)CreateUserWizard1.FindControl("Step1");
            //DropDownList k1 = (DropDownList)step1.ContentTemplateContainer.FindControl("ddlDept");
            DropDownList k2 = (DropDownList)step1.ContentTemplateContainer.FindControl("ddlRole");
            TextBox k3 = (TextBox)step1.ContentTemplateContainer.FindControl("tbxName");
            TextBox k4 = (TextBox)step1.ContentTemplateContainer.FindControl("UserName");
            TextBox tbxEmail = (TextBox)step1.ContentTemplateContainer.FindControl("tbxEmail");
            Roles.AddUserToRole(createdUsername, k2.Text);

           // string encryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(createdPassword, "MD5");

            //try
            //{
                QHSEQuiz.Model.Hub hub = new QHSEQuiz.Model.Hub();

                hub.Name = k3.Text;
                hub.UserName = createdUsername;
                //.Password = encryptedPassword;
            if (tbxEmail.Text != "")
                hub.Email = tbxEmail.Text;
            else
                hub.Email = "N/A";
                hub.Role = k2.SelectedItem.Text;

                context.Hubs.Add(hub);
                context.SaveChanges();
            //}

            //catch (DbEntityValidationException dbEx)
            //{
            //    foreach (var validationErrors in dbEx.EntityValidationErrors)
            //    {
            //        foreach (var validationError in validationErrors.ValidationErrors)
            //        {
            //            System.Diagnostics.Trace.TraceInformation("Property: {0} Error: {1}",
            //                                    validationError.PropertyName,
            //                                    validationError.ErrorMessage);
            //        }
            //    }
            //}

        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Logout.aspx");
        }
    }
}