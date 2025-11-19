using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_Teacher_AddQues : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlExam_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Populate subjects based on selected exam
        ddlSubject.Items.Clear();

        if (ddlExam.SelectedValue == "1") // Mathematics
        {
            ddlSubject.Items.Add(new ListItem("Algebra", "1"));
            ddlSubject.Items.Add(new ListItem("Geometry", "2"));
            ddlSubject.Items.Add(new ListItem("Calculus", "3"));
        }
        else if (ddlExam.SelectedValue == "2") // Physics
        {
            ddlSubject.Items.Add(new ListItem("Mechanics", "4"));
            ddlSubject.Items.Add(new ListItem("Electromagnetism", "5"));
            ddlSubject.Items.Add(new ListItem("Thermodynamics", "6"));
        }
        else if (ddlExam.SelectedValue == "3") // Chemistry
        {
            ddlSubject.Items.Add(new ListItem("Organic Chemistry", "7"));
            ddlSubject.Items.Add(new ListItem("Inorganic Chemistry", "8"));
            ddlSubject.Items.Add(new ListItem("Physical Chemistry", "9"));
        }
        else if (ddlExam.SelectedValue == "4") // Chemistry
        {
            ddlSubject.Items.Add(new ListItem("Programing in C", "7"));
            ddlSubject.Items.Add(new ListItem("DBMS", "8"));
            ddlSubject.Items.Add(new ListItem("Web Design", "9"));
        }

        ddlSubject.Items.Insert(0, new ListItem("-- Select Subject --", ""));
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageQuestions.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        SqlDataAdapter sda = new SqlDataAdapter("AddQuestionAndPaper", conn);
        sda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.AddWithValue("@Userfk", Session["UserId"]);
        sda.SelectCommand.Parameters.AddWithValue("@QuestionPaperName", ddlExam.SelectedItem.Text + " - " + ddlSubject.SelectedItem.Text);
        sda.SelectCommand.Parameters.AddWithValue("@Question", txtQuestionText.Text);
        sda.SelectCommand.Parameters.AddWithValue("@Option1", txtOpt1.Text);
        sda.SelectCommand.Parameters.AddWithValue("@Option2", txtOpt2.Text);
        sda.SelectCommand.Parameters.AddWithValue("@option3", txtOpt3.Text);
        sda.SelectCommand.Parameters.AddWithValue("@option4", txtOpt4.Text);
        sda.SelectCommand.Parameters.AddWithValue("@Ans", txtAnswer.Text);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            if (Convert.ToInt32(dt.Rows[0]["id"].ToString()) > 0)
            {
                Response.Write("<script>alert('Question saved successfully!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Question already exists!');</script>");
            }


            txtQuestionText.Text = "";
            txtOpt1.Text = "";
            txtOpt2.Text = "";
            txtOpt3.Text = "";
            txtOpt4.Text = "";
            txtAnswer.Text = "";

        }
        else
        {
            Response.Write("<script>alert('Error saving question!');</script>");
        }


    }

    public void txtAnswer_OnTextChange(object sender, EventArgs e)
    {
        if (txtOpt1.Text == txtOpt2.Text || txtOpt1.Text == txtOpt3.Text ||
           txtOpt1.Text == txtOpt4.Text ||
           txtOpt2.Text == txtOpt3.Text ||
           txtOpt2.Text == txtOpt4.Text ||
           txtOpt3.Text == txtOpt4.Text)
        {
            Response.Write("<script>alert('Options cannot be the same!');</script>");
            txtAnswer.Text = "";
        }
        else if (txtAnswer.Text == "")
        {
            Response.Write("<script>alert('Please answer the security question!');</script>");
            txtAnswer.Text = "";
        }
        else if (txtAnswer.Text != txtOpt1.Text && txtAnswer.Text != txtOpt2.Text && txtAnswer.Text != txtOpt3.Text && txtAnswer.Text != txtOpt4.Text)
        {
            Response.Write("<script>alert('Please select a valid answer!');</script>");
            txtAnswer.Text = "";
        }

    }
}