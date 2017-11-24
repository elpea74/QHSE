using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSE.Model;
using System.IO;

namespace QHSE.Admin
{
    public partial class ObservationListByUser : System.Web.UI.Page
    {
        QHSEEntities context = new QHSEEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["month"] == "All")
            {
                //change to storedprocedure if possible
                SqlDataSource1.SelectCommand = "SELECT [CardId], o.Name,[Department], [Date],[Location],[Others],[Classification] FROM Observation o, Employee e WHERE (o.Name = @Name) AND (year(date) = @year) AND o.Name = e.UserName";
                lblHeader.Text = "Observation Cards submitted by " + Request.QueryString["username"] + " in "
                + Request.QueryString["year"];
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT [CardId], o.Name,[Department], [Date],[Location],[Others],[Classification] FROM Observation o, Employee e WHERE (o.Name = @Name) AND (month(date) = @month) AND (year(date) = @year) AND o.Name = e.UserName";
                lblHeader.Text = "Observation Report for " + Request.QueryString["username"] + " in "
                    + Request.QueryString["month"] + "/" + Request.QueryString["year"];
            }

            if (gvObCardList.Rows.Count == 0)
            {
                lblNoResult.Text = "No observation cards found for this period.";
            }
            else
            {
                lblTotal.Text = "Number of observation cards: " + gvObCardList.Rows.Count;
            }
        }

        protected void btnDownloadExcel_Click(object sender, EventArgs e)
        {
            var grid = new GridView();
            string username = Request.QueryString["username"];
            int year = Convert.ToInt32(Request.QueryString["year"]);
            try
            {
                if (Request.QueryString["month"] == "All")
                {
                    grid.DataSource = context.Observations.Where(x => x.Name == username).Where(y => y.Date.Year == year).ToList();
                    grid.DataBind();
                }
                else
                {
                    int month = Convert.ToInt32(Request.QueryString["month"]);
                    grid.DataSource = context.Observations.Where(x => x.Name == username).Where(y => y.Date.Year == year).Where(z => z.Date.Month == month).ToList();
                    grid.DataBind();
                }
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
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}