using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Web.Script.Services;
using System.Web.Services;

public partial class src_Student_Exam : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    DataTable dtQuestions = new DataTable();
    static string QuestionPaperId = string.Empty;
    //protected Panel QuestionsPanel;
    //protected DropDownList ddlQuestionPapers;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlDataAdapter sda = new SqlDataAdapter("FetchQuestionPaper", connectionString);
            sda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                ddlQuestionPapers.DataSource = dt;
                ddlQuestionPapers.DataTextField = "QuestionPaperName"; // Display text
                ddlQuestionPapers.DataValueField = "QuestionPaperId"; // Value
                ddlQuestionPapers.DataBind();
                ddlQuestionPapers.Items.Insert(0, new ListItem("-- Select Question Paper --", "0"));

                // Add default item if needed
            }
        }

    }

    public void ddlQuestionPapers_SelectedIndexChanged(object sender, EventArgs e)
    {
        //String index = ddlQuestionPapers.SelectedItem.Value;
        ddlQuestionPapers.SelectedIndex = ddlQuestionPapers.Items.IndexOf(
        ddlQuestionPapers.Items.FindByValue(ddlQuestionPapers.SelectedItem.Value));

        ddlQuestionPapers.Enabled = false;

        SqlDataAdapter sda = new SqlDataAdapter("FetchQuestion", connectionString);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.AddWithValue("@Q_PaperId", ddlQuestionPapers.SelectedItem.Value);
        sda.Fill(dtQuestions);
        QuestionPaperId = ddlQuestionPapers.SelectedItem.Value;

        
        if (dtQuestions.Rows.Count > 0)
        {
            //Build HTML table
            StringBuilder htmlTable = new StringBuilder();
            htmlTable.Append("<table class='table table-striped table-bordered' id='QuestionTable' runat='Server'>");
            // Table header
            htmlTable.Append("<thead><tr>");
            htmlTable.Append("<th>Question No</th>");
            htmlTable.Append("<th>Question</th>");
            htmlTable.Append("<th>Option</th>");
            htmlTable.Append("</tr></thead>");

            // Table body
            htmlTable.Append("<tbody>");
            int questionNo = 1; // Initialize question number

            foreach (DataRow row in dtQuestions.Rows)
            {
                string questionId = HttpUtility.HtmlEncode(row["QuestionId"].ToString());
                htmlTable.Append("<tr data-questionid='" + questionId + "'>");
                htmlTable.AppendFormat("<td>{0}</td>", questionNo);
                htmlTable.AppendFormat("<td>{0}</td>", HttpUtility.HtmlEncode(row["Question"].ToString()));
                htmlTable.Append("<td>");

                string radioGroupName = "rdlist" + questionId;

                // Add data-questionid attribute to each radio button
                htmlTable.AppendFormat("<div class='form-check'><input class='form-check-input' type='radio' name='{0}' value='{1}' data-questionid='{2}'><label class='form-check-label'>{1}</label></div>",
                    radioGroupName, HttpUtility.HtmlEncode(row["Option1"].ToString()), questionId);

                htmlTable.AppendFormat("<div class='form-check'><input class='form-check-input' type='radio' name='{0}' value='{1}' data-questionid='{2}'><label class='form-check-label'>{1}</label></div>",
                    radioGroupName, HttpUtility.HtmlEncode(row["Option2"].ToString()), questionId);

                htmlTable.AppendFormat("<div class='form-check'><input class='form-check-input' type='radio' name='{0}' value='{1}' data-questionid='{2}'><label class='form-check-label'>{1}</label></div>",
                    radioGroupName, HttpUtility.HtmlEncode(row["Option3"].ToString()), questionId);

                htmlTable.AppendFormat("<div class='form-check'><input class='form-check-input' type='radio' name='{0}' value='{1}' data-questionid='{2}'><label class='form-check-label'>{1}</label></div>",
                    radioGroupName, HttpUtility.HtmlEncode(row["Option4"].ToString()), questionId);

                htmlTable.Append("</td>");
                htmlTable.Append("</tr>");
                questionNo++;
            }
            htmlTable.Append("</tbody></table>");
            DivQuestionTable.InnerHtml = htmlTable.ToString();
        }

    }

    public class AnswerModel
    {
        public string QuestionId { get; set; }
        public string SelectedAnswer { get; set; }
        public string UserId { get; set; }
        public string QuestionPaperId { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static object SaveAnswerData(string answerData)
    {
        try
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlDataAdapter sda = new SqlDataAdapter("SaveAnswer", ConnectionString);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@AnswerData", answerData);
            sda.SelectCommand.Parameters.AddWithValue("@UserId", HttpContext.Current.Session["UserId"].ToString());
            sda.SelectCommand.Parameters.AddWithValue("@QuestionPaperId", QuestionPaperId);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                // Handle the case where answers are saved successfully
                return new { success = true, message = "Answers saved successfully" };
            }
            else
            {
                // Handle the case where no rows were affected
                return new { success = false, message = "No answers were saved." };
            }

            //return new { success = true, message = "Answers saved successfully" };
        }
        catch (Exception ex)
        {
            return new { success = false, message = ex.Message };
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

    }


}