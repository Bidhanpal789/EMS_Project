<%@ Page Title="" Language="C#" MasterPageFile="~/src/Dashboard/Dashboard.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="src_Dashboard_Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Reports - EMS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../../assets/css/Reports.css" rel="stylesheet" />
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h1 class="page-title mt-3">Reports Overview</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="reports-content" style="height: 82vh">

        <!-- Report Filters -->
        <div class="report-filters">
            <div class="filter-row">
                <div class="filter-group">
                    <label for="report-period">Report Period</label>
                    <select id="report-period">
                        <option value="current-week">Current Week</option>
                        <option value="current-month" selected>Current Month</option>
                        <option value="last-month">Last Month</option>
                        <option value="current-term">Current Term</option>
                        <option value="custom">Custom Range</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="exam-type">Exam Type</label>
                    <select id="exam-type">
                        <option value="">All Exam Types</option>
                        <option value="midterm">Midterm Exams</option>
                        <option value="final">Final Exams</option>
                        <option value="quiz">Quizzes</option>
                        <option value="practical">Practical Exams</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="department">Department</label>
                    <select id="department">
                        <option value="">All Departments</option>
                        <option value="math">Mathematics</option>
                        <option value="cs">Computer Science</option>
                        <option value="physics">Physics</option>
                        <option value="english">English</option>
                    </select>
                </div>
            </div>
            <div class="filter-row custom-range" style="display: none;">
                <div class="filter-group">
                    <label for="date-from">From Date</label>
                    <input type="date" id="date-from">
                </div>
                <div class="filter-group">
                    <label for="date-to">To Date</label>
                    <input type="date" id="date-to">
                </div>
            </div>
            <div class="filter-actions">
                <button class="btn btn-secondary">Reset Filters</button>
                <button class="btn btn-primary">Generate Report</button>
            </div>
        </div>


        <!-- Exam Schedule Report -->
        <div class="schedule-report">
            <div class="report-header align-center">
                <h3 class="report-title">Detailed Exam Schedule</h3>
                <div class="export-options">
                    <asp:TextBox type="text" Placeholder="Enter Student ID" CssClass="form-control" runat="server" ID="txtstudentID"></asp:TextBox>
                    <asp:Button runat="server" ID="btnserch" CssClass="btn btn-outline-primary" Text="Search" OnClick="btnserch_OnClick" />
                </div>
            </div>
            <div class="row">
                <%--<asp:GridView runat="server" ID="studentExamDetails"></asp:GridView>--%>
                <asp:GridView runat="server" ID="studentExamDetails" AutoGenerateColumns="false"
                    CssClass="exam-grid table table-striped table-bordered" HeaderStyle-CssClass="thead-dark">
                    <Columns>
                        <asp:BoundField DataField="StudentId" HeaderText="StudentId" ItemStyle-Width="20%" />
                        <asp:BoundField DataField="StudentName" HeaderText="StudentName" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="RollNo" HeaderText="RollNo" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="Sem" HeaderText="Sem" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="Department" HeaderText="Department" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="RoomNo" HeaderText="RoomNo" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="PaperName" HeaderText="PaperName" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="PaperCode" HeaderText="PaperCode" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="ExamDate" HeaderText="ExamDate" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="startTime" HeaderText="startTime" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="endTime" HeaderText="endTime" ItemStyle-Width="10%" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="alert alert-info text-center">
                            No student room allocation data available.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>


    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
</asp:Content>

