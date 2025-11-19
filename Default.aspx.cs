using System;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRequestDemo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/src/Register.aspx");
    }
}