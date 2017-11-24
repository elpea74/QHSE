using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;
using System.Net;
using System.Net.Security;

namespace QHSE
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        Employee emp;
        Department dept;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlDept.DataSource = context.Departments.Select(x => x.Name).ToList();
                ddlDept.DataBind();
                ddlDept.Items.Insert(0, new ListItem("", "0"));
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            dept = context.Departments.Where(x => x.Name == ddlDept.Text).First();

            string smtpAddress = "smtp.gmail.com";
            int portNumber = 587;
            bool enableSSL = true;

            string emailFrom = "qhse.bollore@gmail.com";
            string password = "qhsebollore1";
            string subject = "Reset Password Request - QHSE";

            if (dept.DeptAdmin != "All")
            {
                emp = context.Employees.Where(x => x.Name == dept.DeptAdmin).First();

                //RemoteCertificateValidationCallback orgCallback = ServicePointManager.ServerCertificateValidationCallback;
                
                string emailTo = emp.Email;
                string body = "Hello, " + System.Environment.NewLine + System.Environment.NewLine + tbxName.Text + " from " + ddlDept.Text + "has submitted a Reset Password request. Please reset their password and inform them. " + System.Environment.NewLine + System.Environment.NewLine + "This is an automated generated email, please do not reply to this email";

                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(emailFrom);
                    mail.To.Add(emailTo);
                    mail.Subject = subject;
                    mail.Body = body;
                    mail.IsBodyHtml = true;
                    // Can set to false, if you are sending pure text.

                    //mail.Attachments.Add(new Attachment("C:\\SomeFile.txt"));
                    //mail.Attachments.Add(new Attachment("C:\\SomeZip.zip"));

                    using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                    {
                        smtp.Credentials = new NetworkCredential(emailFrom, password);
                        smtp.EnableSsl = enableSSL;

                        smtp.Send(mail);
                    }
                }
                    Response.Redirect("~/Login.aspx");
               
            }

            else
            {
                List<Employee> adminList = context.Employees.Where(x => x.Role == "Admin").ToList<Employee>();


                foreach (Employee admin in adminList)
                {
                    string emailTo = admin.Email;
                    string body = "Hello, " + System.Environment.NewLine + System.Environment.NewLine + tbxName.Text + " from " + ddlDept.Text + "has submitted a Reset Password request. Please reset their password and inform them. " + System.Environment.NewLine + System.Environment.NewLine + "This is an automated generated email, please do not reply to this email";

                    using (MailMessage mail = new MailMessage())
                    {
                        mail.From = new MailAddress(emailFrom);
                        mail.To.Add(emailTo);
                        mail.Subject = subject;
                        mail.Body = body;
                        mail.IsBodyHtml = true;

                        using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                        {
                            smtp.Credentials = new NetworkCredential(emailFrom, password);
                            smtp.EnableSsl = enableSSL;

                            smtp.Send(mail);
                        }
                    }
                }
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}