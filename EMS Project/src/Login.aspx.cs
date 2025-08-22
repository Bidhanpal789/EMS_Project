using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

public partial class src_Login : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.CacheControl = "no-cache";
        Response.Expires = 0;
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlDataAdapter sda = new SqlDataAdapter("LoginValidation", connectionString);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.AddWithValue("@userid", txtUsername.Text);
        sda.SelectCommand.Parameters.AddWithValue("@pass", txtPassword.Text);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["user_type"].ToString() == "Admin")
            {
                Session["userName"] = dt.Rows[0]["user_id"].ToString();
                Session["UserMail"] = dt.Rows[0]["user_mobile"].ToString();
                Session["userId"] = dt.Rows[0]["id"].ToString();

                Response.Redirect("~/src/Dashboard/Dashboard.aspx");
            }
            else if (dt.Rows[0]["user_type"].ToString() == "Teacher")
            {
                Session["userName"] = dt.Rows[0]["user_id"].ToString();
                Session["UserMail"] = dt.Rows[0]["user_mobile"].ToString();
                Session["userId"] = dt.Rows[0]["id"].ToString();

                Response.Redirect("~/src/Teacher/Dashboard.aspx");

            }
            else if (dt.Rows[0]["user_type"].ToString() == "Student")
            {
                Session["userName"] = dt.Rows[0]["user_id"].ToString();
                Session["UserMail"] = dt.Rows[0]["user_mobile"].ToString();
                Session["userId"] = dt.Rows[0]["id"].ToString();
                Response.Redirect("~/src/Student/Dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Please enter valid id password.');</script>");

            }

        }

        else
        {
            Response.Write("<script>alert('Please enter valid id password.');</script>");

        }

    }
}