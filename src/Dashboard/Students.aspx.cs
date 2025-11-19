using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls; // Correct namespace for HtmlTableRow  
using static System.Web.UI.HtmlControls.HtmlTableRow; // Use 'using static' for the type
using Newtonsoft.Json;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static System.Net.Mime.MediaTypeNames;
public partial class src_Dashboard_Students : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    static string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    StringBuilder htmlTable = new StringBuilder();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvStudents.DataSource = StudentTable;
            gvStudents.DataBind();
        }
    }


    //Manual Upload
    protected void btnAddStu_OnClick(object sender, EventArgs e)
    {
        string student_id = txtstudentId.Text.Trim();
        string name = txtFullName.Text.Trim();
        string roll_number = txtRoll.Text.Trim();
        string semester = drpSemester.SelectedItem.Text.Trim();
        string Session = drpSession.SelectedItem.Text.Trim();
        string department = drpDepartment.SelectedItem.Text.Trim();
        int active = int.Parse(drpStatus.SelectedValue); // or TryParse for safety

        SqlDataAdapter sda = new SqlDataAdapter("Select * from Student_Details where student_id='" + student_id + "'", connectionString);
        DataTable dtCheck = new DataTable();
        sda.Fill(dtCheck);
        if (dtCheck.Rows.Count > 0)
        {
            Response.Write("<script>alert('Student ID already exists in Database!!!');</script>");
        }
        else
        {
            if (!string.IsNullOrEmpty(student_id) && !string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(roll_number) && !string.IsNullOrEmpty(semester) && !string.IsNullOrEmpty(Session) && !string.IsNullOrEmpty(department) && active >= 0)
            {
                DataTable dt = StudentTable;
                dt.Rows.Add(student_id, name, roll_number, semester,department, Session, active);
                StudentTable = dt;

                gvStudents.DataSource = dt;
                gvStudents.DataBind();

                txtFullName.Text = "";
                txtRoll.Text = "";
                txtstudentId.Text = "";
            }
        }
    }
    protected void btnSaveStu_OnClick(object sender, EventArgs e)
    {
        DataTable sourceTable = StudentTable;

        if (sourceTable != null && sourceTable.Rows.Count > 0)
        {
            // Clone the structure and add required extra columns
            DataTable bulkTable = sourceTable.Clone();
            bulkTable.Columns.Add("Created_On", typeof(DateTime));
            bulkTable.Columns.Add("Created_By", typeof(int));
            bulkTable.Columns.Add("Updated_On", typeof(DateTime));
            bulkTable.Columns.Add("Update_By", typeof(int));
            //bulkTable.Columns.Add("active", typeof(bool))
            bulkTable.Columns.Add("deleted", typeof(bool));


            // Example: Static values for demo (replace with actual session/user values)
            int createdBy = 1; // Assume logged-in user ID

            foreach (DataRow row in sourceTable.Rows)
            {
                DataRow newRow = bulkTable.NewRow();
                newRow["student_id"] = row["student_id"];
                newRow["name"] = row["name"];
                newRow["roll_number"] = row["roll_number"];
                newRow["department"] = row["department"];
                newRow["semester"] = row["semester"];
                newRow["session"] = row["session"];
                newRow["Created_On"] = DateTime.Now;
                newRow["Created_By"] = createdBy;
                newRow["Updated_On"] = DBNull.Value;
                newRow["Update_By"] = DBNull.Value;
                newRow["active"] = true;
                newRow["deleted"] = false;

                bulkTable.Rows.Add(newRow);
            }

            // Insert to DB
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlBulkCopy bulkCopy = new SqlBulkCopy(conn))
                    {
                        bulkCopy.DestinationTableName = "Student_Details";

                        // Map columns
                        bulkCopy.ColumnMappings.Add("student_id", "student_id");
                        bulkCopy.ColumnMappings.Add("name", "name");
                        bulkCopy.ColumnMappings.Add("roll_number", "roll_number");
                        bulkCopy.ColumnMappings.Add("semester", "semester");
                        bulkCopy.ColumnMappings.Add("department", "department");
                        bulkCopy.ColumnMappings.Add("session", "session");
                        bulkCopy.ColumnMappings.Add("Created_On", "Created_On");
                        bulkCopy.ColumnMappings.Add("Created_By", "created_By");
                        bulkCopy.ColumnMappings.Add("Updated_On", "Updated_On");
                        bulkCopy.ColumnMappings.Add("Update_By", "Update_By");
                        bulkCopy.ColumnMappings.Add("active", "active");
                        bulkCopy.ColumnMappings.Add("deleted", "deleted");

                        bulkCopy.WriteToServer(bulkTable);


                        // Clear and confirm
                        StudentTable.Clear();
                        gvStudents.DataSource = StudentTable;
                        gvStudents.DataBind();
                        Response.Write("<script>alert('Data Saved Successfully!');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('No data to save!');</script>");
        }
    }





        private DataTable StudentTable
        {
            get
            {
                if (ViewState["StudentTable"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("student_id", typeof(string));
                    dt.Columns.Add("name", typeof(string));
                    dt.Columns.Add("roll_number", typeof(string));
                    dt.Columns.Add("department", typeof(string));
                    dt.Columns.Add("semester", typeof(string));
                    dt.Columns.Add("session", typeof(string));
                    dt.Columns.Add("active", typeof(int));
                    ViewState["StudentTable"] = dt;
                }
                return (DataTable)ViewState["StudentTable"];
            }
            set { ViewState["StudentTable"] = value; }
        }

    protected void btnReset_OnClick(object sender, EventArgs e)
    {
        txtFullName.Text = "";
        txtRoll.Text = "";
        txtstudentId.Text = "";
        drpSemester.SelectedIndex = -1; // Reset to first item
        drpSession.SelectedIndex = -1; // Reset to first item
        drpDepartment.SelectedIndex = -1; // Reset to first item
        drpStatus.SelectedIndex = -1; // Reset to first item


    }


    protected void btnClear_OnClick(object sender, EventArgs e)
    {
        // Clear the ViewState to reset the table
        ViewState["StudentTable"] = null;
        gvStudents.DataSource = null;
        gvStudents.DataBind();
        Response.Write("<script>alert('Table Cleared Successfully!');</script>");
    }




    //Bulk Upload
    public void btnprocessUpload_OnClick(object sender, EventArgs e)
    {

        if (!studentFile.HasFile)
        {
            //lblError.Text = "Please select a file.";
            Response.Write("<script>alert('Please select a file.');</script>");
            return;
        }

        string path = Path.GetFileName(studentFile.FileName);
        path = path.Replace(" ", "");
        string ExcelPath = Server.MapPath("../../assets/Files/") + path;

        try
        {
            studentFile.SaveAs(ExcelPath);
            var studentList = new List<Dictionary<string, string>>();

            using (OleDbConnection conn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + ExcelPath + ";Extended Properties='Excel 12.0 Xml;HDR=YES';Persist Security Info=False;"))
            {
                conn.Open();
                using (OleDbCommand cmd = new OleDbCommand("SELECT * FROM [Sheet1$]", conn))
                {
                    using (OleDbDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            var student = new Dictionary<string, string>
                    {
                        { "StudentID", dr[0].ToString() },
                        { "StudentName", dr[1].ToString() },
                        { "RollNo", dr[2].ToString() },
                        { "Semester", dr[3].ToString() },
                        { "Department", dr[4].ToString() },
                        { "CurrentSession", dr[5].ToString() }
                    };
                            studentList.Add(student);
                        }
                    }
                }
            }

            // Using Newtonsoft.Json to serialize to JSON
            string jsonString = JsonConvert.SerializeObject(studentList, Formatting.Indented);
            //Response.Write($"<script>console.log('{jsonString}');</script>");
            string StudentDitels = $"<script>console.log({HttpUtility.JavaScriptStringEncode(jsonString, true)});</script>";
            Response.Write(StudentDitels);
            savedata(jsonString);
        }
        catch (Exception ex)
        {
            //lblError.Text = "Error: " + ex.Message;
            //Response.Write("<script>alert(ex.Message);</script>");
            Response.Write("Error: " + ex.Message);

        }
    }

    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    [WebMethod]
    private void savedata(string StudentDitels)
    {
        string jsonstring = string.Empty;

        try
        {
            SqlDataAdapter sda = new SqlDataAdapter("InsertStudentBulk", connectionString);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@id", 1);
            sda.SelectCommand.Parameters.AddWithValue("@userfk", Session["userId"].ToString());
            sda.SelectCommand.Parameters.AddWithValue("@jasonStudentDEtails", StudentDitels);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string msg = dt.Rows[0]["msg"].ToString();
                //msg = $"<script>alert({msg})</script>";
                Response.Write($"<script>alert({msg})</script>");
            }
            else
            {
                Response.Write($"<script>alert('Error in data Save')</script>");
            }

        }
        catch (Exception ex)
        {
            jsonstring = ""; // Return an empty string on error (you can log the error if needed)
        }

    }

    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //[WebMethod]
    public void FilterStudents(string mode, string sem, string dept, string userfk)
    {
        string jsonstring = string.Empty;
        DataTable dt = new DataTable();

        try
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                SqlDataAdapter sda = new SqlDataAdapter("FilterStudentDetails", conn);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.AddWithValue("@userfk", userfk);
                sda.SelectCommand.Parameters.AddWithValue("@dept", dept);
                sda.SelectCommand.Parameters.AddWithValue("@sem", sem);
                sda.SelectCommand.Parameters.AddWithValue("@mode", mode);


                sda.Fill(dt);

                if (dt != null && dt.Rows.Count > 0)
                {
                    // Serialize DataTable to JSON
                    jsonstring = JsonConvert.SerializeObject(dt);

                    // Build HTML table
                    StringBuilder htmlTable = new StringBuilder();
                    htmlTable.Append("<table class='table table-striped table-bordered' id='studentRecordsTable'>");

                    // Table header
                    htmlTable.Append("<thead><tr>");
                    htmlTable.Append("<th>Student ID</th>");
                    htmlTable.Append("<th>Name</th>");
                    htmlTable.Append("<th>Roll No</th>");
                    htmlTable.Append("<th>SEM</th>");
                    htmlTable.Append("<th>DEPT</th>");
                    htmlTable.Append("<th>Action</th>");
                    htmlTable.Append("</tr></thead>");

                    // Table body
                    htmlTable.Append("<tbody>");
                    foreach (DataRow row in dt.Rows)
                    {
                        htmlTable.Append("<tr>");
                        htmlTable.AppendFormat("<td>{0}</td>", HttpUtility.HtmlEncode(row["student_id"].ToString()));
                        htmlTable.AppendFormat("<td>{0}</td>", HttpUtility.HtmlEncode(row["name"].ToString()));
                        htmlTable.AppendFormat("<td>{0}</td>", HttpUtility.HtmlEncode(row["roll_number"].ToString()));
                        htmlTable.AppendFormat("<td>{0}</td>", HttpUtility.HtmlEncode(row["semester"].ToString()));
                        htmlTable.AppendFormat("<td>{0}</td>", HttpUtility.HtmlEncode(row["department"].ToString()));

                        // Action buttons
                        htmlTable.Append("<td>");
                        htmlTable.AppendFormat("<button class='btn btn-sm btn-primary edit-btn' data-id='{0}'>Edit</button>",
                                             HttpUtility.HtmlEncode(row["student_id"].ToString()));
                        htmlTable.AppendFormat("<button class='btn btn-sm btn-danger delete-btn ml-2' data-id='{0}'>Delete</button>",
                                             HttpUtility.HtmlEncode(row["student_id"].ToString()));
                        htmlTable.Append("</td>");

                        htmlTable.Append("</tr>");
                    }
                    htmlTable.Append("</tbody></table>");

                    // Assign to div
                    studentTableDiv.InnerHtml = htmlTable.ToString();
                }
                else
                {
                    jsonstring = "[]"; // Empty JSON array if no data
                    studentTableDiv.InnerHtml = "<div class='alert alert-info'>No student records found.</div>";
                }

                //if (dt.Rows.Count > 0)
                //{
                //    jsonstring = JsonConvert.SerializeObject(dt);

                //    StringBuilder htmlTable = new StringBuilder();
                //    htmlTable.Append("<table class='table table-striped table-bordered'>");

                //    htmlTable.Append("<thead><tr><th>Student ID</th><th>Name</th><th>Roll No</th><th>SEM</th><th>DEPT</th><th>Action</th></tr></thead>");

                //    htmlTable.Append("<tbody>");

                //    foreach (DataRow row in dt.Rows)
                //    {
                //        htmlTable.Append("<tr>");

                //        htmlTable.AppendFormat("<td>", row["student_id"].ToString(), "</td>");
                //        htmlTable.AppendFormat("<td>", row["name"].ToString(), "</td>");
                //        htmlTable.AppendFormat("<td>", row["roll_number"].ToString(), "</td>");
                //        htmlTable.AppendFormat("<td>", row["semester"].ToString(), "</td>");
                //        htmlTable.AppendFormat("<td>", row["department"].ToString(), "</td>");
                //        htmlTable.Append("</tr>");
                //    }

                //    htmlTable.Append("</tbody>");

                //    htmlTable.Append("</table>");
                //    studentTableDiv.InnerHtml = htmlTable.ToString();   

                //}
            }


        }
        catch
        {
            jsonstring = "";
        }
        //return jsonstring;
    }






}