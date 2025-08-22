<%@ Page Title="" Language="C#" MasterPageFile="~/src/Dashboard/Dashboard.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="src_Dashboard_Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h4>Change your Password</h4>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row">
        <div class="col-12">
            <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert alert-dismissible fade show">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </asp:Panel>
        </div>
    </div>
    <!-- Password Update Section (Optional) -->
    <div class="card section-card mb-4">
        <div class="card-header bg-primary text-white">
            <h5><i class="fas fa-lock me-2"></i>Password Update</h5>
        </div>
        <div class="card-body">
            <div class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Current Password</label>
                    <asp:TextBox runat="server" ID="txtCurrentPassword" TextMode="Password" CssClass="form-control" OnTextChanged="check_pass" AutoPostBack="true"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label class="form-label">New Password</label>
                    <asp:TextBox runat="server" ID="txtNewPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <div class="form-text small">Minimum 8 characters</div>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Confirm Password</label>
                    <asp:TextBox runat="server" ID="txtConfirmPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>

                </div>
            </div>
        </div>
    </div>


    <div class="text-end">
        <asp:LinkButton runat="server" ID="LinkButton1" CssClass="btn btn-primary" OnClick="btnSave_Click">
     <i class="fas fa-setting pe-2"></i>Change Password
        </asp:LinkButton>
    </div>

    </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
</asp:Content>

