using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QHSEQuiz.Model;
using QHSEQuiz.Control;
using MigraDoc.DocumentObjectModel;
using QHSEQuiz.MigraDocClasses;
using MigraDoc.Rendering;
using System.Diagnostics;
using System.IO;

namespace QHSEQuiz.Admin
{
    public partial class QuizResultList : System.Web.UI.Page
    {
        QuizEntities context = new QuizEntities();
        QuizControl qc = new QuizControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ddlHub.DataSource = context.Hubs.Where(x => x.Name.Contains("Hub")).Select(x => x.Name).ToList();
                    ddlHub.DataBind();
                    ddlHub.Items.Insert(0, new ListItem("All", "All"));

                    ddlQuiz.DataSource = qc.GetQuizNames();
                    ddlQuiz.DataBind();
                    ddlQuiz.Items.Insert(0, new ListItem("All", "All"));

                    gvResult.DataSource = qc.GetResults();
                    gvResult.DataBind();

                    if (gvResult.Rows.Count <= 0)
                    {
                        lblNoResult.Text = "No results available.";
                        btnExcel.Enabled = false;
                        btnExcel.BackColor = System.Drawing.Color.Gray;
                    }
                    else
                    {
                        lblNoResult.Visible = false;
                        btnExcel.Enabled = true;
                        btnExcel.BackColor = System.Drawing.ColorTranslator.FromHtml("#5bc0de");
                    }
                }

                catch (Exception ex)
                {
                    Response.Write(ex);
                    lblNoResult.Visible = true;
                    lblNoResult.Text = "error loading results. please refresh the page.";
                }
            }
        }

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void gvResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //get result ID to pass to View Details page
            Label lblResultId = (Label)gvResult.Rows[rowIndex].FindControl("lblResultId");
            int resultId = Convert.ToInt32(lblResultId.Text);
            Session["ResultId"] = resultId;

            //get quiz ID to pass to View Details page
            Label lblQuizId = (Label)gvResult.Rows[rowIndex].FindControl("lblQuizId");
            int quizId = Convert.ToInt32(lblQuizId.Text);
            Session["QuizId"] = quizId;

            Label lblUsername = (Label)gvResult.Rows[rowIndex].FindControl("lblUsername");
            string username = lblUsername.Text;
            Session["Username"] = username;

            Response.Redirect("~/Admin/ViewQuizResult.aspx");

        }

        protected void ddlHub_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                try
                {

                    if (ddlHub.Text == "All" && ddlQuiz.Text == "All")
                    {
                        gvResult.DataSource = qc.GetResults();
                        gvResult.DataBind();
                    }

                    else if (ddlHub.Text != "All" && ddlQuiz.Text == "All")
                    {
                        gvResult.DataSource = qc.GetResultsByHub(ddlHub.Text);
                        gvResult.DataBind();
                    }

                    else if (ddlHub.Text == "All" && ddlQuiz.Text != "All")
                    {
                        gvResult.DataSource = qc.GetResultsByQuiz(ddlQuiz.Text);
                        gvResult.DataBind();
                    }
                    else
                    {
                        gvResult.DataSource = qc.GetResultsByHubQuiz(ddlQuiz.Text, ddlHub.Text);
                        gvResult.DataBind();
                    }



                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                    lblNoResult.Visible = true;
                    lblNoResult.Text = "Error loading results. Please refresh the page.";
                }

                if (gvResult.Rows.Count <= 0)
                {
                    lblNoResult.Visible = true;
                    lblNoResult.Text = "No results available.";
                    btnExcel.Enabled = false;
                    btnExcel.BackColor = System.Drawing.Color.Gray;
                }
                else
                {
                    lblNoResult.Visible = false;
                    btnExcel.Enabled = true;
                    btnExcel.BackColor = System.Drawing.ColorTranslator.FromHtml("#5bc0de");
                }
            }
        }

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            string hubName = ddlHub.Text;
            // Create a MigraDoc document
            Document document = Documents.CreateDocument(hubName);

            //string ddl = MigraDoc.DocumentObjectModel.IO.DdlWriter.WriteToString(document);
            MigraDoc.DocumentObjectModel.IO.DdlWriter.WriteToFile(document, "MigraDoc.mdddl");

            PdfDocumentRenderer renderer = new PdfDocumentRenderer(true, PdfSharp.Pdf.PdfFontEmbedding.Always);
            renderer.Document = document;

            renderer.RenderDocument();

            // Save the document...
#if DEBUG
            string filename = "QuizResults-" + DateTime.Now.ToString("HHmmddMMyyyy") + ".pdf";
#else
      string filename = "HelloMigraDoc.pdf";
#endif
            renderer.PdfDocument.Save(filename);
            // ...and start a viewer.
            Process.Start(filename);
        }

        protected void gvResult_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void SetSortDirection(string sortDirection)
        {

        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
                    if (gvResult.Rows.Count > 0)
                    {
                        btnExcel.Visible = true;
                        btnExcel.BackColor = System.Drawing.ColorTranslator.FromHtml("#5bc0de");
                        Response.ClearContent();
                        Response.AddHeader("content-disposition", "attachment; filename=QuizResultList.xls");
                        Response.ContentType = "application/excel";
                        Response.ContentEncoding = System.Text.Encoding.Unicode;
                        Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());

                        StringWriter sw = new StringWriter();
                        HtmlTextWriter hw = new HtmlTextWriter(sw);

                        gvResult.RenderControl(hw);

                        Response.Write(sw.ToString());
                        Response.End();
                    }
            }
        }
    }