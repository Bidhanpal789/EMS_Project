using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

public partial class src_Dashboard_Profile : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        if (Session["userName"] == null)
        {
            Response.Redirect("~/src/Login.aspx");
            return;
        }

        LoadUserProfile();
        UploadProfilePicture();
    }

    private void LoadUserProfile()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "SELECT * FROM User_Master WHERE user_id = '" + Session["userName"].ToString() + "'";

            SqlDataAdapter sda = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                lblUserName.Text = dt.Rows[0]["user_fullname"].ToString();
                lblUserTitle.Text = dt.Rows[0]["user_type"].ToString();
                txtFullName.Text = dt.Rows[0]["user_fullname"].ToString();
                txtEmail.Text = dt.Rows[0]["user_id"].ToString();
                txtPhone.Text = dt.Rows[0]["user_mobile"].ToString();
                if (dt.Rows[0]["profile_image"] != DBNull.Value && !string.IsNullOrEmpty(dt.Rows[0]["profile_image"].ToString()))
                {
                    imgProfile.Attributes["src"] = dt.Rows[0]["profile_image"].ToString();
                }
                else
                {
                    // Set default profile image if no image exists
                    imgProfile.Attributes["src"] = "https://static.vecteezy.com/system/resources/previews/036/594/092/non_2x/man-empty-avatar-photo-placeholder-for-social-networks-resumes-forums-and-dating-sites-male-and-female-no-photo-images-for-unfilled-user-profile-free-vector.jpg";
                }

                if (dt.Rows[0]["user_dob"] != DBNull.Value)
                {
                    txtDOB.Text = Convert.ToDateTime(dt.Rows[0]["user_dob"]).ToString("yyyy-MM-dd");
                }

                ddlGender.SelectedItem.Text = dt.Rows[0]["user_gender"].ToString();

                // Show last updated time
                lblLastUpdated.Text = "Last updated: " + DateTime.Now.ToString("g");
                lblLastUpdated.Visible = true;
            }


        }
        catch (Exception ex)
        {
            ShowMessage("Error loading profile: " + ex.Message, "danger");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }

        }
    }

    protected void btnEditPersonal_Click(object sender, EventArgs e)
    {
        // Enable editing
        txtFullName.Enabled = true;
        txtDOB.Enabled = true;
        txtPhone.Enabled = true;
        ddlGender.Enabled = true;

        // Show cancel button
        btnCancel.Visible = true;

        // Hide edit button
        btnEditPersonal.Visible = false;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        // Disable editing
        txtFullName.Enabled = false;
        txtDOB.Enabled = false;
        txtPhone.Enabled = false;
        ddlGender.Enabled = false;

        // Reload original values
        LoadUserProfile();

        // Hide cancel button
        btnCancel.Visible = false;

        // Show edit button
        btnEditPersonal.Visible = true;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            // Update basic profile info
            string updateQuery = "UPDATE User_Master SET user_fullname = @fullName, user_mobile = @phone, user_dob = @dob, user_gender = @gender WHERE user_id = @userId";

            using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
            {
                cmd.Parameters.AddWithValue("@fullName", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@dob", string.IsNullOrEmpty(txtDOB.Text) ? (object)DBNull.Value : DateTime.Parse(txtDOB.Text));
                cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@userId", Session["userName"].ToString());


                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    ShowMessage("Profile updated successfully!", "success");
                    lblUserName.Text = txtFullName.Text;
                }
                else
                {
                    ShowMessage("No changes were made.", "info");
                }
            }

            // Handle profile picture upload
            if (fuProfilePic.HasFile)
            {
                UploadProfilePicture();
            }

            // Return to view mode
            btnCancel_Click(null, null);
        }
        catch (Exception ex)
        {
            ShowMessage("Error updating profile: " + ex.Message, "danger");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }



    private void UploadProfilePicture()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string fileName = Path.GetFileName(fuProfilePic.FileName);
            string extension = Path.GetExtension(fileName).ToLower();

            // Validate file type
            if (extension != ".jpg" && extension != ".jpeg" && extension != ".png")
            {
                ShowMessage("Only JPG, JPEG or PNG files are allowed", "danger");
                return;
            }

            // Validate file size (2MB max)
            if (fuProfilePic.PostedFile.ContentLength > 2097152)
            {
                ShowMessage("File size must be less than 2MB", "danger");
                return;
            }

            // Create unique filename
            string newFileName = "profile_" + Session["userName"].ToString() + extension;
            string savePath = Server.MapPath("../../assets/profile_images/") + newFileName;

            // Save file
            fuProfilePic.SaveAs(savePath);

            // Update database with image path
            string updateQuery = "UPDATE User_Master SET profile_image = @imagePath WHERE user_id = @userId";

            using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
            {
                cmd.Parameters.AddWithValue("@imagePath", "../../assets/profile_images/" + newFileName);
                cmd.Parameters.AddWithValue("@userId", Session["userName"].ToString());
                cmd.ExecuteNonQuery();
            }

            // Update image display
            imgProfile.Src = "../../assets/profile_images/" + newFileName;
            ShowMessage("Profile picture updated successfully!", "success");
        }
        catch (Exception ex)
        {
            ShowMessage("Error uploading profile picture: " + ex.Message, "danger");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }

    private void ShowMessage(string message, string type)
    {
        pnlMessage.Visible = true;
        lblMessage.Text = message;
        pnlMessage.CssClass = $"alert alert-{type} alert-dismissible fade show";
    }
}