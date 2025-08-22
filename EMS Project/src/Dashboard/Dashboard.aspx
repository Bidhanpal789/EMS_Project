<%@ Page Title="" Language="C#" MasterPageFile="~/src/Dashboard/Dashboard.master"
    AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="src_Dashboard_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Dashboard - Exam Management System
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../assets/css/Dashboard.css" rel="stylesheet" />
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h1 class="page-title  mt-3">Dashboard Overview</h1>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <!-- Preloader -->
    <div class="preloader">
        <div class="loader"></div>
    </div>
    <!-- Dashboard Content -->
    <div class="dashboard-content overflow-hidden " style="height: 82vh">


        <!-- Stats Cards -->
        <div class="stats-grid">
            <a href="#" class="text-decoration-none">
                <div class="stat-card shadow">
                    <div class="stat-card-header">
                        <div class="stat-card-title">Active Invigilators</div>
                        <div class="stat-card-icon blue">
                            <i class="fas fa-chalkboard-teacher"></i>
                        </div>
                    </div>
                    <%--<div class="stat-card-value">
         
     </div>--%>
                    <asp:Label ID="lblInviShow" class="stat-card-value" Text="" runat="server" />
                    <div class="stat-card-change positive">
                        <i class="fas fa-arrow-up"></i>2 from last week
                    </div>
                </div>
            </a>

            <div class="stat-card shadow">
                <div class="stat-card-header">
                    <div class="stat-card-title">Students Registered</div>
                    <div class="stat-card-icon green">
                        <i class="fas fa-user-graduate"></i>
                    </div>
                </div>
                <asp:Label ID="lblStudentReg" class="stat-card-value" Text="" runat="server" />

                <div class="stat-card-change positive">
                    <i class="fas fa-arrow-up"></i>5% from last term
                </div>
            </div>

            <div class="stat-card shadow">
                <div class="stat-card-header">
                    <div class="stat-card-title">Rooms Available</div>
                    <div class="stat-card-icon orange">
                        <i class="fas fa-building"></i>
                    </div>
                </div>
                <asp:Label ID="lblRoomShow" class="stat-card-value" Text="" runat="server" />

                <div class="stat-card-change negative">
                    <i class="fas fa-arrow-down"></i>3 from yesterday
                </div>
            </div>

            <div class="stat-card shadow">
                <div class="stat-card-header">
                    <div class="stat-card-title">Papers</div>
                    <div class="stat-card-icon purple">
                        <i class="fas fa-book-open"></i>
                    </div>
                </div>
                <asp:Label ID="lblPaperShow" class="stat-card-value" Text="" runat="server" />
                <div class="stat-card-change positive">
                    <i class="fas fa-arrow-up"></i>3 new this month
                </div>
            </div>
        </div>

        <%-- <!-- Main Content Grid -->
        <div class="content-grid">
            <!-- Left Column -->
            <div class="left-column">
                <!-- Upcoming Exams Panel -->
                <div class="panel shadow">
                    <div class="panel-header">
                        <h3 class="panel-title">Upcoming Exams</h3>
                        <div class="panel-actions">
                            <a href="#">View All</a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="exam-table">
                            <thead>
                                <tr>
                                    <th>Course</th>
                                    <th>Date & Time</th>
                                    <th>Venue</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Mathematics 101</td>
                                    <td>May 25, 2023 • 9:00 AM</td>
                                    <td>Block A, Room 203</td>
                                    <td><span class="exam-status status-scheduled">Scheduled</span></td>
                                </tr>
                                <tr>
                                    <td>Computer Science 210</td>
                                    <td>May 28, 2023 • 1:30 PM</td>
                                    <td>Block C, Room 105</td>
                                    <td><span class="exam-status status-scheduled">Scheduled</span></td>
                                </tr>
                                <tr>
                                    <td>Physics 150</td>
                                    <td>June 2, 2023 • 10:00 AM</td>
                                    <td>Block B, Auditorium</td>
                                    <td><span class="exam-status status-scheduled">Scheduled</span></td>
                                </tr>
                                <tr>
                                    <td>English Literature</td>
                                    <td>June 5, 2023 • 11:00 AM</td>
                                    <td>Block A, Room 301</td>
                                    <td><span class="exam-status status-scheduled">Scheduled</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Right Column -->
            <div class="right-column">
                <!-- Recent Activity Panel -->
                <div class="panel shadow">
                    <div class="panel-header">
                        <h3 class="panel-title">Recent Activity</h3>
                        <div class="panel-actions">
                            <a href="#">See All</a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <ul class="activity-list">
                            <li class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-calendar-plus"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-title">New exam scheduled for Mathematics 101</div>
                                    <div class="activity-time">2 hours ago</div>
                                </div>
                            </li>
                            <li class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-user-edit"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-title">Student records updated by Admin</div>
                                    <div class="activity-time">Yesterday, 4:30 PM</div>
                                </div>
                            </li>
                            <li class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-title">3 exam conflicts detected</div>
                                    <div class="activity-time">Yesterday, 10:15 AM</div>
                                </div>
                            </li>
                            <li class="activity-item">
                                <div class="activity-icon">
                                    <i class="fas fa-check-circle"></i>
                                </div>
                                <div class="activity-content">
                                    <div class="activity-title">Physics 150 exam approved</div>
                                    <div class="activity-time">May 20, 2023</div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
</asp:Content>
