using MigraDoc.DocumentObjectModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QHSEQuiz.Model;

namespace QHSEQuiz.MigraDocClasses
{
    public class Paragraphs
    {
        public static void DefineParagraphs(Document document)
        {
            QuizEntities context = new QuizEntities();
            List<QuizResult> qrList = context.QuizResults.ToList();
            foreach (QuizResult qr in qrList)
            {
                string quizName = context.Quizs.Where(x => x.QuizId == qr.QuizId).Select(x => x.Name).First();
                string quizTaker = context.QuizResults.Where(x => x.ResultId == qr.ResultId).Select(x => x.Name).First();
                string hub = context.QuizResults.Where(x => x.ResultId == qr.ResultId).Select(x => x.Username).First();
                int? HRMS = context.QuizResults.Where(x => x.ResultId == qr.ResultId).Select(x => x.HRMS).First();
                decimal? score = context.QuizResults.Where(x => x.ResultId == qr.ResultId).Select(x => x.Mark).First();

                Paragraph para = document.LastSection.AddParagraph(quizName, "Heading1");
                para.Format.Alignment = ParagraphAlignment.Center;
                para = document.LastSection.AddParagraph("Name: ");
                para.AddText(quizTaker);
                para.AddLineBreak();
                para.AddText(hub);
                para.AddLineBreak();
               
                
                if (score < 80)
                { 
                FormattedText ftScore = para.AddFormattedText("Score: " + score + "%");
                    ftScore.Color = Colors.Red;
                }
                else
                {
                    FormattedText ftScore = para.AddFormattedText("Score: " + score + "%");
                    ftScore.Color = Colors.Green;
                }
                para.AddLineBreak();
                if (HRMS != null)
                {
                    para = document.LastSection.AddParagraph("HRMS: ");
                    para.AddText(HRMS.ToString());
                    para.AddLineBreak();
                    para.AddLineBreak();
                }
                else
                {
                    para.AddLineBreak();
                }

                List<QuestionResponse> qresList = context.QuestionResponses.Where(x => x.ResultId == qr.ResultId).ToList();
                foreach(QuestionResponse qres in qresList)
                {
                    string question = context.Questions.Where(x => x.QuestionId == qres.QuestionId).Select(x => x.Description).First();
                    int? questionIndex = context.Questions.Where(x => x.QuestionId == qres.QuestionId).Select(x => x.OrderInQuiz).First();
                    FormattedText ft = para.AddFormattedText(questionIndex.ToString() + ". " + question);
                    //ft.Size = 12;
                    ft.Bold = true;
                    ft.Color = Colors.Navy;                   
                    para.AddLineBreak();
                    string response = context.QuestionOptions.Where(x => x.OptionId == qres.OptionId).Select(x => x.Description).First();
                    int answerId = context.QuestionAnswers.Where(x => x.QuestionId == qres.QuestionId).Select(x => x.OptionId).First();
                    string answer = context.QuestionOptions.Where(x => x.OptionId == answerId).Select(x => x.Description).First();
                    para = document.LastSection.AddParagraph("Response: " + response);
                    para.AddLineBreak();

                    if (response == answer)
                    {
                        //para = document.LastSection.AddParagraph();
                        FormattedText ftResponse = para.AddFormattedText("Correct!");
                        ftResponse.Color = Colors.Green;
                    }
                    else
                    {
                        //para = document.LastSection.AddParagraph();
                        FormattedText ftResponse = para.AddFormattedText("Incorrect!");
                        ftResponse.Color = Colors.Red;
                    }

                    //para = document.LastSection.AddParagraph();
                    //para.AddText(response);
                    para.AddLineBreak();
                    para.AddLineBreak();
                }
                
            }
            //Paragraph paragraph = document.LastSection.AddParagraph("Paragraph Layout Overview", "Heading1");
            //paragraph.AddBookmark("Paragraphs");

            //DemonstrateAlignment(document);
            //DemonstrateIndent(document);
            //DemonstrateFormattedText(document);
            //DemonstrateBordersAndShading(document);
        }

        public static void DefineParagraphs(Document document, string hubName)
        {
            QuizEntities context = new QuizEntities();
            string hubUsername = context.Hubs.Where(x => x.Name == hubName).Select(x => x.UserName).First();
            List<QuizResult> qrList = context.QuizResults.Where(x => x.Username == hubUsername).ToList();
            foreach (QuizResult qr in qrList)
            {
                string quizName = context.Quizs.Where(x => x.QuizId == qr.QuizId).Select(x => x.Name).First();
                string quizTaker = context.QuizResults.Where(x => x.ResultId == qr.ResultId).Select(x => x.Name).First();
                string hub = context.QuizResults.Where(x => x.ResultId == qr.ResultId).Select(x => x.Username).First();
                int? HRMS = context.QuizResults.Where(x => x.ResultId == qr.ResultId).Select(x => x.HRMS).First();
                decimal? score = context.QuizResults.Where(x => x.ResultId == qr.ResultId).Select(x => x.Mark).First();

                Paragraph para = document.LastSection.AddParagraph(quizName, "Heading1");
                para.Format.Alignment = ParagraphAlignment.Center;
                para = document.LastSection.AddParagraph("Name: ");
                para.AddText(quizTaker);
                para.AddLineBreak();
                para.AddText(hub);
                para.AddLineBreak();

                if (score < 80)
                {
                    FormattedText ftScore = para.AddFormattedText("Score: " + score + "%");
                    ftScore.Color = Colors.Red;
                }
                else
                {
                    FormattedText ftScore = para.AddFormattedText("Score: " + score + "%");
                    ftScore.Color = Colors.Green;
                }
                para.AddLineBreak();
                if (HRMS != null)
                {
                    para = document.LastSection.AddParagraph("HRMS: ");
                    para.AddText(HRMS.ToString());
                    para.AddLineBreak();
                    para.AddLineBreak();
                }

                List<QuestionResponse> qresList = context.QuestionResponses.Where(x => x.ResultId == qr.ResultId).ToList();
                foreach (QuestionResponse qres in qresList)
                {
                    string question = context.Questions.Where(x => x.QuestionId == qres.QuestionId).Select(x => x.Description).First();
                    int? questionIndex = context.Questions.Where(x => x.QuestionId == qres.QuestionId).Select(x => x.OrderInQuiz).First();
                    FormattedText ft = para.AddFormattedText(questionIndex.ToString() + ". " + question);
                    //ft.Size = 12;
                    ft.Bold = true;
                    ft.Color = Colors.Navy;
                    para.AddLineBreak();
                    string response = context.QuestionOptions.Where(x => x.OptionId == qres.OptionId).Select(x => x.Description).First();
                    int answerId = context.QuestionAnswers.Where(x => x.QuestionId == qres.QuestionId).Select(x => x.OptionId).First();
                    string answer = context.QuestionOptions.Where(x => x.OptionId == answerId).Select(x => x.Description).First();
                    para = document.LastSection.AddParagraph("Response: " + response);
                    para.AddLineBreak();

                    if (response == answer)
                    {
                        //para = document.LastSection.AddParagraph();
                        FormattedText ftResponse = para.AddFormattedText("Correct!");
                        ftResponse.Color = Colors.Green;
                    }
                    else
                    {
                        //para = document.LastSection.AddParagraph();
                        FormattedText ftResponse = para.AddFormattedText("Incorrect!");
                        ftResponse.Color = Colors.Red;
                    }

                    //para = document.LastSection.AddParagraph();
                    //para.AddText(response);
                    para.AddLineBreak();
                    para.AddLineBreak();
                }

            }
            //Paragraph paragraph = document.LastSection.AddParagraph("Paragraph Layout Overview", "Heading1");
            //paragraph.AddBookmark("Paragraphs");

            //DemonstrateAlignment(document);
            //DemonstrateIndent(document);
            //DemonstrateFormattedText(document);
            //DemonstrateBordersAndShading(document);
        }

        static void DemonstrateAlignment(Document document)
        {
            document.LastSection.AddParagraph("Alignment", "Heading2");

            document.LastSection.AddParagraph("Left Aligned", "Heading3");

            Paragraph paragraph = document.LastSection.AddParagraph();
            paragraph.Format.Alignment = ParagraphAlignment.Left;
            paragraph.AddText(FillerText.Text);

            document.LastSection.AddParagraph("Right Aligned", "Heading3");

            paragraph = document.LastSection.AddParagraph();
            paragraph.Format.Alignment = ParagraphAlignment.Right;
            paragraph.AddText(FillerText.Text);

            document.LastSection.AddParagraph("Centered", "Heading3");

            paragraph = document.LastSection.AddParagraph();
            paragraph.Format.Alignment = ParagraphAlignment.Center;
            paragraph.AddText(FillerText.Text);

            document.LastSection.AddParagraph("Justified", "Heading3");

            paragraph = document.LastSection.AddParagraph();
            paragraph.Format.Alignment = ParagraphAlignment.Justify;
            paragraph.AddText(FillerText.MediumText);
        }

        static void DemonstrateIndent(Document document)
        {
            document.LastSection.AddParagraph("Indent", "Heading2");

            document.LastSection.AddParagraph("Left Indent", "Heading3");

            Paragraph paragraph = document.LastSection.AddParagraph();
            paragraph.Format.LeftIndent = "2cm";
            paragraph.AddText(FillerText.Text);

            document.LastSection.AddParagraph("Right Indent", "Heading3");

            paragraph = document.LastSection.AddParagraph();
            paragraph.Format.RightIndent = "1in";
            paragraph.AddText(FillerText.Text);

            document.LastSection.AddParagraph("First Line Indent", "Heading3");

            paragraph = document.LastSection.AddParagraph();
            paragraph.Format.FirstLineIndent = "12mm";
            paragraph.AddText(FillerText.Text);

            document.LastSection.AddParagraph("First Line Negative Indent", "Heading3");

            paragraph = document.LastSection.AddParagraph();
            paragraph.Format.LeftIndent = "1.5cm";
            paragraph.Format.FirstLineIndent = "-1.5cm";
            paragraph.AddText(FillerText.Text);
        }

        static void DemonstrateFormattedText(Document document)
        {
            document.LastSection.AddParagraph("Formatted Text", "Heading2");

            //document.LastSection.AddParagraph("Left Aligned", "Heading3");

            Paragraph paragraph = document.LastSection.AddParagraph();
            paragraph.AddText("Text can be formatted ");
            paragraph.AddFormattedText("bold", TextFormat.Bold);
            paragraph.AddText(", ");
            paragraph.AddFormattedText("italic", TextFormat.Italic);
            paragraph.AddText(", or ");
            paragraph.AddFormattedText("bold & italic", TextFormat.Bold | TextFormat.Italic);
            paragraph.AddText(".");
            paragraph.AddLineBreak();
            paragraph.AddText("You can set the ");
            FormattedText formattedText = paragraph.AddFormattedText("size ");
            formattedText.Size = 15;
            paragraph.AddText("the ");
            formattedText = paragraph.AddFormattedText("color ");
            formattedText.Color = Colors.Firebrick;
            paragraph.AddText("the ");
            paragraph.AddFormattedText("font", new Font("Verdana"));
            paragraph.AddText(".");
            paragraph.AddLineBreak();
            paragraph.AddText("You can set the ");
            formattedText = paragraph.AddFormattedText("subscript");
            formattedText.Subscript = true;
            paragraph.AddText(" or ");
            formattedText = paragraph.AddFormattedText("superscript");
            formattedText.Superscript = true;
            paragraph.AddText(".");
        }

        static void DemonstrateBordersAndShading(Document document)
        {
            document.LastSection.AddPageBreak();
            document.LastSection.AddParagraph("Borders and Shading", "Heading2");

            document.LastSection.AddParagraph("Border around Paragraph", "Heading3");

            Paragraph paragraph = document.LastSection.AddParagraph();
            paragraph.Format.Borders.Width = 2.5;
            paragraph.Format.Borders.Color = Colors.Navy;
            paragraph.Format.Borders.Distance = 3;
            paragraph.AddText(FillerText.MediumText);

            document.LastSection.AddParagraph("Shading", "Heading3");

            paragraph = document.LastSection.AddParagraph();
            paragraph.Format.Shading.Color = Colors.LightCoral;
            paragraph.AddText(FillerText.Text);

            document.LastSection.AddParagraph("Borders & Shading", "Heading3");

            paragraph = document.LastSection.AddParagraph();
            paragraph.Style = "TextBox";
            paragraph.AddText(FillerText.MediumText);

        }
    }
}