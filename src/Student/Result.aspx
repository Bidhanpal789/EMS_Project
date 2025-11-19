<%@ Page Title="" Language="C#" MasterPageFile="~/src/Student/Dashboard.master" AutoEventWireup="true" CodeFile="Result.aspx.cs" Inherits="src_Student_Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Result - EMS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../../assets/css/Student/Exam.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h4>Exam Results</h4>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="result-card">
    <div class="result-header">
        <h3><i class="fas fa-award"></i>Exam Results</h3>
        <p>
            <asp:Label ID="lblExamName" runat="server" Text="Computer Science Final Exam"></asp:Label></p>
    </div>

    <div class="result-body">
        <!-- Overall Score -->
        <div class="row">
            <div class="col-md-6">
                <div class="score-display">
                    <asp:Label ID="lblTotalScore" runat="server" Text="85"></asp:Label>/100
                </div>
                <div class="grade">
                    Grade:
                    <asp:Label ID="lblGrade" runat="server" Text="A" CssClass="badge bg-success"></asp:Label>
                </div>
            </div>

            <div class="col-md-6">
                <h5><i class="fas fa-info-circle"></i>Exam Details</h5>
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center">Date Taken:
                        <span class="badge bg-primary rounded-pill">
                            <asp:Label ID="lblExamDate" runat="server" Text="2023-11-15"></asp:Label>
                        </span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">Duration:
                        <span class="badge bg-primary rounded-pill">
                            <asp:Label ID="lblDuration" runat="server" Text="90 mins"></asp:Label>
                        </span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">Status:
                        <span class="badge bg-success rounded-pill">
                            <asp:Label ID="lblStatus" runat="server" Text="Completed"></asp:Label>
                        </span>
                    </li>
                </ul>
            </div>
        </div>


        <!-- Answer Review -->
        <h4 class="mt-5 mb-3"><i class="fas fa-search"></i>Answer Review</h4>

        <div class="accordion" id="answerReview">
            <!-- Section A Review -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#sectionA">
                        Multiple Choice Questions (20 Marks)
                    </button>
                </h2>
                <asp:GridView runat="server" ID ="gvQuizResults" CellPadding="20" CellSpacing="5" ForeColor="#333333" GridLines="None" Cell>
                    <AlternatingRowStyle BackColor="White" />
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

                </asp:GridView>                </div>


        </div>

        <div class="text-center review-btn">
            <asp:Button ID="btnPrint" runat="server" Text="Print Results" CssClass="btn btn-secondary" OnClientClick="window.print();" />
            <asp:Button ID="btnBack" runat="server" Text="Back to Exams" CssClass="btn btn-primary" PostBackUrl="~/src/Student/Exam.aspx" />
        </div>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
        // Initialize Bootstrap 5 tooltips
        document.addEventListener('DOMContentLoaded', function () {
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        });
    </script>

</asp:Content>

