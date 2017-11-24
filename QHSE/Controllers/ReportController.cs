using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QHSE.Model;


namespace QHSE.Controllers
{
    public class ReportController
    {
        QHSEEntities context = new QHSEEntities();


        public Object GetAllReports()
        {

            var allReports = (from x in context.Reports
                              orderby x.Date descending
                              select new
                              {
                                  ReportNo = x.ReportNo,
                                  Location = x.Location,
                                  Classification = x.Classification,
                                  Date = x.Date,
                                  Submitter = x.SubmitterName
                              }).ToList();
            return allReports;
        }

        public Object GetReportByHub(string location)
        {

            var report = (from x in context.Reports
                          orderby x.Date descending
                          where x.Location == location
                          select new
                          {
                              ReportNo = x.ReportNo,
                              Location = x.Location,
                              Classification = x.Classification,
                              Date = x.Date,
                              Submitter = x.SubmitterName
                          }).ToList();
            return report;
        }

        public Object GetReportByClassification(string classification)
        {
            var report = (from x in context.Reports
                          orderby x.Date descending
                          where
                          x.Classification == classification
                          select new
                          {
                              ReportNo = x.ReportNo,
                              Location = x.Location,
                              Classification = x.Classification,
                              Date = x.Date,
                              Submitter = x.SubmitterName
                          }).ToList();
            return report;
        }

        public Object GetReportByHubClassification(string location, string classification)
        {

            var report = (from x in context.Reports
                          orderby x.Date descending
                          where x.Location == location
                          where x.Classification == classification
                          select new
                          {
                              ReportNo = x.ReportNo,
                              Location = x.Location,
                              Classification = x.Classification,
                              Date = x.Date,
                              Submitter = x.SubmitterName
                          }).ToList();
            return report;
        }

        public Object GetReportByYear(int year)
        {

            var report = (from x in context.Reports
                          orderby x.Date descending
                          where x.Date.Year == year
                          select new
                          {
                              ReportNo = x.ReportNo,
                              Location = x.Location,
                              Classification = x.Classification,
                              Date = x.Date,
                              Submitter = x.SubmitterName
                          }).ToList();
            return report;
        }

        public Object GetReportByHubYear(string hub, int year)
        {

            var report = (from x in context.Reports
                          orderby x.Date descending
                          where x.Date.Year == year
                          where x.Location == hub
                          select new
                          {
                              ReportNo = x.ReportNo,
                              Location = x.Location,
                              Classification = x.Classification,
                              Date = x.Date,
                              Submitter = x.SubmitterName
                          }).ToList();
            return report;
        }

        public Object GetReportByClassificationYear(string classification, int year)
        {

            var report = (from x in context.Reports
                          orderby x.Date descending
                          where x.Date.Year == year
                          where x.Classification == classification
                          select new
                          {
                              ReportNo = x.ReportNo,
                              Location = x.Location,
                              Classification = x.Classification,
                              Date = x.Date,
                              Submitter = x.SubmitterName
                          }).ToList();
            return report;
        }

        public Object GetReport(string location, string classification, int year)
        {
            var report = (from x in context.Reports
                          orderby x.Date descending
                          where x.Classification == classification
                          where x.Location == location
                          where x.Date.Year == year
                          select new
                          {
                              ReportNo = x.ReportNo,
                              Location = x.Location,
                              Classification = x.Classification,
                              Date = x.Date,
                              Submitter = x.SubmitterName
                          }).ToList();
            return report;
        }

        public void UpdateReport(Report r)
        {
            try
            {
                using (context = new QHSEEntities())
                {
                    Report report = context.Reports.Where(x => x.ReportNo == r.ReportNo).First<Report>();
                    report.ReportNo = r.ReportNo;
                    report.Date = r.Date;
                    report.Location = r.Location;
                    report.Classification = r.Classification;
                    report.Description = r.Description;
                    report.Memo = r.Memo;
                    if (report.PhotoPath == null)
                    report.PhotoPath = r.PhotoPath;
                    else
                    {
                        if (r.PhotoPath != null && r.PhotoPath != "")
                            report.PhotoPath = r.PhotoPath;
                        else
                            report.PhotoPath = report.PhotoPath;
                    }
                    context.SaveChanges();
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}