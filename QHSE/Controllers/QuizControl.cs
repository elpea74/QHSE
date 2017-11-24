using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QHSE.Model;

namespace QHSE.Controllers
{
    public class QuizControl
    {
        QHSEEntities context = new QHSEEntities();

        public Object GetAvailableQuizzes()
        {


            DateTime today = DateTime.Now.Date;
            var quizList = (from x in context.Quizs
                            //from y in context.QuizResults
                            where x.StartDate < today
                            where x.EndDate > today
                            //where y.QuizId != x.QuizId
                            //where y.Username != username
                            select new
                            {
                                QuizId = x.QuizId,
                                Name = x.Name,
                                //Description = x.Description,
                                StartDate = x.StartDate,
                                EndDate = x.EndDate

                            }).ToList();

            return quizList;
        }

        public string GetOwnAnswer(int questionId, int quizResultId)
        {
            string ownAnswer = (from x in context.QuestionOptions
             from z in context.QuestionResponses
             where x.OptionId == z.OptionId
             where x.QuestionId == questionId
             where z.ResultId == quizResultId

             select x.Description).First();

            return ownAnswer;
        }

        public string GetCorrectAnswer(int questionId)
        {
            string correctAnswer = (from x in context.QuestionOptions
                                 from y in context.QuestionAnswers
                                 where x.OptionId == y.OptionId
                                 where x.QuestionId == questionId
                                 select x.Description).First();
            return correctAnswer;
        }
    }
}