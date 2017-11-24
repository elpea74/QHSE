using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QHSE
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.IsInRole("Admin"))
                AdminLink.Visible = true;
            foreach (string strFileName in Directory.GetFiles(Server.MapPath("~/Pictures/")))
            {
                ImageButton imgBtn = new ImageButton();
                FileInfo fileInfo = new FileInfo(strFileName);
                imgBtn.ImageUrl = "~/Pictures/" + fileInfo.Name;
                imgBtn.Width = Unit.Pixel(100);
                imgBtn.Height = Unit.Pixel(100);
                imgBtn.Style.Add("padding", "5px");
                imgBtn.Click += new ImageClickEventHandler(imgBtn_Click);
                Panel1.Controls.Add(imgBtn);
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    if (FileUpload1.PostedFile.ContentType == "image/jpeg" ||
                        FileUpload1.PostedFile.ContentType == "image/png" ||
                        FileUpload1.PostedFile.ContentType == "image/gif" ||
                        FileUpload1.PostedFile.ContentType == "image/bmp" ||
                        FileUpload1.PostedFile.ContentType == "image/x-adobe-dng")

                    {
                        //string filename = Path.GetFileName(FileUpload1.FileName);
                        string photopath = Server.MapPath("~/Pictures/") + DateTime.Now.ToString("yyyy-MM-dd-HHmmss") + Path.GetExtension(FileUpload1.FileName);
                        FileUpload1.SaveAs(photopath);
                        
                        lblStatus.Text = "Upload status: File uploaded! " + photopath ;
                        Response.Redirect("~/Welcome.aspx");
                    }

                    else
                        lblStatus.Text = "Only image files are accepted.";
                }
                catch (Exception ex)
                {
                    lblStatus.Text = "File cannot be uploaded. The following error occurred: " + ex.Message;
                }
            }

           
        }

        void imgBtn_Click(object sender, ImageClickEventArgs e)
        {
            //Response.Write("Button Clicked");
            Response.Redirect(//"ViewImage.aspx&ImageURL=" +
            ((ImageButton)sender).ImageUrl);
        }
    }
}