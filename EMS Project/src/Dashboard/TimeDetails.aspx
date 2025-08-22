<%@ Page Title="" Language="C#" MasterPageFile="~/src/Dashboard/Dashboard.master" AutoEventWireup="true" CodeFile="TimeDetails.aspx.cs" Inherits="src_Dashboard_TimeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Sudent Management - EMS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../assets/css/TimeDetails.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- DataTables JS -->
    <script type="text/javascript" src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h1 class="page-title mt-3">Exam Time Details</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:TextBox runat="server" ID="txtUserfk" Visible="false"></asp:TextBox>
    <div class="upload-section">
        <div class="section-header">
            <h3 class="section-title">Add Time Details</h3>
            <div class="section-tabs">
                <div class="tab" data-tab="bulk" id="bulk_upload">Bulk Upload</div>
                <div class="tab active" data-tab="manual" id="manual_entry">Manual Entry</div>
            </div>
        </div>

        <!-- Bulk Upload Content -->
        <div class="" id="bulkUpload">
            <div class="file-upload-area" id="dropZone">
                <i class="fas fa-cloud-upload-alt upload-icon"></i>
                <h3>Upload Time Details File</h3>
                <p class="upload-instructions">
                    Drag & drop your CSV or Excel file here or click to browse files
                </p>
                <label for="fileUpload" class="upload-btn" id="selectStudentFile" data-target-file-input-id="<%= timedetailsFile.ClientID %>">
                    <i class="fas fa-file-import pe-2"></i>Select File
                </label>
                <asp:FileUpload ID="timedetailsFile" runat="server" CssClass="form-control" Style="display: none;" />
                <div class="file-name" id="selectedFileName">No file selected</div>
            </div>

            <div class="format-requirements">
                <h4 class="requirements-title">File Format Requirements:</h4>
                <ul class="requirements-list">
                    <li>File must be in CSV, XLSX, or XLS format</li>
                    <li>Required columns: Paper Name, Start Time,End Time</li>
                    <li>Maximum file size: 10MB</li>
                </ul>
                <a href="#" class="download-template">
                    <i class="fas fa-download pe-1"></i>Download Template File
                </a>
            </div>
            <div class="">
                <button class="btn btn-outline">
                    Cancel
                </button>

                <div class="btn btn-primary">
                    <i class="fas fa-upload pe-2"></i>

                    <asp:Button Text="Process Upload" ID="btnprocessUpload" runat="server" CssClass="btn bg-transparent p-0" />
                </div>
            </div>

        </div>
        <!-- Manual Entry Content -->
        <div class="" id="manualUpload">

            <div class="student-form">
                <div class="form-group">
                    <label for="Papername" class="form-label required-field">Paper Name</label>
                
                    <asp:DropDownList class="form-control" ID="ddlpapername" runat="server">
                         <asp:ListItem Text="Select an option" Value="0" />
                         <asp:ListItem Text="Option 1" Value="1" />
                         <asp:ListItem Text="Option 2" Value="2" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="starttime" class="form-label required-field">Start Time</label>
                    <input type="time" id="starttime" class="form-control">
                </div>

                <div class="form-group">
                    <label for="endtime" class="form-label required-field">End Time</label>
                    <input type="time" id="endtime" class="form-control">

                    <div class="form-actions">
                        <asp:Button ID="Button1" Text="Clear Form" class="btn btn-outline" runat="server" />


                        <div class="btn btn-primary">

                            <%--<asp:button text="Save Time Details" id="btnSaveStu" cssClass="btn bg-transparent" runat="server" />--%>
                            <asp:LinkButton runat="server" ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click">
                                <i class="fas fa-save pe-2"></i> Save
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
        <!-- Students Table -->
        <div class="upload-section">
            <div class="section-header">
                <h3 class="section-title">Exam Time Details</h3>
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Filter Time...">
                </div>
            </div>
            <div class="overflow-x-auto">
                <div class="d-block" id="studentTableDiv" runat="server">
                </div>
                <div id="studentTablePagination" class="mt-3 text-center">
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            <!-- DataTables JS -->
            <script type="text/javascript" src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
            <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
            <script src="../../assets/js/Page_JS/Students.js"></script>
        </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
</asp:Content>

