using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;
using QHSE.Controllers;

namespace QHSE
{
    public partial class ObservationList : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        ObservationControl oc = new ObservationControl();

        protected void Page_Load(object sender, EventArgs e)
        {

            string username = Session["username"].ToString();

            gvObsCard.DataSource = oc.GetAllObservationsByUser(username);
            gvObsCard.DataBind();

            if (!IsPostBack)
            {
                ddlYear.Items.Insert(0, new ListItem("All", "All"));
            }
            
            if (gvObsCard.Rows.Count == 0)
            {
                lblTotal.ForeColor = System.Drawing.Color.Red;
                lblTotal.Text = "You haven't submitted any observation cards.";
            }
            else

            lblTotal.Text = "Number of Observation Cards Submitted: " + gvObsCard.Rows.Count;
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();

            if (ddlYear.SelectedValue == "All")
            {
                
                gvObsCard.DataSource = oc.GetAllObservationsByUser(username);
                gvObsCard.DataBind();
            }

            else
            {
                int year = Convert.ToInt32(ddlYear.SelectedValue);
                
                gvObsCard.DataSource = oc.GetObservationByYear(username, year);
                gvObsCard.DataBind();
            }
        }
    }
}