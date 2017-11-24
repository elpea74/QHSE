using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QHSE.Controllers;
using QHSE.Model;

namespace QHSE.Controllers
{
    public class UserControl
    {
        QHSEEntities context;
        public void UpdateEmployee(Employee emp)
        {
            try
            {
                using (context = new QHSEEntities())
                {
                    Employee employee = context.Employees.Where(x => x.UserName == emp.UserName).First<Employee>();
                    employee.UserName = emp.UserName;
                    employee.Name = emp.Name;
                    if (emp.HRMS != null)
                    {
                        employee.HRMS = emp.HRMS;
                    }
                    employee.Title = emp.Title;
                    employee.Department = emp.Department;
                    employee.Email = emp.Email;
                    employee.Role = emp.Role;
                    if (emp.Password != null)
                    {
                        employee.Password = emp.Password;
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