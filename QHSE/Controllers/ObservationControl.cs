using System;
using System.Collections.Generic;
using System.Linq;
using QHSE.Model;
using System.Web;

namespace QHSE.Controllers
{
    public class ObservationControl
    {
        QHSEEntities context = new QHSEEntities();
        public Object GetAllObservationsByUser(string username)
        {
            var obsList = (from x in context.Observations
                           where x.Name.ToLower() == username
                           orderby x.Date descending
                           select new
                           {
                               Date = x.Date,
                               Location = x.Location,
                               Others = x.Others,
                               Classification = x.Classification,
                               CardId = x.CardId

                           }).ToList();

            return obsList;
        }

        public Object GetObservationByYear(string username, int year)
        {
            var obsList = (from x in context.Observations
                           where x.Name == username
                           where x.Date.Year == year
                           orderby x.Date descending
                           select new
                           {
                               Date = x.Date,
                               Location = x.Location,
                               Others = x.Others,
                               Classification = x.Classification,
                               CardId = x.CardId

                           }).ToList();

            return obsList;
        }

        public void UpdateObservation(Observation obs)
        {
            try
            {
                using (context = new QHSEEntities())
                {
                    Observation observation = context.Observations.Where(x => x.CardId == obs.CardId).First<Observation>();
                    observation.Date = obs.Date;
                    observation.Location = obs.Location;
                    observation.Others = obs.Others;
                    observation.Classification = obs.Classification;
                    observation.Description = obs.Description;
                    observation.ImmediateAction = obs.ImmediateAction;
                    observation.FurtherAction = obs.FurtherAction;
                    observation.PositiveComment = obs.PositiveComment;
                    observation.PhotoPath = obs.PhotoPath;
                    context.SaveChanges();
                }
            }
            catch (Exception e)
            {
                throw e;
                //}
            }
        }
    }
}