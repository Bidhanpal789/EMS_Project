using System;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class src_Dashboard_Invigilators : System.Web.UI.Page
{
    private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    // Global DataTable declaration
    private DataTable InvigilatorTable
    {
        get
        {
            if (ViewState["InvigilatorTable"] == null)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("Email", typeof(string));
                dt.Columns.Add("Phone", typeof(string));
                dt.Columns.Add("Department", typeof(string));
                dt.Columns.Add("Subject", typeof(string));
                dt.Columns.Add("Status", typeof(int));
                ViewState["InvigilatorTable"] = dt;
            }
            return (DataTable)ViewState["InvigilatorTable"];
        }
        set { ViewState["InvigilatorTable"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initialize viewstate table on first load
            var initTable = InvigilatorTable;
        }
    }

    protected void btnprocessUpload_OnClick(object sender, EventArgs e)
    {
        if (!InvigilatorFile.HasFile)
        {
            ShowAlert("Please select a file.");
            return;
        }

        try
        {
            string path = Path.GetFileName(InvigilatorFile.FileName).Replace(" ", "");
            string excelPath = Server.MapPath("~/assets/Files/") + path;

            // Save the uploaded file
            InvigilatorFile.SaveAs(excelPath);

            // Read Excel data into DataTable
            DataTable excelData = ReadExcelData(excelPath);

            if (excelData != null && excelData.Rows.Count > 0)
            {
                // Prepare data for database
                DataTable dbReadyData = PrepareForDatabase(excelData);

                // Bulk insert to SQL
                BulkInsertToDatabase(dbReadyData);

                // Store in global DataTable
                InvigilatorTable = excelData;

                ShowAlert("Data saved successfully!");
            }
            else
            {
                ShowAlert("No valid data found in the Excel file.");
            }
        }
        catch (Exception ex)
        {
            ShowAlert($"Error processing file: {ex.Message}");
        }
    }

    private DataTable ReadExcelData(string filePath)
    {
        DataTable dt = new DataTable();

        using (OleDbConnection conn = new OleDbConnection(
            "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath +
            ";Extended Properties='Excel 12.0 Xml;HDR=YES';"))
        {
            conn.Open();
            using (OleDbCommand cmd = new OleDbCommand("SELECT * FROM [Sheet1$]", conn))
            {
                using (OleDbDataAdapter da = new OleDbDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
        }

        // Basic validation
        if (dt.Columns.Count < 6)
        {
            throw new Exception("Excel file must contain at least 6 columns");
        }

        return dt;
    }

    private DataTable PrepareForDatabase(DataTable sourceTable)
    {
        DataTable bulkTable = new DataTable();

        // Create columns matching database table
        bulkTable.Columns.Add("Name", typeof(string));
        bulkTable.Columns.Add("Email", typeof(string));
        bulkTable.Columns.Add("Phone", typeof(string));
        bulkTable.Columns.Add("Department", typeof(string));
        bulkTable.Columns.Add("Subject", typeof(string));
        bulkTable.Columns.Add("Status", typeof(int));
        

        // Get current user ID (replace with your actual session variable)
        int currentUserId = 1;

        foreach (DataRow row in sourceTable.Rows)
        {
            DataRow newRow = bulkTable.NewRow();

            // Map Excel columns
            newRow["Name"] = row[0];
            newRow["Email"] = row[1];
            newRow["Phone"] = row[2];
            newRow["Department"] = row[3];
            newRow["Subject"] = row[4];
            newRow["Status"] = row[5];

           

            bulkTable.Rows.Add(newRow);
        }

        return bulkTable;
    }

    private void BulkInsertToDatabase(DataTable data)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            using (SqlBulkCopy bulkCopy = new SqlBulkCopy(conn))
            {
                bulkCopy.DestinationTableName = "InvigilatorTBl";
                //bulkCopy.BatchSize = 1000;
                //bulkCopy.BulkCopyTimeout = 60;

                // Column mappings
                bulkCopy.ColumnMappings.Add("name", "Name");
                bulkCopy.ColumnMappings.Add("email", "Email");
                bulkCopy.ColumnMappings.Add("phone", "Phone");
                bulkCopy.ColumnMappings.Add("dept", "Department");
                bulkCopy.ColumnMappings.Add("paper", "Subject");
                //bulkCopy.ColumnMappings.Add("status",Convert.ToInt32( "Status"));
               

                bulkCopy.WriteToServer(data);
            }
        }
    }

    private void ShowAlert(string message)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "showalert",
            $"alert('{message.Replace("'", "\\'")}');", true);
    }
}