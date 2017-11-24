using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;

namespace QHSE.Users
{
    public partial class ViewReport : System.Web.UI.Page
    {
        Report r;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                QHSEEntities context = new QHSEEntities();
                string reportNo = Request.QueryString["ReportNo"];

                List<string> listReportNo = context.Reports.Select(x => x.ReportNo).ToList<string>();

                foreach (string rn in listReportNo)
                {
                    if (reportNo != "" && reportNo == rn)
                    {
                        r = context.Reports.Where(x => x.ReportNo == reportNo).First();

                        lblReportNo.ForeColor = System.Drawing.Color.Black;
                        lblReportNo.Text = "Report #: " + r.ReportNo;
                        //DateTime reportDate = r.Date;
                        litDate.Text = r.Date.ToString("dd/MM/yyyy");
                        litLocation.Text = r.Location;
                        litClassification.Text = r.Classification;
                        litDescription.Text = r.Description;

                        if (r.Memo == "")
                            litMemo.Text = "None";
                        else
                            litMemo.Text = r.Memo;

                        if (r.PhotoPath == "" || r.PhotoPath == null)
                        {
                            imgBtn.Visible = false;
                            lblPhoto.Text = "No photo attached";
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
                        break;
                    }

                    else
                    {
                        lblReportNo.Text = "Report Not Found!";
                        lblReportNo.ForeColor = System.Drawing.Color.Red;
                        imgBtn.Visible = false;
                    }
                }
            }

            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
        protected void imgBtn_Click(object sender, ImageClickEventArgs e)
        {
            //Response.Write("Button Clicked");
            Response.Redirect(//"ViewImage.aspx&ImageURL=" +
            ((ImageButton)sender).ImageUrl);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Users/ReportList.aspx");
        }
    }
}