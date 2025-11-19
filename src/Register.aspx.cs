using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;




public partial class src_Register : System.Web.UI.Page
{
    //string con = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        DataTable dt= new DataTable();

        SqlDataAdapter sda = new SqlDataAdapter("InsertUserDetails", conn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        
        sda.SelectCommand.Parameters.AddWithValue("@name", txtFullName.Text);
        sda.SelectCommand.Parameters.AddWithValue("@mail", txtMail.Text);
        
        sda.SelectCommand.Parameters.AddWithValue("@Institution", txtInstitution.Text);
        sda.SelectCommand.Parameters.AddWithValue("@UserIDNo", txtIDCard.Text);
        sda.SelectCommand.Parameters.AddWithValue("@Password", txtPassword.Text);
        sda.SelectCommand.Parameters.AddWithValue("@mobileNo", "");
        if (rdoAdmin.Checked)
        {
            sda.SelectCommand.Parameters.AddWithValue("@userType",lblAdmin.Text);
        }
        else if (rdoStudent.Checked)
        {

            sda.SelectCommand.Parameters.AddWithValue("@userType", lblStudent.Text);
        }
        else if (rdoTeacher.Checked)
        {
            sda.SelectCommand.Parameters.AddWithValue("@userType", lblTeacher.Text);

        }
        else
        {
            Response.Write("<script>alert('Please select User Type!');</script>");
        }
            sda.Fill(dt);
        if (dt.Rows.Count > 0) {

            if (Convert.ToInt32(dt.Rows[0]["id"].ToString()) > 0)
            {
                Response.Write($"<Script>alert('User Data Save Successfully')</script>");
            }
            else {
                Response.Write($"<Script>alert('User Data Already Exists')</script>");
            }
        }
        else
        {
            Response.Write($"<Script>alert('Somethimg Went wrongS')</script>");
        }

        txtFullName.Text = "";
        txtMail.Text = "";
        txtInstitution.Text = "";
        txtIDCard.Text = "";
        txtPassword.Text = "";
        txtCNFPassword.Text = "";
        
    }
}