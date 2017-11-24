using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;
using QHSE.Controllers;
using System.Web.Profile;
using System.Security.Principal;

namespace QHSE.Users
{
    public partial class ObservationList : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        ObservationControl oc = new ObservationControl();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            IIdentity id = User.Identity;
            dynamic profile = ProfileBase.Create(id.Name);

            string username = id.Name;

            gvObsCard.DataSource = oc.GetAllObservationsByUser(username);
            gvObsCard.DataBind();

            if (!IsPostBack)
            {
                ddlYear.Items.Insert(0, new ListItem("All", "All"));
            }

            if (gvObsCard.Rows.Count == 0)
            {
                lblTotal.ForeColor = System.Drawing.Color.Red;
                lblTotal.Text = "You haven't submitted any observation cards - 你没有提交任何观察卡.";
            }
            else

                lblTotal.Text = "Number of Observation Cards Submitted - 你提交的观察卡: " + gvObsCard.Rows.Count;

            DateTime startOfThisMonth = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            DateTime endOfThisMonth = startOfThisMonth.AddMonths(1).AddDays(-1);

            List<DateTime> datesOfObs = context.Observations.Where(x => x.Name == username).Select(x => x.Date).ToList<DateTime>();
            bool dateChecker = false;

            foreach (DateTime date in datesOfObs)
            {
                if (date >= startOfThisMonth && date <= endOfThisMonth)
                {
                    dateChecker = true;
                    break;
                }
                else
                    dateChecker = false;
            }

            if (dateChecker == false)
            {
                lblNotify.Visible = true;
                lblNotify.Text = "You haven't submitted a safety observation card this month!";
                lblNotifyChinese.Visible = true;
                lblNotifyChinese.Text = "你这个月还没有提交安全观察卡！";
            }
            else
            {
                lblNotify.Visible = false;
                lblNotify.Text = "";
                lblNotifyChinese.Visible = false;
                lblNotifyChinese.Text = "";
            }

        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            IIdentity id = User.Identity;
            dynamic profile = ProfileBase.Create(id.Name);

            string username = id.Name;

            if (ddlYear.SelectedValue == "All")
            {

                gvObsCard.DataSource = oc.GetAllObservationsByUser(username);
                gvObsCard.DataBind();
                lblTotal.Text = "Number of Observation Cards Submitted - 你提交的观察卡: " + gvObsCard.Rows.Count;
            }

            else
            {
                int year = Convert.ToInt32(ddlYear.SelectedValue);

                gvObsCard.DataSource = oc.GetObservationByYear(username, year);
                gvObsCard.DataBind();
                lblTotal.Text = "Number of Observation Cards Submitted - 你提交的观察卡: " + gvObsCard.Rows.Count;
            }
        }

        protected void btnNewCard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Users/NewObservation.aspx");
        }

        protected void gvObsCard_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            Label lblCardId = (Label)gvObsCard.Rows[rowIndex].FindControl("lblCardId");
            int cardId = Convert.ToInt32(lblCardId.Text);
            Session["CardId"] = cardId;

            Response.Redirect("~/Users/EditObservation.aspx");
        }
    }
}