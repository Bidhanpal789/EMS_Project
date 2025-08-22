<%@ Page Title="" Language="C#" MasterPageFile="~/src/Dashboard/Dashboard.master" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="src_Dashboard_users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    User Management - EMS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../assets/css/users.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h1 class="page-title mt-3">User Management</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="upload-section">
        <div class="section-header">
            <h3 class="section-title">Add Users</h3>
            <div class="section-tabs">
                <div class="tab" data-tab="bulk">Bulk Upload</div>
                <div class="tab active" data-tab="manual">Manual Entry</div>
            </div>
        </div>

        <!-- Bulk Upload Content -->
        <div class="bulk-upload" id="bulkUpload">
            <div class="file-upload-area" id="dropZone">
                <i class="fas fa-cloud-upload-alt upload-icon"></i>
                <h3>Upload User Data File</h3>
                <p class="upload-instructions">
                    Drag & drop your CSV or Excel file here or click to browse files
                </p>
                <input type="file" id="fileUpload" class="file-input" accept=".csv, .xlsx, .xls">
                <label for="fileUpload" class="upload-btn">
                    <i class="fas fa-file-import pe-2"></i>Select File
                </label>
                <div class="file-name" id="selectedFileName">No file selected</div>
            </div>

            <div class="format-requirements">
                <h4 class="requirements-title">File Format Requirements:</h4>
                <ul class="requirements-list">
                    <li>File must be in CSV, XLSX, or XLS format</li>
                    <li>Required columns: Username, Email, First Name, Last Name, Role</li>
                    <li>Optional columns: Department, Phone, Status</li>
                    <li>Role must be one of: Admin, Examiner, Invigilator, Student</li>
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
                <button class="btn btn-primary" id="processUpload">
                    <i class="fas fa-upload pe-2"></i>Process Upload
                </button>
            </div>
        </div>

        <!-- Manual Entry Content -->
        <div class="manual-upload active" id="manualUpload">
            <form id="userForm">
                <div class="user-form">
                    <div class="form-group">
                        <label for="username" class="form-label required-field">Username</label>
                        <input type="text" id="username" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="email" class="form-label required-field">Email</label>
                        <input type="email" id="email" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="firstName" class="form-label required-field">First Name</label>
                        <input type="text" id="firstName" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="lastName" class="form-label required-field">Last Name</label>
                        <input type="text" id="lastName" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="role" class="form-label required-field">Role</label>
                        <select id="role" class="form-control" required>
                            <option value="">Select Role</option>
                            <option value="Admin">Administrator</option>
                            <option value="Examiner">Examiner</option>
                            <option value="Invigilator">Invigilator</option>
                            <option value="Student">Student</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="department" class="form-label">Department</label>
                        <select id="department" class="form-control">
                            <option value="">Select Department</option>
                            <option value="Computer Science">Computer Science</option>
                            <option value="Mathematics">Mathematics</option>
                            <option value="Physics">Physics</option>
                            <option value="Engineering">Engineering</option>
                            <option value="Business">Business</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="tel" id="phone" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="status" class="form-label">Status</label>
                        <select id="status" class="form-control">
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                            <option value="pending">Pending Activation</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="password" class="form-label required-field">Initial Password</label>
                        <input type="password" id="password" class="form-control" required>
                        <small class="text-muted">User will be prompted to change on first login</small>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="reset" class="btn btn-outline">
                        Clear Form
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save pe-2"></i>Create User
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Users Table -->
    <div class="upload-section">
        <div class="section-header">
            <h3 class="section-title">User Records</h3>
            <div class="search-box">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Filter users...">
            </div>
        </div>

        <table class="users-table">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Department</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>admin1</td>
                    <td>John Smith</td>
                    <td>john.smith@university.edu</td>
                    <td><span class="role-badge role-admin">Admin</span></td>
                    <td>Computer Science</td>
                    <td><span class="status-badge status-active">Active</span></td>
                    <td>
                        <i class="fas fa-edit action-btn" title="Edit"></i>
                        <i class="fas fa-trash action-btn" title="Delete"></i>
                        <i class="fas fa-key action-btn" title="Reset Password"></i>
                    </td>
                </tr>
                <tr>
                    <td>examiner1</td>
                    <td>Jane Doe</td>
                    <td>jane.doe@university.edu</td>
                    <td><span class="role-badge role-examiner">Examiner</span></td>
                    <td>Mathematics</td>
                    <td><span class="status-badge status-active">Active</span></td>
                    <td>
                        <i class="fas fa-edit action-btn" title="Edit"></i>
                        <i class="fas fa-trash action-btn" title="Delete"></i>
                        <i class="fas fa-key action-btn" title="Reset Password"></i>
                    </td>
                </tr>
                <tr>
                    <td>invig1</td>
                    <td>Robert Johnson</td>
                    <td>robert.j@university.edu</td>
                    <td><span class="role-badge role-invigilator">Invigilator</span></td>
                    <td>Physics</td>
                    <td><span class="status-badge status-inactive">Inactive</span></td>
                    <td>
                        <i class="fas fa-edit action-btn" title="Edit"></i>
                        <i class="fas fa-trash action-btn" title="Delete"></i>
                        <i class="fas fa-key action-btn" title="Reset Password"></i>
                    </td>
                </tr>
                <tr>
                    <td>student1</td>
                    <td>Sarah Williams</td>
                    <td>sarah.w@university.edu</td>
                    <td><span class="role-badge role-student">Student</span></td>
                    <td>Engineering</td>
                    <td><span class="status-badge status-active">Active</span></td>
                    <td>
                        <i class="fas fa-edit action-btn" title="Edit"></i>
                        <i class="fas fa-trash action-btn" title="Delete"></i>
                        <i class="fas fa-key action-btn" title="Reset Password"></i>
                    </td>
                </tr>
                <tr>
                    <td>newuser1</td>
                    <td>Michael Brown</td>
                    <td>michael.b@university.edu</td>
                    <td><span class="role-badge role-examiner">Examiner</span></td>
                    <td>Business</td>
                    <td><span class="status-badge status-inactive">Pending</span></td>
                    <td>
                        <i class="fas fa-edit action-btn" title="Edit"></i>
                        <i class="fas fa-trash action-btn" title="Delete"></i>
                        <i class="fas fa-key action-btn" title="Reset Password"></i>
                        <i class="fas fa-check action-btn" title="Activate"></i>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
</asp:Content>

