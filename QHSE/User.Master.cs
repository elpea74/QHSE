using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QHSE
{
    public partial class User : System.Web.UI.MasterPage
    {
        public static IIdentity Identity { get; internal set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}