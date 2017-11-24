using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Profile;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;

namespace QHSE.Users
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            IIdentity id = User.Identity;
            dynamic profile = ProfileBase.Create(id.Name);
            string username = id.Name;
            MembershipUser m = Membership.GetUser(id.Name);

            string password = context.Employees.Where(x => x.UserName == username).Select(x => x.Password).First();
            string encryptedPwInput = FormsAuthentication.HashPasswordForStoringInConfigFile(tbxCurrentPw.Text, "MD5");

            if (encryptedPwInput == password)
            {
                if (tbxNewPw.Text != "")
                m.ChangePassword(m.ResetPassword(), tbxNewPw.Text);
                Employee emp = context.Employees.Where(x => x.UserName == username).First();
                emp.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(tbxNewPw.Text, "MD5");

                context.SaveChanges();
                Response.Redirect("~/Users/ObservationList.aspx");
            }
            

        }

        protected void PasswordValidate(object source, ServerValidateEventArgs args)
        {
            IIdentity id = User.Identity;
            dynamic profile = ProfileBase.Create(id.Name);

            string username = id.Name;

            MembershipUser m = Membership.GetUser(id.Name);
            string password = context.Employees.Where(x => x.UserName == username).Select(x => x.Password).First();
            string encryptedPwInput = FormsAuthentication.HashPasswordForStoringInConfigFile(tbxCurrentPw.Text, "MD5");
            args.IsValid = (encryptedPwInput == password);
        }
    }
}