<%@ Page Title="" Language="C#" MasterPageFile="~/src/Dashboard/Dashboard.master" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="src_Dashboard_Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Sudent Management - EMS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../assets/css/Students.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- DataTables JS -->
    <script type="text/javascript" src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h1 class="page-title mt-3">Sudent Details</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <%--<form id="form1" runat="server">--%>
    <asp:TextBox runat="server" ID="txtUserfk" Visible="false"></asp:TextBox>
    <%--<form id="studentFormID" runat="server">--%>
    <div class="upload-section">
        <div class="section-header">
            <h3 class="section-title">Add Students</h3>
            <div class="section-tabs">
                <div class="tab" data-tab="bulk" id="bulk_upload">Bulk Upload</div>
                <div class="tab active" data-tab="manual" id="manual_entry">Manual Entry</div>
            </div>
        </div>
        <%--<a href="../../assets/Files/">../../assets/Files/</a>--%>

        <!-- Bulk Upload Content -->
        <div class="" id="bulkUpload">
            <div class="file-upload-area" id="dropZone">
                <i class="fas fa-cloud-upload-alt upload-icon"></i>
                <h3>Upload Student Data File</h3>
                <p class="upload-instructions">
                    Drag & drop your CSV or Excel file here or click to browse files
                </p>
                <%--<asp:FileUpload ID="FileUpload1" runat="server" CssClass="file-input" Accept=".csv, .xlsx, .xls" />--%>
                <%--<input type="file" id="fileUpload1" class="file-input" accept=".csv, .xlsx, .xls">--%>
                <label for="fileUpload" class="upload-btn" id="selectStudentFile" data-target-file-input-id="<%= studentFile.ClientID %>">
                    <i class="fas fa-file-import pe-2"></i>Select File
                </label>
                <asp:FileUpload ID="studentFile" runat="server" CssClass="form-control" Style="display: none;" />
                <div class="file-name" id="selectedFileName">No file selected</div>
            </div>

            <div class="format-requirements">
                <h4 class="requirements-title">File Format Requirements:</h4>
                <ul class="requirements-list">
                    <li>File must be in CSV, XLSX, or XLS format</li>
                    <li>Required columns: Student ID, First Name, Last Name, Email, Department</li>
                    <li>Maximum file size: 10MB</li>
                </ul>
                <a href="../../assets/Files/BlankFiles/student.xlsx" class="download-template">
                    <i class="fas fa-download pe-1"></i>Download Template File
                </a>
            </div>
            <%--<asp:Button CssClass="btn btn-primary" runat="server" ID="btnUploaddata" Text="Upload Data" OnClick="btnprocessUpload_OnClick" />--%>
            <div class="">
                <button class="btn btn-outline">
                    Cancel
                </button>
                <asp:LinkButton ID="btnprocessUpload" Text="Process Upload" CssClass="btn btn-primary" runat="server" OnClick="btnprocessUpload_OnClick">
                        <i class="fas fa-upload pe-2"></i>
                            Save Student
                </asp:LinkButton>
            </div>

        </div>

        <!-- Manual Entry Content -->
        <div class="" id="manualUpload">

            <div class="student-form">
                <div class="form-group">
                    <label class="form-label required-field">Student ID</label>
                    <asp:TextBox ID="txtstudentId" class="form-control" runat="server" />
                </div>

                <div class="form-group">
                    <label for="firstName" class="form-label required-field">Full Name</label>
                    <asp:TextBox ID="txtFullName" class="form-control" runat="server" />
                </div>


                <div class="form-group">
                    <label for="roll" class="form-label">Roll No</label>
                    <asp:TextBox ID="txtRoll" class="form-control" runat="server" />

                </div>

                <div class="form-group">
                    <label for="department" class="form-label required-field">Department</label>
                    <asp:DropDownList ID="drpDepartment" runat="server" class="form-control">
                        <asp:ListItem Enabled="True" Text="--Select Department--" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Computer Science" Value="cs"></asp:ListItem>
                        <asp:ListItem Text="Mathematics" Value="math"></asp:ListItem>
                        <asp:ListItem Text="Physics" Value="physics"></asp:ListItem>
                        <asp:ListItem Text="Engineering" Value="engineering"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="email" class="form-label required-field">Semester</label>
                    <asp:DropDownList ID="drpSemester" runat="server" class="form-control">
                        <asp:ListItem Enabled="True" Text="--Select Status--" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="1st" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2nd" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3rd" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4th" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5th" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6th" Value="6"></asp:ListItem>
                    </asp:DropDownList>

                </div>



                <div class="form-group">
                    <label for="dob" class="form-label">Session</label>
                    <asp:DropDownList ID="drpSession" runat="server" class="form-control">
                        <asp:ListItem Enabled="True" Text="--Select Status--" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="2025-26"></asp:ListItem>
                        <asp:ListItem Text="2024-25"></asp:ListItem>
                        <asp:ListItem Text="2023-24"></asp:ListItem>
                        <asp:ListItem Text="2022-23"></asp:ListItem>
                        <asp:ListItem Text="2021-22"></asp:ListItem>
                        <asp:ListItem Text="2020-21"></asp:ListItem>
                    </asp:DropDownList>

                </div>

                <div class="form-group">
                    <label for="status" class="form-label">Status</label>


                    <asp:DropDownList ID="drpStatus" runat="server" class="form-control">
                        <asp:ListItem Enabled="True" Text="--Select Status--" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                    </asp:DropDownList>


                </div>
            </div>

            <div class="form-actions">
                <asp:Button ID="btnReset" Text="Clear Form" class="btn btn-outline" runat="server" OnClick="btnReset_OnClick" />


                <div class=" ">
                    <%--<asp:button text="Save Student" id="btnSaveStu" cssClass="btn bg-transparent" runat="server" />--%>
                    <asp:LinkButton ID="btnAddStu" Text="Save Student" CssClass="btn btn-primary shadow-lg" runat="server" OnClick="btnAddStu_OnClick">
                    <i class="fas fa-save pe-2"></i>
                        Add Student
                    </asp:LinkButton>
                </div>

            </div>

        </div>

    </div>
    <!-- Students Table -->
    <div class="upload-section" id="UploadTable">
        <div class="section-header">
            <h3 class="section-title">Student Records</h3>


        </div>
        <div class="overflow-x-auto">
            <div class="d-block" id="studentTableDiv" runat="server" visible="false">
                <%--<a href="Students.aspx">Students.aspx</a>--%>
            </div>
            <div id="studentTablePagination" class="mt-3 text-center">
            </div>
        </div>
        <div id="tbl123" runat="server">
        </div>

        <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="col-md-12 rounded shadow-lg px-2">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="student_id" HeaderText="Student Id" ControlStyle-CssClass="pe-2">
                    <ControlStyle CssClass="px-2 "></ControlStyle>
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="Name" ControlStyle-CssClass="pe-2">
                    <ControlStyle CssClass="pe-2"></ControlStyle>
                </asp:BoundField>
                <asp:BoundField DataField="roll_number" HeaderText="Roll No" ControlStyle-CssClass="pe-2">
                    <ControlStyle CssClass="pe-2"></ControlStyle>
                </asp:BoundField>
                <asp:BoundField DataField="department" HeaderText="Semester" ControlStyle-CssClass="pe-2">
                    <ControlStyle CssClass="pe-2"></ControlStyle>
                </asp:BoundField>
                <asp:BoundField DataField="semester" HeaderText="Session" ControlStyle-CssClass="pe-2">
                    <ControlStyle CssClass="pe-2"></ControlStyle>
                </asp:BoundField>
                <asp:BoundField DataField="session" HeaderText="Department" ControlStyle-CssClass="pe-2">
                    <ControlStyle CssClass="pe-2"></ControlStyle>
                </asp:BoundField>
                <asp:BoundField DataField="active" HeaderText="Status" ControlStyle-CssClass="pe-2">
                    <ControlStyle CssClass="pe-2"></ControlStyle>
                </asp:BoundField>

            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>



        <asp:LinkButton ID="LinkButton1" Text="Save Student" CssClass="btn btn-primary mt-3" runat="server" OnClick="btnSaveStu_OnClick">
                <i class="fas fa-save pe-2"></i>
                Save Student
        </asp:LinkButton>

        <asp:LinkButton ID="btnClear" Text="Save Student" CssClass="btn btn-outline px-5 mt-3" runat="server" OnClick="btnClear_OnClick">
               Clear
        </asp:LinkButton>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- DataTables JS -->
        <script type="text/javascript" src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="../../assets/js/Page_JS/Students.js"></script>
    </div>
    <%--</form>--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
</asp:Content>
