using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class src_Dashboard_Dashboard : System.Web.UI.Page
{

    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string qry = "select * from Student_Details";
        SqlDataAdapter sda = new SqlDataAdapter(qry, conn);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if(dt.Rows.Count > 0)
        {
           lblStudentReg.Text=dt.Rows.Count.ToString();
        }

        string qry1 = "select * from InvigilatorTBL where status=1";
        SqlDataAdapter sda1 = new SqlDataAdapter(qry1, conn);
        DataTable dt1 = new DataTable();
        sda1.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            lblInviShow.Text = dt1.Rows.Count.ToString();
        }
        string qry2 = "select * from Tbl_RoomDetails_Sanjay";
        SqlDataAdapter sda2 = new SqlDataAdapter(qry2, conn);
        DataTable dt2 = new DataTable();
        sda2.Fill(dt2);
        if (dt2.Rows.Count > 0)
        {
            lblRoomShow.Text = dt2.Rows.Count.ToString();
        }

        string qry3 = "select * from Tbl_examPaperDetails";
        SqlDataAdapter sda3 = new SqlDataAdapter(qry3, conn);
        DataTable dt3 = new DataTable();
        sda3.Fill(dt3);
        if (dt.Rows.Count > 0)
        {
            lblPaperShow.Text=dt3.Rows.Count.ToString();
        }
    }
}