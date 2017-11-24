using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;

namespace QHSE
{
    public partial class NewObservation : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
            //Take submitter name from cookies
            o.Name = Session["username"].ToString();
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
            Response.Redirect("~/ObservationList.aspx");
        }

        public void CustomValidator_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = true;

            if (tbxDescription.Text == "" || tbxDescription.Text == null 
                && tbxFurtherAction.Text == "" || tbxFurtherAction.Text == null
                && tbxImmAction.Text == "" || tbxImmAction.Text == null
                && tbxComment.Text == "" || tbxComment.Text == null)
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