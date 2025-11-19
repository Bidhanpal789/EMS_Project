using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class src_Student_Dashboard : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        string qry = "SELECT * FROM User_Master WHERE user_id = @UserId";
        SqlDataAdapter sa=new SqlDataAdapter(qry, conn);
        sa.SelectCommand.Parameters.AddWithValue("@UserId", Session["userName"].ToString());
        DataTable dt = new DataTable();
        sa.Fill(dt);
        if(dt.Rows.Count > 0)
        {
            lblStudentName.Text = dt.Rows[0]["user_fullname"].ToString();
        }
        

    }

    protected void ExamDetails() {

        SqlDataAdapter sda = new SqlDataAdapter("ShowExamDetails", conn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataTable dt = new DataTable();
        sda.Fill(dt);
        //gridExam.DataSource = dt;
        //gridExam.DataBind();
    }
}