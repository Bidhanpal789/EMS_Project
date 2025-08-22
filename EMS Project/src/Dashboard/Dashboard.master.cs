using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

public partial class _src_Dashboard_Dashboard : System.Web.UI.MasterPage
{
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
                lblUser.Text = Session["userName"].ToString();
                lblUser1.Text = Session["userName"].ToString();
                lblMail.Text = Session["UserMail"].ToString();
                lblMail2.Text = Session["UserMail"].ToString();
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
    protected void aDash_click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    protected void aExamS_click(object sender, EventArgs e)
    {
        Response.Redirect("ExamSchedule.aspx");
    }
    protected void aStudent_click(object sender, EventArgs e)
    {
        Response.Redirect("Students.aspx");
    }
    protected void aInvi_click(object sender, EventArgs e)
    {
        Response.Redirect("Invigilators.aspx");
    }
    protected void aExamD_click(object sender, EventArgs e)
    {
        Response.Redirect("ExamDetails1.aspx");
    }
    protected void aRoomD_click(object sender, EventArgs e)
    {
        Response.Redirect("Roomdetails.aspx");
    }
    protected void aReport_click(object sender, EventArgs e)
    {
        Response.Redirect("Reports.aspx");
    }
}
