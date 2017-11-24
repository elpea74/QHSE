using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;

namespace QHSE.Admin
{
    public partial class CreateObservationAdmin : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlName.DataSource = context.Employees.Where(x => x.Role == "User").Select(x => x.Name).ToList();
                ddlName.DataBind();
                ddlName.Items.Insert(0, new ListItem("Select", "0"));

                ddlLocation.DataSource = context.Locations.ToList<Location>();
                ddlLocation.DataTextField = "Name";
                ddlLocation.DataValueField = "Name";
                ddlLocation.DataBind();
                ddlLocation.Items.Insert(0, new ListItem("", "0"));
            }
        }

        protected void btnSubmit_Click(object sned, EventArgs e)
        {
            Observation o = new Observation();
            
            string username = context.Employees.Where(x => x.Name == ddlName.Text).Select(x => x.UserName).First();
            string HRMS = context.Employees.Where(x => x.UserName == o.Name).Select(x => x.HRMS).First();

            try
            {
                o.Name = username;
                o.HRMS = HRMS;
                o.Date = DateTime.Today.Date;
                o.Location = ddlLocation.Text;
                o.Classification = ddlClassification.Text;
                o.Description = tbxDescription.Text;
                string fileName = DateTime.Now.ToString("ddMMyyyy-hhmmss") + Path.GetExtension(UploadPhoto.FileName);
                string photopath = Server.MapPath("~/Pictures/") + fileName;
                if (UploadPhoto.PostedFile.FileName == "" || UploadPhoto.PostedFile.FileName == null)
                {
                    photopath = null;
                    o.PhotoPath = null;
                }
                else
                {
                    //string fileName = tbxReportNo.Text + Path.GetExtension(UploadPhoto.FileName);
                    //string photopath = Server.MapPath("~/Pictures/") + fileName;
                    UploadPhoto.SaveAs(photopath);
                    o.PhotoPath = fileName;
                }

                o.ImmediateAction = tbxImmAction.Text;
                o.FurtherAction = tbxFurtherAction.Text;
                o.PositiveComment = tbxComment.Text;

                context.Observations.Add(o);
                context.SaveChanges();
                Response.Redirect("~/Admin/ObservationReport.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex);
                lblError.Text = "Error! Observation card hasn't been created.";
            }
        }

        public void CustomValidator_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = true;

            if (tbxDescription.Text == "" && tbxFurtherAction.Text == ""
                && tbxImmAction.Text == "" && tbxComment.Text == "")
            {
                CustomValidator1.ErrorMessage = "Please fill in the details for at least one of the following: Description, Immediate Action Taken, Further Actions Suggested, or Positive Comment";
                args.IsValid = false;

            }
        }

        protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlLocation.Text == "Others - 其他")
            {
                tbxOthers.Enabled = true;
            }
            else
                tbxOthers.Enabled = false;
        }

        protected void ddlClassification_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlClassification.Text == "Positive observation 正面观察")
            {
                tbxDescription.Enabled = false;
                tbxImmAction.Enabled = false;
                tbxFurtherAction.Enabled = false;
            }
            else
            {
                tbxDescription.Enabled = true;
                tbxImmAction.Enabled = true;
                tbxFurtherAction.Enabled = true;
            }
        }
    }
}