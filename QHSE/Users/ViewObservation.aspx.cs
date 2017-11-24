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
    public partial class ViewObservation : System.Web.UI.Page
    {
        Observation o;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                QHSEEntities context = new QHSEEntities();
                //int cardId = Convert.ToInt32(Session["CardId"]);
                int cardId = Convert.ToInt32(Request.QueryString["CardId"]);

                o = context.Observations.Where(x => x.CardId == cardId).First();

                lblCardId2.Text = cardId.ToString();
                litDate.Text = o.Date.ToString("dd/MM/yyyy");
                litLocation.Text = o.Location;
                litClassification.Text = o.Classification;

                if (o.Others == "" || o.Others == null)
                    litOthers.Text = "N/A";
                else
                    litOthers.Text = o.Others;

                if (o.Description == "")
                    litDescription.Text = "N/A";
                else
                    litDescription.Text = o.Description;

                if (o.ImmediateAction == "")
                    litImmAction.Text = "N/A";
                else
                    litImmAction.Text = o.ImmediateAction;

                if (o.FurtherAction == "")
                    litFurtherAction.Text = "N/A";
                else
                    litFurtherAction.Text = o.FurtherAction;

                if (o.PositiveComment == "")
                    litComment.Text = "N/A";
                else
                    litComment.Text = o.PositiveComment;

                if (o.PhotoPath == "" || o.PhotoPath == null)
                {
                    imgBtn.Visible = false;
                    lblPhoto.Text = "No photo attached (没有照片附加)";
                }
                else
                {
                    FileInfo fileInfo = new FileInfo(o.PhotoPath);
                    imgBtn.ImageUrl = "~/Pictures/" + fileInfo.Name;
                    imgBtn.Width = Unit.Pixel(150);
                    imgBtn.Height = Unit.Pixel(100);
                    imgBtn.Style.Add("padding", "5px");
                    imgBtn.Click += new ImageClickEventHandler(imgBtn_Click);
                }

            }

            catch (Exception ex)
            {
                Response.Write(ex);
                Response.Redirect("~/Users/ObservationList.aspx");
            }
        }

        protected void imgBtn_Click(object sender, ImageClickEventArgs e)
        {
            //Response.Write("Button Clicked");
            Response.Redirect(//"ViewImage.aspx&ImageURL=" +
            ((ImageButton)sender).ImageUrl);
        }
    }
}