<%@ Page Title="" Language="C#" MasterPageFile="~/src/Student/Dashboard.master" AutoEventWireup="true" CodeFile="Exam.aspx.cs" Inherits="src_Student_Exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Exam - EMS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../../assets/css/Student/Exam.css" rel="stylesheet" />
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h4>Exam</h4>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="exam-container">
   <%--  Exam Header --%>
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>
            <asp:Label ID="lblExamTitle" runat="server" Text="Computer Science - Final Examination"></asp:Label>
        </h3>
        <div class="timer-display p-0 m-0">
            <asp:DropDownList CssClass="form-control" ID="ddlQuestionPapers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlQuestionPapers_SelectedIndexChanged" >
                
                
            </asp:DropDownList>
            
        </div>
    </div>

   <%--  Instructions --%>
    <div class="alert alert-info">
        <h5><i class="fas fa-info-circle"></i>Instructions</h5>
        <ul>
            <li>Total Marks: 100 | Duration: 90 minutes</li>
            <li>All questions are compulsory</li>
            <li>Do not refresh the page or navigate away during the exam</li>
            <li>The exam will auto-submit when time expires</li>
        </ul>
    </div>

   
    <div class="question-section">
        <h4 class="section-title">Section A: Multiple Choice (20 Marks)</h4>

        <asp:Panel ID="QuestionsPanel" runat="server">
            <div id="DivQuestionTable" class="d-block" runat="server">

            </div>
        </asp:Panel>
        
        


    <div class="submit-section text-center">
        <%--<asp:Button ID="btnSubmitExam" runat="server" Text="Submit Exam" CssClass="btn btn-primary btn-lg px-5"/>--%>
        <button class="btn btn-warning btn-lg px-5" onclick="SaveData(event);">Submit Exam</button>
        <%--//OnClick="btnSubmitExam_Click"--%>
        <asp:Label ID="lblSubmitMessage" runat="server" CssClass="text-success mt-2" Visible="false"></asp:Label>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
</asp:Content>

