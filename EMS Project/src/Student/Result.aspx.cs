using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_Student_Result : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindQuizResults();
        }
    }

    private void BindQuizResults()
    {
        conn.Open();
        //string qry = "select ";
        SqlDataAdapter sda = new SqlDataAdapter("CalculateResult", conn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());

        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvQuizResults.DataSource = dt;
        gvQuizResults.DataBind();

    }

    protected void gvQuizResults_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            QuizResult result = (QuizResult)e.Row.DataItem;

            // Show correct answer only for incorrect responses
            if (!result.IsCorrect)
            {
                e.Row.Cells[2].Visible = true; // Correct Answer column
            }
        }
    }

    // Helper methods for CSS classes
    protected string GetAnswerClass(bool isCorrect)
    {
        return isCorrect ? "correct-answer" : "wrong-answer";
    }

    protected string GetResultClass(bool isCorrect)
    {
        return isCorrect ? "text-success" : "text-danger";
    }

    protected string GetResultIcon(bool isCorrect)
    {
        return isCorrect ? "fas fa-check-circle" : "fas fa-times-circle";
    }

    // QuizResult class
    public class QuizResult
    {
        public int QuestionNumber { get; set; }
        public string QuestionText { get; set; }
        public string UserAnswer { get; set; }
        public string CorrectAnswer { get; set; }
        public bool IsCorrect { get; set; }
    }
}