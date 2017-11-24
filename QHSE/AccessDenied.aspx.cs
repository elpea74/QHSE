using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QHSE
{
    public partial class AccessDenied : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.IsInRole("Admin"))
            {
                hlBackAdmin.Visible = true;
                hlBackUser.Visible = false;
                hlLogout.Visible = false;
            }
            else if (User.IsInRole("User"))
            {
                hlBackUser.Visible = true;
                hlBackAdmin.Visible = false;
                hlLogout.Visible = false;
            }
            else
            {
                hlBackUser.Visible = false;
                hlBackAdmin.Visible = false;
                hlLogout.Visible = true;
            }
        }
    }
}