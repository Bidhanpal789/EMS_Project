<%@ Page Title="" Language="C#" MasterPageFile="~/src/Teacher/Teacher.master" AutoEventWireup="true" CodeFile="AddQues.aspx.cs" Inherits="src_Teacher_AddQues" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Add Question - EMS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../../assets/css/Teacher/AddQues.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h4 class="mb-0">Add Question</h4>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="question-form">
                    <div class="form-section">
                        <h5>Question Details</h5>
                        <div class="mb-3">
                            <label for="ddlExam" class="form-label">Select Exam</label>
                            <asp:DropDownList ID="ddlExam" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlExam_SelectedIndexChanged">
                                <asp:ListItem Value="">-- Select Exam --</asp:ListItem>
                                <asp:ListItem Value="1">Mathematics</asp:ListItem>
                                <asp:ListItem Value="2">Physics</asp:ListItem>
                                <asp:ListItem Value="3">Chemistry</asp:ListItem>
                                <asp:ListItem Value="4">Computer Application</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="mb-3">
                            <label for="ddlSubject" class="form-label">Subject</label>
                            <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-select">
                                <asp:ListItem Value="">-- Select Subject --</asp:ListItem>
                            </asp:DropDownList>
                        </div>



                        <div class="mb-3">
                            <label for="txtQuestionText" class="form-label">Question Text</label>
                            <asp:TextBox ID="txtQuestionText" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>


                    </div>

                    <div class="form-section" id="optionsSection" runat="server">
                        <h5 class="form-label">Answer Options</h5>

                        <div class="d-flex">

                            <div class="form-group me-2">
                                <asp:Label Text="Option 1:" runat="server" class="form-label mb-2" />
                                <asp:TextBox ID="txtOpt1" runat="server" class="form-control" />
                            </div>
                            <div class="form-group me-2">
                                <asp:Label Text="Option 2:" runat="server" class="form-label mb-2" />
                                <asp:TextBox ID="txtOpt2" runat="server" class="form-control" />
                            </div>
                            <div class="form-group me-2">
                                <asp:Label Text="Option 3:" runat="server" class="form-label mb-2" />
                                <asp:TextBox ID="txtOpt3" runat="server" class="form-control" />
                            </div>
                            <div class="form-group me-2">
                                <asp:Label Text="Option 4:" runat="server" class="form-label mb-2" />
                                <asp:TextBox ID="txtOpt4" runat="server" class="form-control" />
                            </div>

                        </div>
                        <div class="row px-3 mt-2">
                            <asp:Label Text="Answer is:" CssClass="fw-bold" runat="server" />
                            <asp:TextBox ID="txtAnswer" runat="server" CssClass="form-control" OnTextChanged="txtAnswer_OnTextChange" AutoPostBack="true" />
                        </div>

                    </div>

                    <div class="d-flex justify-content-end">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary me-2" OnClick="btnCancel_Click" />
                        <asp:Button ID="btnSave" runat="server" Text="Save Question" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</asp:Content>

