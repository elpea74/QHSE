using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QHSEQuiz.Model;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace QHSEQuiz.Control
{
    public class QuizControl
    {
        QuizEntities context = new QuizEntities();

        private SqlConnection conn;
        private SqlDataReader sqldatareader;
        private DataSet sqldataset = new DataSet();
        private DataTable sqldatatable = new DataTable();

        string databaseString = ConfigurationManager.ConnectionStrings["QuizConnectionString"].ConnectionString;


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

        public List<string> GetQuizNames()
        {
            List<string> quizList = (from x in context.Quizs
                                     select x.Name).Distinct().ToList();
            return quizList;
        }

        public Object GetResults()
        {
            Object resultList = (from x in context.QuizResults
                                 from y in context.Quizs
                                 from z in context.Hubs
                                 where x.QuizId == y.QuizId
                                 where x.Username == z.UserName
                                 orderby x.TimeSubmitted descending
                                 orderby x.HRMS
                                 select new
                                 {
                                     Name = x.Name,
                                     Username = x.Username,
                                     HRMS = x.HRMS,
                                     Hub = z.Name,
                                     ResultId = x.ResultId,
                                     QuizId = x.QuizId,
                                     QuizName = y.Name,
                                     Mark = x.Mark,
                                     TimeSubmitted = x.TimeSubmitted,
                                     Result = x.Result
                                 }).ToList();
            return resultList;
        }

        public Object GetResultsByHub(string hub)
        {
            Object resultList = (from x in context.QuizResults
                                 from y in context.Quizs
                                 from z in context.Hubs
                                 where x.QuizId == y.QuizId
                                 where x.Username == z.UserName
                                 where z.Name == hub
                                 orderby x.TimeSubmitted 
                                 orderby x.HRMS
                                 select new
                                 {
                                     Name = x.Name,
                                     Username = x.Username,
                                     Hub = z.Name,
                                     HRMS = x.HRMS,
                                     ResultId = x.ResultId,
                                     QuizId = x.QuizId,
                                     QuizName = y.Name,
                                     Mark = x.Mark,
                                     TimeSubmitted = x.TimeSubmitted,
                                     Result = x.Result
                                 }).ToList();
            return resultList;
        }

        public Object GetResultsByQuiz(string quizName)
        {
            Object resultList = (from x in context.QuizResults
                                 from y in context.Quizs
                                 from z in context.Hubs
                                 where y.Name == quizName
                                 where x.QuizId == y.QuizId
                                 where x.Username == z.UserName
                                 orderby x.TimeSubmitted 
                                 orderby x.HRMS
                                 select new
                                 {
                                     Name = x.Name,
                                     Username = x.Username,
                                     Hub = z.Name,
                                     HRMS = x.HRMS,
                                     ResultId = x.ResultId,
                                     QuizId = x.QuizId,
                                     QuizName = y.Name,
                                     Mark = x.Mark,
                                     TimeSubmitted = x.TimeSubmitted,
                                     Result = x.Result
                                 }).ToList();
            return resultList;
        }

        public Object GetResultsByHubQuiz(string quizName, string hub)
        {
            Object resultList = (from x in context.QuizResults
                                 from y in context.Quizs
                                 from z in context.Hubs
                                 where y.Name == quizName
                                 where x.QuizId == y.QuizId
                                 where x.Username == z.UserName
                                 where z.Name == hub
                                 orderby x.TimeSubmitted 
                                 orderby x.HRMS
                                 select new
                                 {
                                     Name = x.Name,
                                     Username = x.Username,
                                     Hub = z.Name,
                                     HRMS = x.HRMS,
                                     ResultId = x.ResultId,
                                     QuizId = x.QuizId,
                                     QuizName = y.Name,
                                     Mark = x.Mark,
                                     TimeSubmitted = x.TimeSubmitted,
                                     Result = x.Result
                                 }).ToList();
            return resultList;
        }

        public QuizControl()
        {
            conn = new SqlConnection(databaseString);
        }

        public SqlConnection Openconn()
        {
            if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
            {
                conn.Open();
            }
            return conn;
        }

        //close the db connection
        public SqlConnection Closeconn()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            return conn;
        }

        //to execute a nonquery
        public void ExecuteQuery(SqlCommand Execcmd)
        {
            try
            {
                Execcmd.Connection = Openconn();
                Execcmd.ExecuteNonQuery();
            }
            catch (Exception Ex)
            {
                Ex.Message.ToString();
            }
            finally
            {
                Execcmd.Connection = Closeconn();
            }
        }

        //to execute a nonquery
        public int ReturnIDonExecuteQuery(SqlCommand Execcmd)
        {
            int insertid = 0;
            try
            {
                Execcmd.Connection = Openconn();
                insertid = Convert.ToInt32(Execcmd.ExecuteScalar());
            }
            catch (Exception Ex)
            {
                Ex.Message.ToString();
            }
            finally
            {
                Execcmd.Connection = Closeconn();
            }
            return insertid;
        }

        //returns a dataset
        public DataSet returnDataSet(SqlCommand DScmd)
        {
            SqlDataAdapter DSadapater;
            try
            {
                sqldataset.Clear();
                DScmd.Connection = Openconn();
                DSadapater = new SqlDataAdapter(DScmd);
                DSadapater.Fill(sqldataset);
            }
            catch (Exception Ex)
            {
                Ex.Message.ToString();
            }
            finally
            {
                DScmd.Connection = Closeconn();
            }
            return sqldataset;
        }

        //returns a datatable
        public DataTable returnDataTable(SqlCommand DTcmd)
        {
            SqlDataAdapter DTadapter;
            try
            {
                sqldatatable.Clear();
                DTcmd.Connection = Openconn();
                DTadapter = new SqlDataAdapter(DTcmd);
                DTadapter.Fill(sqldatatable);
            }
            catch (Exception Ex)
            {
                Ex.Message.ToString();
            }
            finally
            {
                DTcmd.Connection = Closeconn();
            }
            return sqldatatable;
        }

        //returns a datareader
        public SqlDataReader returnDataReader(SqlCommand DRcmd)
        {
            try
            {
                DRcmd.Connection = Openconn();
                sqldatareader = DRcmd.ExecuteReader();
                return sqldatareader;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                DRcmd.Connection = null;
            }
        }
    }
}