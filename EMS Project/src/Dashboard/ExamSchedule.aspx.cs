using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_Dashboard_ExamSchedule : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnShedule_OnClick(object sender, EventArgs e)
    {
        SqlDataAdapter sda=new SqlDataAdapter("StudentRoomMapping",connectionString);
        sda.SelectCommand.CommandType=CommandType.StoredProcedure;

        MappingInvigilator();

        getStudentMappingData();
        getInvigilatorMappingDetails();
        ExamDetails();
    }

    protected void getStudentMappingData()
    {
        SqlDataAdapter sda = new SqlDataAdapter("filterRoomStudentInformation", connectionString);
        sda.SelectCommand.CommandType= CommandType.StoredProcedure;

        DataTable dt = new DataTable();
        sda.Fill(dt);

        gridStudent.DataSource = dt;
        gridStudent.DataBind();

        gridStudentAll.DataSource = dt;
        gridStudentAll.DataBind();
    }

    protected void MappingInvigilator()
    {
        SqlDataAdapter sda = new SqlDataAdapter("[InvigilatorRoomDateSem_Mapping]", connectionString);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
    }

    protected void getInvigilatorMappingDetails()
    {
        SqlDataAdapter sda = new SqlDataAdapter("ShoewInvigilatorMappingDetails", connectionString);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;

        DataTable dt = new DataTable();
        sda.Fill(dt);

        gridInvigilator.DataSource = dt;
        gridInvigilatorAll.DataSource = dt;
        gridInvigilator.DataBind();
        gridInvigilatorAll.DataBind();
    }

    protected void ExamDetails()
    {
        const string query = @"SELECT Dept, Sem, PaperCode, PaperName, ExamDate, 
                          startTime, endTime FROM Tbl_examPaperDetails";
        SqlDataAdapter sda=new SqlDataAdapter(query, connectionString);
        sda.SelectCommand.CommandType = CommandType.Text;
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gridExamDetails.DataSource = dt;
        gridExamDetailsAll.DataSource = dt;
        gridExamDetails.DataBind();
        gridExamDetailsAll.DataBind();
    }

    
}