using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_Student_Settings : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }

    }
    protected void CurrentPass_checck(object sender, EventArgs e)
    {
        
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string fQry = "select * from User_Master where user_id='" + Session["userName"].ToString() + "'";
            SqlDataAdapter sda = new SqlDataAdapter(fQry, conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (txtCurrentPassword.Text == dt.Rows[0]["user_pass"].ToString())
                {
                    
                }
                else
                {
                    Response.Write("<script>alert('Current Password didn't match with you have entered!!!');</script>");
                }
            }
        }
        catch (Exception ex)
        {
            ShowMessage("Error loading profile: " + ex.Message, "danger");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
       
        // Handle password change if fields are filled
        if (!string.IsNullOrEmpty(txtCurrentPassword.Text) &&
            !string.IsNullOrEmpty(txtNewPassword.Text) &&
            !string.IsNullOrEmpty(txtConfirmPassword.Text))
        {
            UpdatePassword();
        }
    }
    private void ShowMessage(string message, string type)
    {
        pnlMessage.Visible = true;
        lblMessage.Text = message;
        pnlMessage.CssClass = $"alert alert-{type} alert-dismissible fade show";
    }

    private void UpdatePassword()
    {
        // First verify current password
        string verifyQuery = "SELECT COUNT(*) FROM User_Master WHERE user_id = @userId AND user_password = @password";

        using (SqlCommand cmd = new SqlCommand(verifyQuery, conn))
        {
            cmd.Parameters.AddWithValue("@userId", Session["userName"].ToString());
            cmd.Parameters.AddWithValue("@password", txtCurrentPassword.Text.Trim()); // Note: In production, hash this

            int match = (int)cmd.ExecuteScalar();

            if (match == 0)
            {
                ShowMessage("Current password is incorrect", "danger");
                return;
            }
        }

        // Update password
        string updateQuery = "UPDATE User_Master SET user_password = @newPassword WHERE user_id = @UserId";

        using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
        {
            cmd.Parameters.AddWithValue("@newPassword", txtNewPassword.Text.Trim()); // Note: In production, hash this
            cmd.Parameters.AddWithValue("@userId", Session["userName"].ToString());

            cmd.ExecuteNonQuery();
            ShowMessage("Password updated successfully!", "success");

            // Clear password fields
            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}