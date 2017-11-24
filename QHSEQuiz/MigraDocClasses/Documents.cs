using MigraDoc.DocumentObjectModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QHSEQuiz.MigraDocClasses;

namespace QHSEQuiz.MigraDocClasses
{
    public class Documents
    {
        public static Document CreateDocument(string hubName)
        {
            // Create a new MigraDoc document
            Document document = new Document();
            document.Info.Title = "QHSE Quiz Results";
            document.Info.Subject = "";
            document.Info.Author = "QHSE Bollore";

            Styles.DefineStyles(document);

            //Cover.DefineCover(document);
            //TableOfContents.DefineTableOfContents(document);

            DefineContentSection(document);

            if (hubName == "All")
            {
                Paragraphs.DefineParagraphs(document);
            }
            else
            {
                Paragraphs.DefineParagraphs(document, hubName);
            }
            //Tables.DefineTables(document);
            //Charts.DefineCharts(document);

            return document;
        }

        /// <summary>
        /// Defines page setup, headers, and footers.
        /// </summary>
        static void DefineContentSection(Document document)
        {
            Section section = document.AddSection();
            section.PageSetup.OddAndEvenPagesHeaderFooter = true;
            section.PageSetup.StartingNumber = 1;

            string generatedTime = "PDF generated at " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
            HeaderFooter header = section.Headers.Primary;
            header.AddParagraph(generatedTime);

            header = section.Headers.EvenPage;
            header.AddParagraph(generatedTime);
            //HeaderFooter header = section.Headers.Primary;
            //header.AddParagraph("\tOdd Page Header");

            //header = section.Headers.EvenPage;
            //header.AddParagraph("Even Page Header");

            // Create a paragraph with centered page number. See definition of style "Footer".
            Paragraph paragraph = new Paragraph();
            paragraph.AddTab();
            paragraph.AddPageField();

            // Add paragraph to footer for odd pages.
            section.Footers.Primary.Add(paragraph);
            // Add clone of paragraph to footer for odd pages. Cloning is necessary because an object must
            // not belong to more than one other object. If you forget cloning an exception is thrown.
            section.Footers.EvenPage.Add(paragraph.Clone());
        }
    }
}