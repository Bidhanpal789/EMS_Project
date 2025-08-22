using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class src_Student_Dashboard : System.Web.UI.MasterPage
{
    //string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conn= new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            if (Session["userName"] == null)
            {

                Response.Write("<script>alert('Session expired!!!');window.location.href='../Login.aspx';</script>");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM User_Master WHERE user_id = '"+ Session["userName"].ToString()+"'", conn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                lblUser.Text = dt.Rows[0]["user_fullname"].ToString();
                lblMail.Text = dt.Rows[0]["user_id"].ToString();
                //show();
                Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();

                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("pragma", "no-cache");
            }

        }
        Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        Response.ClearHeaders();
        Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
        Response.AddHeader("pragma", "no-cache");


    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        // Clear authentication
        FormsAuthentication.SignOut();

        // Abandon session
        Session.Abandon();

        // Clear cookies
        HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
        authCookie.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(authCookie);

        // Redirect to login with success message
        Response.Redirect("../Login.aspx?logout=success");
    }
}
