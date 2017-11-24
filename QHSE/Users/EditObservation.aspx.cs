using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;
using QHSE.Controllers;
using System.IO;

namespace QHSE.Users
{
    public partial class EditObservation : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        Observation o;
        ObservationControl oc = new ObservationControl();
        int cardId;


        protected void Page_Load(object sender, EventArgs e)
        {
            cardId = Convert.ToInt32(Session["CardId"]);
            if (!IsPostBack)
            {
                try
                {
                    
                    //cardId = Convert.ToInt32(Request.QueryString["CardId"]);
                    ddlLocation.DataSource = context.Locations.ToList<Location>();
                    ddlLocation.DataTextField = "Name";
                    ddlLocation.DataValueField = "Name";
                    ddlLocation.DataBind();
                    ddlLocation.Items.Insert(0, new ListItem("", "0"));


                    o = context.Observations.Where(x => x.CardId == cardId).First<Observation>();
                    //date = o.Date;
                    ddlLocation.SelectedValue = o.Location;
                    tbxOthers.Text = o.Others;
                    ddlClassification.SelectedValue = o.Classification;
                    tbxDescription.Text = o.Description;
                    tbxImmAction.Text = o.ImmediateAction;
                    tbxFurtherAction.Text = o.FurtherAction;
                    tbxComment.Text = o.PositiveComment;
                }

                catch (Exception ex)
                {
                    Response.Write(ex);
                    Response.Redirect("~/Users/ObservationList.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Observation obs = new Model.Observation();
            //cardId = Convert.ToInt32(Session["CardId"]);
            //cardId = Convert.ToInt32(Request.QueryString["CardId"]);
            obs.CardId = cardId;
            //date = o.Date;
            obs.Date = context.Observations.Where(x => x.CardId == cardId).Select(x => x.Date).First();

            obs.Location = ddlLocation.Text;
            obs.Others = tbxOthers.Text;
            obs.Classification = ddlClassification.Text;
            obs.Description = tbxDescription.Text;
            obs.ImmediateAction = tbxImmAction.Text;
            obs.FurtherAction = tbxFurtherAction.Text;
            obs.PositiveComment = tbxComment.Text;
            string fileName = DateTime.Now.ToString("ddMMyyyy-hhmmss") + Path.GetExtension(UploadPhoto.FileName);
            string photopath = Server.MapPath("~/Pictures/") + fileName;
            if (UploadPhoto.PostedFile.FileName != "")
            {
                UploadPhoto.SaveAs(photopath);
                obs.PhotoPath = fileName;
            }
            oc.UpdateObservation(obs);

            Response.Redirect("~/Users/ObservationList.aspx");
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