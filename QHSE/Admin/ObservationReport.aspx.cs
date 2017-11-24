using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;
using System.IO;

namespace QHSE.Admin
{
    public partial class ObservationReport : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        protected void BindGrid()
        {
            int? year;
            if (ddlYear.Text == null || ddlYear.Text == "")
            {
                year = DateTime.Today.Year;
            }
            else
            {
                year = Convert.ToInt32(ddlYear.Text);
            }

            string qry = "spObservationReport";

            string constr = ConfigurationManager.ConnectionStrings["QHSEConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(qry, con);

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();

            sda.Fill(dt);
            gvReport.DataSource = dt;
            gvReport.DataBind();

            //Calculate Sum and display in Footer Row

            gvReport.FooterRow.Cells[2].Text = "Total";
            gvReport.FooterRow.Cells[2].Font.Bold = true;
            gvReport.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Center;

            int totalJan = dt.AsEnumerable().Sum(row => row.Field<int>("1"));
            gvReport.FooterRow.Cells[3].Text = totalJan.ToString();

            int totalFeb = dt.AsEnumerable().Sum(row => row.Field<int>("2"));
            gvReport.FooterRow.Cells[4].Text = totalFeb.ToString();

            int totalMar = dt.AsEnumerable().Sum(row => row.Field<int>("3"));
            gvReport.FooterRow.Cells[5].Text = totalMar.ToString();

            int totalApr = dt.AsEnumerable().Sum(row => row.Field<int>("4"));
            gvReport.FooterRow.Cells[6].Text = totalApr.ToString();

            int totalMay = dt.AsEnumerable().Sum(row => row.Field<int>("5"));
            gvReport.FooterRow.Cells[7].Text = totalMay.ToString();

            int totalJun = dt.AsEnumerable().Sum(row => row.Field<int>("6"));
            gvReport.FooterRow.Cells[8].Text = totalJun.ToString();

            int totalJul = dt.AsEnumerable().Sum(row => row.Field<int>("7"));
            gvReport.FooterRow.Cells[9].Text = totalJul.ToString();

            int totalAug = dt.AsEnumerable().Sum(row => row.Field<int>("8"));
            gvReport.FooterRow.Cells[10].Text = totalAug.ToString();

            int totalSep = dt.AsEnumerable().Sum(row => row.Field<int>("9"));
            gvReport.FooterRow.Cells[11].Text = totalSep.ToString();

            int totalOct = dt.AsEnumerable().Sum(row => row.Field<int>("10"));
            gvReport.FooterRow.Cells[12].Text = totalOct.ToString();

            int totalNov = dt.AsEnumerable().Sum(row => row.Field<int>("11"));
            gvReport.FooterRow.Cells[13].Text = totalNov.ToString();

            int totalDec = dt.AsEnumerable().Sum(row => row.Field<int>("12"));
            gvReport.FooterRow.Cells[14].Text = totalDec.ToString();

            int totalAll = dt.AsEnumerable().Sum(row => row.Field<int>("Total"));
            gvReport.FooterRow.Cells[15].Text = totalAll.ToString();


        }

        protected void gvReport_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
            string year = ddlYear.Text;
            string username = gvReport.SelectedRow.Cells[2].Text;
            DropDownList month = (DropDownList)gvReport.SelectedRow.FindControl("ddlMonth");
            string strMonth = month.Text;
            Response.Redirect("~/Admin/ObservationListByUser.aspx?username=" + username + "&month=" + strMonth + "&year=" + year);
            //}
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
                this.BindGrid();

        }

        protected void btnDownloadCSV_Click(object sender, EventArgs e)
        {


            var grid = new GridView();
            int year = Convert.ToInt32(ddlYear.Text);
            grid.DataSource = context.Observations.Where(x => x.Date.Year == year).ToList();
            grid.DataBind();

            if (grid.Rows.Count > 0)
            {
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment; filename=ObservationCardExport.xls");
                Response.ContentType = "application/excel";
                Response.ContentEncoding = System.Text.Encoding.Unicode;
                Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());

                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                grid.RenderControl(hw);

                Response.Write(sw.ToString());
                Response.End();

            }
        }
    }
}