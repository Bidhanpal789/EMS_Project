<%@ Page Title="" Language="C#" MasterPageFile="~/src/Dashboard/Dashboard.master" AutoEventWireup="true" CodeFile="Invigilators.aspx.cs" Inherits="src_Dashboard_Invigilators" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Invigilators - EMS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../assets/css/Invigilators.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h1 class="page-title mt-3">Invigilators Management</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="upload-section">
        <div class="section-header">
            <h3 class="section-title">Add Invigilators</h3>
            <div class="section-tabs">
                <div id="bulk_upload" class="tab" data-tab="bulk">Bulk Upload</div>
                <div id="manual_entry" class="tab active" data-tab="manual">Manual Entry</div>
            </div>
        </div>

        <!-- Bulk Upload Content -->
        <div class="bulk-upload" id="bulkUpload">
            <div class="file-upload-area" id="dropZone">
                <i class="fas fa-cloud-upload-alt upload-icon"></i>
                <h3>Upload Invigilator Data File</h3>
                <p class="upload-instructions">
                    Drag & drop your CSV or Excel file here or click to browse files
                </p>
                <input type="file" id="fileUpload" class="file-input" accept=".csv, .xlsx, .xls">
                <label for="fileUpload" class="upload-btn" id="selectStudentFile" data-target-file-input-id="<%= InvigilatorFile.ClientID %>">
                    <i class="fas fa-file-import pe-2"></i>Select File
                </label>
                <asp:FileUpload ID="InvigilatorFile" runat="server" CssClass="form-control" Style="display: none;" />
                <div class="file-name" id="selectedFileName">No file selected</div>
            </div>

            <div class="format-requirements">
                <h4 class="requirements-title">File Format Requirements:</h4>
                <ul class="requirements-list">
                    <li>File must be in CSV, XLSX, or XLS format</li>
                    <li>Required columns: Staff ID, Full Name, Email, Department, Phone</li>
                    <li>Optional columns: Availability, Max Sessions, Status</li>
                    <li>Maximum file size: 5MB</li>
                </ul>
                <a href="#" class="download-template">
                    <i class="fas fa-download pe-1"></i>Download Template File
                </a>
            </div>

            <div class="form-actions">
                <button class="btn btn-outline">
                    Cancel
                </button>
                <asp:LinkButton ID="btnprocessUpload" Text="Process Upload" CssClass="btn btn-primary" runat="server" OnClick="btnprocessUpload_OnClick">
                  <i class="fas fa-upload pe-2"></i>
                    Invigilator Student
                </asp:LinkButton>
            </div>
        </div>

        <!-- Manual Entry Content -->
        <div class="manual-upload active" id="manualUpload">

            <div class="invigilator-form">
                <div class="form-group">
                    <label for="staffId" class="form-label required-field">Staff ID</label>
                    <input type="text" id="staffId" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="fullName" class="form-label required-field">Full Name</label>
                    <input type="text" id="fullName" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="email" class="form-label required-field">Email</label>
                    <input type="email" id="email" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="department" class="form-label required-field">Department</label>
                    <select id="department" class="form-control" required>
                        <option value="">Select Department</option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="Mathematics">Mathematics</option>
                        <option value="Physics">Physics</option>
                        <option value="Engineering">Engineering</option>
                        <option value="Business">Business</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="phone" class="form-label required-field">Phone Number</label>
                    <input type="tel" id="phone" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="availability" class="form-label">Availability</label>
                    <select id="availability" class="form-control">
                        <option value="Full-time">Full-time</option>
                        <option value="Part-time">Part-time</option>
                        <option value="On-call">On-call</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="maxSessions" class="form-label">Max Sessions Per Week</label>
                    <input type="number" id="maxSessions" class="form-control" min="1" max="10" value="3">
                </div>

                <div class="form-group">
                    <label for="status" class="form-label">Status</label>
                    <select id="status" class="form-control">
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>
                </div>
            </div>

            <div class="form-actions">
                <button type="reset" class="btn btn-outline">
                    Clear Form
                </button>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save pe-2"></i>Save Invigilator
                </button>
            </div>
        </div>
    </div>

    <!-- Invigilators Table -->
    <div class="upload-section" id="UploadTable">
        <div class="section-header">
            <h3 class="section-title">Invigilator Records</h3>
        </div>



        <%--<table class="invigilators-table">
            <thead>
                <tr>
                    <th>Staff ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Availability</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>FAC2023001</td>
                    <td>Dr. Michael Johnson</td>
                    <td>michael.j@university.edu</td>
                    <td>Computer Science</td>
                    <td>Full-time</td>
                    <td><span class="status-badge status-active">Active</span></td>
                    <td>
                        <i class="fas fa-edit action-btn" title="Edit"></i>
                        <i class="fas fa-trash action-btn" title="Delete"></i>
                        <i class="fas fa-eye action-btn" title="View"></i>
                    </td>
                </tr>
                <tr>
                    <td>FAC2023002</td>
                    <td>Prof. Sarah Williams</td>
                    <td>sarah.w@university.edu</td>
                    <td>Mathematics</td>
                    <td>Part-time</td>
                    <td><span class="status-badge status-active">Active</span></td>
                    <td>
                        <i class="fas fa-edit action-btn" title="Edit"></i>
                        <i class="fas fa-trash action-btn" title="Delete"></i>
                        <i class="fas fa-eye action-btn" title="View"></i>
                    </td>
                </tr>
                <tr>
                    <td>FAC2023003</td>
                    <td>Dr. Robert Chen</td>
                    <td>robert.c@university.edu</td>
                    <td>Physics</td>
                    <td>On-call</td>
                    <td><span class="status-badge status-inactive">Inactive</span></td>
                    <td>
                        <i class="fas fa-edit action-btn" title="Edit"></i>
                        <i class="fas fa-trash action-btn" title="Delete"></i>
                        <i class="fas fa-eye action-btn" title="View"></i>
                    </td>
                </tr>
                <tr>
                    <td>FAC2023004</td>
                    <td>Prof. Emily Davis</td>
                    <td>emily.d@university.edu</td>
                    <td>Engineering</td>
                    <td>Full-time</td>
                    <td><span class="status-badge status-active">Active</span></td>
                    <td>
                        <i class="fas fa-edit action-btn" title="Edit"></i>
                        <i class="fas fa-trash action-btn" title="Delete"></i>
                        <i class="fas fa-eye action-btn" title="View"></i>
                    </td>
                </tr>
            </tbody>
        </table>--%>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
    <script src="../../assets/js/Page_JS/Invigilator.js"></script>
</asp:Content>

