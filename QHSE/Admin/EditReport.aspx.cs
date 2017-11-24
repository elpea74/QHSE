using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;
using System.IO;
using QHSE.Controllers;

namespace QHSE.Admin
{
    public partial class EditReport : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        ReportController rc;
        protected void Page_Load(object sender, EventArgs e)
        {
            string reportNo = Request.QueryString["ReportNo"];
            

            if (!IsPostBack)
            {
                Report r = context.Reports.Where(x => x.ReportNo == reportNo).First();

                ddlLocation.DataSource = context.Hubs.ToList<Hub>();
                ddlLocation.DataTextField = "Name";
                ddlLocation.DataValueField = "Name";
                ddlLocation.DataBind();
                ddlClassification.DataSource = context.Classifications.ToList<Classification>();
                ddlClassification.DataTextField = "Name";
                ddlClassification.DataValueField = "Name";
                ddlClassification.DataBind();
                tbxSubmitterName.Enabled = false;

                tbxReportNo.Text = r.ReportNo;
                tbxSubmitterName.Text = r.SubmitterName;
                tbxDate.Text = r.Date.ToString("dd/MM/yyyy");
                ddlLocation.SelectedValue = r.Location;
                ddlClassification.SelectedValue = r.Classification;
                tbxDescription.Text = r.Description;
                tbxMemo.Text = r.Memo;

                if (r.PhotoPath == "" || r.PhotoPath == null)
                {
                    imgBtn.Visible = false;
                    lblPhoto.Text = "No photo was attached.";
                }
                else
                {
                    FileInfo fileInfo = new FileInfo(r.PhotoPath);
                    imgBtn.ImageUrl = "~/Pictures/" + fileInfo.Name;
                    imgBtn.Width = Unit.Pixel(150);
                    imgBtn.Height = Unit.Pixel(100);
                    imgBtn.Style.Add("padding", "5px");
                    imgBtn.Click += new ImageClickEventHandler(imgBtn_Click);
                }
            }
        }

        protected void imgBtn_Click(object sender, ImageClickEventArgs e)
        {
            //Response.Write("Button Clicked");
            Response.Redirect(//"ViewImage.aspx&ImageURL=" +
            ((ImageButton)sender).ImageUrl);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            rc = new ReportController();
            

            Report r = new Report();

            r.ReportNo = tbxReportNo.Text;
            r.SubmitterName = tbxSubmitterName.Text;
            r.Date = Convert.ToDateTime(tbxDate.Text);
            r.Location = ddlLocation.Text;
            r.Classification = ddlClassification.Text;
            r.Description = tbxDescription.Text;
            r.Memo = tbxMemo.Text;
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
            rc.UpdateReport(r);

            Response.Redirect("~/Admin/ReportList.aspx");

        }
    }
}