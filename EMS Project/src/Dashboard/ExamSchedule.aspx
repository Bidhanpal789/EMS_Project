<%@ Page Title="" Language="C#" MasterPageFile="~/src/Dashboard/Dashboard.master" AutoEventWireup="true" CodeFile="ExamSchedule.aspx.cs" Inherits="src_Dashboard_ExamSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Exam Schedule
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <style type="text/css">
        .exam-grid {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
        }
            .exam-grid th {
                background-color: #343a40;
                color: white;
                padding: 10px;
                text-align: center;
            }
            .exam-grid td {
                padding: 8px;
                border-bottom: 1px solid #dee2e6;
                text-align: center;
            }
            .exam-grid tr:nth-child(even) {
                background-color: #f8f9fa;
            }
            .exam-grid tr:hover {
                background-color: #e9ecef;
            }

        .grid-container {
            overflow-x: auto;
            padding: 15px;
        }

        .card-body {
            padding: 20px;
        }

        .action-buttons {
            margin: 20px 0;
        }

        /* Height and scrolling */
        .content-section {
            height: 25vh;
            overflow-y: auto;
            margin-bottom: 15px;
        }

        .fixed-height-card {
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .card-body-scrollable {
            flex: 1;
            overflow-y: auto;
        }

        /* Print styles */
        @media print {
            body * {
                visibility: hidden;
            }
            .print-content, .print-content * {
                visibility: visible;
            }
            .print-content {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
            }
            .no-print {
                display: none !important;
            }
            table {
                page-break-inside: auto;
            }
            tr {
                page-break-inside: avoid;
            }
            .report-header {
                text-align: center;
                margin-bottom: 20px;
            }
            .report-section {
                margin-bottom: 30px;
                page-break-after: avoid;
            }
            .report-footer {
                text-align: center;
                margin-top: 30px;
                font-style: italic;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h1 class="page-title mt-3">Manage Student And Invigilator for the Exam</h1>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <!-- Hidden print content -->
    <div id="printContent" class="print-content" style="display:none;">
        <div class="report-header">
            <h2>Exam Schedule Report</h2>
            <p>Generated on: <span id="reportDate"></span></p>
        </div>
        
        <div class="report-section">
            <h4>Student Room Allocation</h4>
            <asp:GridView runat="server" ID="gridStudentPrint" AutoGenerateColumns="false" CssClass="exam-grid">
                <Columns>
                    <asp:BoundField DataField="Department" HeaderText="Department" />
                    <asp:BoundField DataField="StartRollNo" HeaderText="Start Roll No" />
                    <asp:BoundField DataField="EndRollNo" HeaderText="End Roll No" />
                    <asp:BoundField DataField="RoomNo" HeaderText="Room No" />
                    <asp:BoundField DataField="Sem" HeaderText="Semester" />
                </Columns>
            </asp:GridView>
            <div class="total-count">Total Allocations: <span id="studentTotal"></span></div>
        </div>

        <div class="report-section">
            <h4>Exam Schedule</h4>
            <asp:GridView runat="server" ID="gridExamDetailsPrint" AutoGenerateColumns="false" CssClass="exam-grid">
                <Columns>
                    <asp:BoundField DataField="Dept" HeaderText="Department" />
                    <asp:BoundField DataField="Sem" HeaderText="Semester" />
                    <asp:BoundField DataField="PaperCode" HeaderText="Paper Code" />
                    <asp:BoundField DataField="PaperName" HeaderText="Paper Name" />
                    <asp:BoundField DataField="ExamDate" HeaderText="Exam Date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="startTime" HeaderText="Start Time" />
                    <asp:BoundField DataField="endTime" HeaderText="End Time" />
                </Columns>
            </asp:GridView>
            <div class="total-count">Total Exams: <span id="examTotal"></span></div>
        </div>

        <div class="report-section">
            <h4>Invigilator Room Allocation</h4>
            <asp:GridView runat="server" ID="gridInvigilatorPrint" AutoGenerateColumns="false" CssClass="exam-grid">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="phone" HeaderText="Phone" />
                    <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="RoomId" HeaderText="Room No" />
                    <asp:BoundField DataField="Sem" HeaderText="Semester" />
                </Columns>
            </asp:GridView>
            <div class="total-count">Total Invigilators: <span id="invigilatorTotal"></span></div>
        </div>

        <div class="report-footer">
            <p>End of Report</p>
        </div>
    </div>

    <!-- Main content -->
    <div class="container-fluid overflow-hidden">
        <!-- Action Buttons -->
        <div class="row content-section">
            <div class="col-12 h-100">
                <div class="card shadow fixed-height-card">
                    <div class="card-body text-center action-buttons">
                        <asp:Button Text="Manage Exam" CssClass="btn btn-primary rounded-pill px-4 shadow"
                            runat="server" ID="btnShedule" OnClick="btnShedule_OnClick" />
                        
                    </div>
                </div>
            </div>
        </div>

        <!-- Student Room Allocation Section -->
        <div class="row content-section">
            <div class="col-12 h-100">
                <div class="card shadow fixed-height-card">
                    <div class="card-header d-flex justify-content-between bg-dark text-white">
                        <h5 class="mb-0">Student Room Allocation</h5>
                        <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#studentModal">
                            Show All
                        </button>
                    </div>
                    <div class="card-body card-body-scrollable grid-container">
                        <asp:GridView runat="server" ID="gridStudent" AutoGenerateColumns="false"
                            CssClass="exam-grid table table-striped table-bordered" HeaderStyle-CssClass="thead-dark">
                            <Columns>
                                <asp:BoundField DataField="Department" HeaderText="Department" />
                                <asp:BoundField DataField="StartRollNo" HeaderText="Start Roll No" />
                                <asp:BoundField DataField="EndRollNo" HeaderText="End Roll No" />
                                <asp:BoundField DataField="RoomNo" HeaderText="Room No" />
                                <asp:BoundField DataField="Sem" HeaderText="Semester" />
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
        </div>

        <!-- Student Allocation Modal -->
        <div class="modal fade" id="studentModal" tabindex="-1" aria-labelledby="studentModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="studentModalLabel">Student Room Allocation - Complete List</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body card-body-scrollable grid-container">
                            <asp:GridView runat="server" ID="gridStudentAll" AutoGenerateColumns="false"
                                CssClass="exam-grid table table-striped table-bordered">
                                <Columns>
                                    <asp:BoundField DataField="Department" HeaderText="Department" />
                                    <asp:BoundField DataField="StartRollNo" HeaderText="Start Roll No" />
                                    <asp:BoundField DataField="EndRollNo" HeaderText="End Roll No" />
                                    <asp:BoundField DataField="RoomNo" HeaderText="Room No" />
                                    <asp:BoundField DataField="Sem" HeaderText="Semester" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="printModal('studentModal')">
                            <i class="fas fa-print"></i> Print
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Exam Schedule Section -->
        <div class="row content-section">
            <div class="col-12 h-100">
                <div class="card shadow fixed-height-card">
                    <div class="card-header d-flex justify-content-between bg-dark text-white">
                        <h5 class="mb-0">Exam Schedule</h5>
                        <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#examModal">
                            Show All
                        </button>
                    </div>
                    <div class="card-body card-body-scrollable grid-container">
                        <asp:GridView runat="server" ID="gridExamDetails" AutoGenerateColumns="false"
                            CssClass="exam-grid table table-striped table-bordered">
                            <Columns>
                                <asp:BoundField DataField="Dept" HeaderText="Department" />
                                <asp:BoundField DataField="Sem" HeaderText="Semester" />
                                <asp:BoundField DataField="PaperCode" HeaderText="Paper Code" />
                                <asp:BoundField DataField="PaperName" HeaderText="Paper Name" />
                                <asp:BoundField DataField="ExamDate" HeaderText="Exam Date" DataFormatString="{0:d}" />
                                <asp:BoundField DataField="startTime" HeaderText="Start Time" />
                                <asp:BoundField DataField="endTime" HeaderText="End Time" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <!-- Exam Schedule Modal -->
        <div class="modal fade" id="examModal" tabindex="-1" aria-labelledby="examModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="examModalLabel">Exam Schedule - Complete List</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body card-body-scrollable grid-container">
                            <asp:GridView runat="server" ID="gridExamDetailsAll" AutoGenerateColumns="false"
                                CssClass="exam-grid table table-striped table-bordered">
                                <Columns>
                                    <asp:BoundField DataField="Dept" HeaderText="Department" />
                                    <asp:BoundField DataField="Sem" HeaderText="Semester" />
                                    <asp:BoundField DataField="PaperCode" HeaderText="Paper Code" />
                                    <asp:BoundField DataField="PaperName" HeaderText="Paper Name" />
                                    <asp:BoundField DataField="ExamDate" HeaderText="Exam Date" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="startTime" HeaderText="Start Time" />
                                    <asp:BoundField DataField="endTime" HeaderText="End Time" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="printModal('examModal')">
                            <i class="fas fa-print"></i> Print
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Invigilator Room Allocation Section -->
        <div class="row content-section">
            <div class="col-12 h-100">
                <div class="card shadow fixed-height-card">
                    <div class="card-header d-flex justify-content-between bg-dark text-white">
                        <h5 class="mb-0">Invigilator Room Allocation</h5>
                        <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#invigilatorModal">
                            Show All
                        </button>
                    </div>
                    <div class="card-body card-body-scrollable grid-container">
                        <asp:GridView runat="server" ID="gridInvigilator" AutoGenerateColumns="false"
                            CssClass="exam-grid table table-striped table-bordered">
                            <Columns>
                                <asp:BoundField DataField="name" HeaderText="Name" />
                                <asp:BoundField DataField="email" HeaderText="Email" />
                                <asp:BoundField DataField="phone" HeaderText="Phone" />
                                <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:d}" />
                                <asp:BoundField DataField="RoomId" HeaderText="Room No" />
                                <asp:BoundField DataField="Sem" HeaderText="Semester" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <!-- Invigilator Allocation Modal -->
        <div class="modal fade" id="invigilatorModal" tabindex="-1" aria-labelledby="invigilatorModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="invigilatorModalLabel">Invigilator Room Allocation - Complete List</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body card-body-scrollable grid-container">
                            <asp:GridView runat="server" ID="gridInvigilatorAll" AutoGenerateColumns="false"
                                CssClass="exam-grid table table-striped table-bordered">
                                <Columns>
                                    <asp:BoundField DataField="name" HeaderText="Name" />
                                    <asp:BoundField DataField="email" HeaderText="Email" />
                                    <asp:BoundField DataField="phone" HeaderText="Phone" />
                                    <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="RoomId" HeaderText="Room No" />
                                    <asp:BoundField DataField="Sem" HeaderText="Semester" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="printModal('invigilatorModal')">
                            <i class="fas fa-print"></i> Print
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            // Initialize data only for print section
            initializePrintData();
            updateTotals();

            // Set report date
            $('#reportDate').text(new Date().toLocaleDateString() + ' ' + new Date().toLocaleTimeString());

            // Initialize modals only when opened
            $('#studentModal').on('show.bs.modal', function () {
                if ($('#<%= gridStudentAll.ClientID %> tbody tr').length === 0) {
                    loadModalData('#<%= gridStudent.ClientID %>', '#<%= gridStudentAll.ClientID %>');
                }
            });

            $('#examModal').on('show.bs.modal', function () {
                if ($('#<%= gridExamDetailsAll.ClientID %> tbody tr').length === 0) {
                    loadModalData('#<%= gridExamDetails.ClientID %>', '#<%= gridExamDetailsAll.ClientID %>');
                }
            });

            $('#invigilatorModal').on('show.bs.modal', function () {
                if ($('#<%= gridInvigilatorAll.ClientID %> tbody tr').length === 0) {
                    loadModalData('#<%= gridInvigilator.ClientID %>', '#<%= gridInvigilatorAll.ClientID %>');
                }
            });
        });

        function initializePrintData() {
            // Clone data only to print sections
            $('#<%= gridStudent.ClientID %>').clone(true, true).appendTo('#gridStudentPrint');
            $('#<%= gridExamDetails.ClientID %>').clone(true, true).appendTo('#gridExamDetailsPrint');
            $('#<%= gridInvigilator.ClientID %>').clone(true, true).appendTo('#gridInvigilatorPrint');
        }

        function loadModalData(sourceId, targetId) {
            // Clear existing data first
            $(targetId + ' tbody').empty();
            // Clone fresh data
            $(sourceId).clone(true, true).appendTo(targetId);
        }

        function updateTotals() {
            $('#studentTotal').text($('#<%= gridStudent.ClientID %> tbody tr').not('.empty').length);
            $('#examTotal').text($('#<%= gridExamDetails.ClientID %> tbody tr').not('.empty').length);
            $('#invigilatorTotal').text($('#<%= gridInvigilator.ClientID %> tbody tr').not('.empty').length);
        }

        function printAllSections() {
            updateTotals();
            var printContent = $('#printContent').html();
            var originalContent = $('body').html();

            $('body').html(printContent);
            window.print();
            $('body').html(originalContent);
        }

        function printModal(modalId) {
            var modal = $('#' + modalId);
            var title = modal.find('.modal-title').text();
            var content = modal.find('.modal-body').html();

            var printWindow = window.open('', '_blank');
            printWindow.document.write(`
                <html>
                    <head>
                        <title>${title}</title>
                        <style>
                            body { font-family: Arial, sans-serif; margin: 20px; }
                            h1 { color: #333; text-align: center; margin-bottom: 20px; }
                            table { width: 100%; border-collapse: collapse; margin-top: 10px; }
                            th { background-color: #343a40; color: white; padding: 8px; text-align: center; }
                            td { padding: 8px; border: 1px solid #ddd; text-align: center; }
                            .total-count { text-align: right; margin-top: 10px; font-weight: bold; }
                            .report-footer { text-align: center; margin-top: 20px; font-style: italic; }
                            @page { size: auto; margin: 10mm; }
                        </style>
                    </head>
                    <body>
                        <h1>${title}</h1>
                        ${content}
                        <div class="total-count">Total: ${$('#' + modalId + ' tbody tr').not('.empty').length} records</div>
                        <div class="report-footer">Report generated on: ${new Date().toLocaleDateString()}</div>
                        <script>
                            window.onload = function() {
                                window.print();
                                setTimeout(function() { window.close(); }, 100);
                            };
                        <\/script>
                    </body>
                </html>
            `);
            printWindow.document.close();
        }
    </script>
</asp:Content>