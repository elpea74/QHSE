using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QHSE
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Request.IsAuthenticated && !string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                    // This is an unauthorized, authenticated request...
                    Response.Redirect("~/AccessDenied.aspx");

                if (this.Page.User.Identity.IsAuthenticated)
                {
                    if (User.IsInRole("Admin"))
                    {
                        Response.Redirect("~/Admin/ReportList.aspx");
                    }
                    else if (User.IsInRole("User"))
                    {
                        Response.Redirect("~/Users/ObservationList.aspx");
                    }
                    else
                    {
                        FormsAuthentication.SignOut();
                        Response.Redirect("~/Login.aspx");
                    }

                }

                
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {      // Initialize FormsAuthentication, for what it's worth
               //    FormsAuthentication.Initialize();
               //    // Create our connection and command objects
               //    string CS = ConfigurationManager.ConnectionStrings["QHSEConnectionString"].ConnectionString;
               //    SqlConnection conn = new SqlConnection(CS);
               //    SqlCommand cmd = conn.CreateCommand();
               //    cmd.CommandText = "SELECT Role FROM Employee WHERE userName=@username " +
               //        "AND password=@password";
               //    // Fill our parameters
               //    cmd.Parameters.Add("@username", SqlDbType.NVarChar, 64).Value = UserName.Text;
               //    cmd.Parameters.Add("@password", SqlDbType.NVarChar, 128).Value =
               //    FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text, "md5");
               //                            // Execute the command
               //    conn.Open();
               //    SqlDataReader reader = cmd.ExecuteReader();
               //    if (reader.Read())
               //    {
               //        // Create a new ticket used for authentication
               //        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
               //        1, // Ticket version
               //        UserName.Text, // Username associated with ticket
               //        DateTime.Now, // Date/time issued
               //        DateTime.Now.AddMinutes(30), // Date/time to expire
               //        true, // "true" for a persistent user cookie
               //        reader["Role"].ToString(), // User-data, in this case the roles
               //        FormsAuthentication.FormsCookiePath);// Path cookie valid for
               //                                             // Encrypt the cookie using the machine key for secure transport
               //        string hash = FormsAuthentication.Encrypt(ticket);
               //        HttpCookie cookie = new HttpCookie(   
               //        FormsAuthentication.FormsCookieName, // Name of auth cookie
               //        hash); // Hashed ticket
               //               // Set the cookie's expiration time to the tickets expiration time
               //        if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;
               //        // Add the cookie to the list for outgoing response
               //        Response.Cookies.Add(cookie);
               //        // Redirect to requested URL, or homepage if no previous page
               //        // requested
               //        string returnUrl = Request.QueryString["ReturnUrl"];
               //        if (returnUrl == null)
               //            returnUrl = "~/Welcome.aspx";

            //        Response.Redirect(returnUrl);
            //    }
            //    else
            //    {
            //        // Never tell the user if just the username is password is incorrect.
            //        // That just gives them a place to start, once they've found one or
            //        // the other is correct!
            //        FailureText.Text = "Username / password incorrect. Please try again.";
            //        FailureText.Visible = true;
            //    }
            //    reader.Close();
            //    conn.Close();
            //}

            //{
            //    if (AuthenticateUser(UserName.Text, Password.Text))
            //    {
            //        string returnUrl = Request.QueryString["ReturnUrl"];
            //        if (returnUrl == null)
            //            returnUrl = "~/Welcome.aspx";
            //        Response.Redirect(returnUrl);
            //    }
            //    else
            //    {
            //        txtFailure.Text = "Invalid username and/or password";
            //    }
            //}

            //private bool AuthenticateUser(string username, string password)
            //{
            //    string CS = ConfigurationManager.ConnectionStrings["QHSEConnectionString"].ConnectionString;
            //    FormsAuthentication.Initialize();
            //    using (SqlConnection con = new SqlConnection(CS))
            //    {
            //        SqlCommand cmd = new SqlCommand("spAuthenticateUser", con);
            //        cmd.CommandType = CommandType.StoredProcedure;

            //        string encryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");

            //        SqlParameter paramUsername = new SqlParameter("@UserName", username);
            //        SqlParameter paramPassword = new SqlParameter("@Password", encryptedPassword);

            //        cmd.Parameters.Add(paramUsername);
            //        cmd.Parameters.Add(paramPassword);

            //        con.Open();
            //        int ReturnCode = (int)cmd.ExecuteScalar();
            //        //SqlDataReader reader = cmd.ExecuteReader();
            //        //if (reader.Read())
            //        //{
            //        //    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
            //        //        1, // Ticket version
            //        //        UserName.Text, // Username associated with ticket
            //        //        DateTime.Now, // Date/time issued
            //        //        DateTime.Now.AddMinutes(30), // Date/time to expire
            //        //        true, // "true" for a persistent user cookie
            //        //        reader.GetString(), // User-data, in this case the roles
            //        //        FormsAuthentication.FormsCookiePath);
            //        //    string hash = FormsAuthentication.Encrypt(ticket);
            //        //    HttpCookie cookie = new HttpCookie(
            //        //        FormsAuthentication.FormsCookieName, // Name of auth cookie
            //        //        hash); // Hashed ticket

            //        //    //Set the cookie's expiration time to the tickets expiration time
            //        //    if (ticket.IsPersistent)
            //        //        cookie.Expires = ticket.Expiration;

            //        //    //Add the cookie to the list for outgoing response
            //        //    Response.Cookies.Add(cookie);
            //        }
            //        return ReturnCode == 1;
            //    }
        }
    }
}
