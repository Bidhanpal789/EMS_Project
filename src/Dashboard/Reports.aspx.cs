using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_Dashboard_Reports : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnserch_OnClick(object sender, EventArgs e)
    {
        SqlDataAdapter sda = new SqlDataAdapter("studentExamPaperAndRomdetails", conn);
        sda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.AddWithValue("@userfk", txtstudentID.Text);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        studentExamDetails.DataSource = dt;
        studentExamDetails.DataBind();
    }
}