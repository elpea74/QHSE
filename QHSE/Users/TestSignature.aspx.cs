using System;
using System.Collections.Generic;
using System.IO;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace QHSE.Users
{
    public partial class TestSignature : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string signature = hfimg.Value;
            string concat = signature.Replace("data:image/png;base64,", "");
            byte[] imageBytes = Convert.FromBase64String(concat);
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
            // Convert byte[] to Image
            ms.Write(imageBytes, 0, imageBytes.Length);
            if (imageBytes.Length > 0)
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                //save image
                image.Save(Server.MapPath("~/Signature/" + Guid.NewGuid() + ".png"), ImageFormat.Png);
            }

            string signature2 = hfimg2.Value;
            string concat2 = signature2.Replace("data:image/png;base64,", "");
            byte[] imageBytes2 = Convert.FromBase64String(concat2);
            MemoryStream ms2 = new MemoryStream(imageBytes2, 0, imageBytes2.Length);
            // Convert byte[] to Image
            if (imageBytes2.Length > 0)
            {
                ms2.Write(imageBytes2, 0, imageBytes2.Length);
                System.Drawing.Image image2 = System.Drawing.Image.FromStream(ms2, true);
                //save image
                image2.Save(Server.MapPath("~/Signature/" + Guid.NewGuid() + ".png"), ImageFormat.Png);
            }
        }
    }
}