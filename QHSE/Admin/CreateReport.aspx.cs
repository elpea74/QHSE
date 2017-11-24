using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;
using System.Security.Principal;
using System.Web.Profile;

namespace QHSE.Admin
{
    public partial class CreateReport : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ddlLocation.DataSource = context.Hubs.ToList<Hub>();
                ddlLocation.DataTextField = "Name";
                ddlLocation.DataValueField = "Name";
                ddlLocation.DataBind();
                ddlClassification.DataSource = context.Classifications.ToList<Classification>();
                ddlClassification.DataTextField = "Name";
                ddlClassification.DataValueField = "Name";
                ddlClassification.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                IIdentity id = User.Identity;
                dynamic profile = ProfileBase.Create(id.Name);

                string username = id.Name;

                Report r = new Report();
                r.ReportNo = tbxReportNo.Text;
                r.Date = Convert.ToDateTime(tbxDate.Text);
                r.Location = ddlLocation.Text;
                r.Classification = ddlClassification.Text;
                r.Description = tbxDescription.Text;
                r.Memo = tbxMemo.Text;

                //Submitter name value will be added from cookies later
                r.SubmitterName = username;
                string fileName = tbxReportNo.Text + Path.GetExtension(UploadPhoto.FileName);
                string photopath = Server.MapPath("~/Pictures/") + fileName;
                if (UploadPhoto.PostedFile.FileName == "" || UploadPhoto.PostedFile.FileName == null)
                {
                    photopath = null;
                    r.PhotoPath = null;
                }
                else
                {
                    //string fileName = tbxReportNo.Text + Path.GetExtension(UploadPhoto.FileName);
                    //string photopath = Server.MapPath("~/Pictures/") + fileName;
                    UploadPhoto.SaveAs(photopath);
                    r.PhotoPath = fileName;
                }
                    context.Reports.Add(r);
                    context.SaveChanges();
                    Response.Redirect("~/Admin/ReportList.aspx");
                
           
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex);
            }

        }
    }
}