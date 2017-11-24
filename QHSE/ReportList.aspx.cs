using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Controllers;
using QHSE.Model;

namespace QHSE
{
    public partial class ReportList : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        ReportController rc = new ReportController();

        protected void Page_Load(object sender, EventArgs e)
        {
            gvReportList.DataSource = rc.GetAllReports();
            gvReportList.DataBind();

            if (!IsPostBack)
            {
                ddlHub.DataSource = context.Hubs.ToList<Hub>();
                ddlHub.DataTextField = "Name";
                ddlHub.DataValueField = "Name";
                ddlHub.DataBind();
                ddlHub.Items.Insert(0, new ListItem("All", "All"));

                ddlClassification.DataSource = context.Classifications.ToList<Classification>();
                ddlClassification.DataTextField = "Name";
                ddlClassification.DataValueField = "Name";
                ddlClassification.DataBind();
                ddlClassification.Items.Insert(0, new ListItem("All", "All"));

                ddlYear.Items.Insert(0, new ListItem("All", "All"));

                lblTotalRow.Text = "Number of reports: " + gvReportList.Rows.Count;
            }
        }

        protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlHub.SelectedValue == "All" && ddlClassification.SelectedValue == "All"
                && ddlYear.SelectedValue == "All")
            {
                gvReportList.DataSource = rc.GetAllReports();
                gvReportList.DataBind();
                lblTotalRow.Text = "Number of reports: " + gvReportList.Rows.Count;
            }
            else if (ddlHub.SelectedValue != "All" && ddlClassification.SelectedValue == "All"
                && ddlYear.SelectedValue == "All")
            {
                gvReportList.DataSource = rc.GetReportByHub(ddlHub.SelectedValue);
                gvReportList.DataBind();
                lblTotalRow.Text = "Number of reports: " + gvReportList.Rows.Count;
            }
            else if (ddlHub.SelectedValue == "All" && ddlClassification.SelectedValue != "All"
                && ddlYear.SelectedValue == "All")
            {
                gvReportList.DataSource = rc.GetReportByClassification(ddlClassification.SelectedValue);
                gvReportList.DataBind();
                lblTotalRow.Text = "Number of reports: " + gvReportList.Rows.Count;
            }
            else if (ddlHub.SelectedValue == "All" && ddlClassification.SelectedValue == "All"
                && ddlYear.SelectedValue != "All")
            {
                gvReportList.DataSource = rc.GetReportByYear(Convert.ToInt32(ddlYear.SelectedValue));
                gvReportList.DataBind();
                lblTotalRow.Text = "Number of reports: " + gvReportList.Rows.Count;
            }
            else if (ddlHub.SelectedValue != "All" && ddlClassification.SelectedValue == "All"
                && ddlYear.SelectedValue != "All")
            {
                gvReportList.DataSource = rc.GetReportByHubYear(ddlHub.SelectedValue, Convert.ToInt32(ddlYear.SelectedValue));
                gvReportList.DataBind();
                lblTotalRow.Text = "Number of reports: " + gvReportList.Rows.Count;
            }
            else if (ddlHub.SelectedValue == "All" && ddlClassification.SelectedValue != "All"
                && ddlYear.SelectedValue != "All")
            {
                gvReportList.DataSource = rc.GetReportByClassificationYear(ddlClassification.SelectedValue, Convert.ToInt32(ddlYear.SelectedValue));
                gvReportList.DataBind();
                lblTotalRow.Text = "Number of reports: " + gvReportList.Rows.Count;
            }

            else if (ddlHub.SelectedValue != "All" && ddlClassification.SelectedValue != "All"
                && ddlYear.SelectedValue == "All")
            {
                gvReportList.DataSource = rc.GetReportByHubClassification(ddlHub.SelectedValue, ddlClassification.SelectedValue);
                gvReportList.DataBind();
                lblTotalRow.Text = "Number of reports: " + gvReportList.Rows.Count;
            }

            else
            {
                gvReportList.DataSource = rc.GetReport(ddlHub.Text, ddlClassification.SelectedValue, Convert.ToInt32(ddlHub.SelectedValue));
                gvReportList.DataBind();
                lblTotalRow.Text = "Number of reports: " + gvReportList.Rows.Count;
            }
        }

    }
}
