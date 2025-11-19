<%@ Page Title="" Language="C#" MasterPageFile="~/src/Student/Dashboard.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="src_Student_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    My Profile | EMS
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../assets/css/Profile.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <div class="d-flex justify-content-between align-items-center">
    
            <h1 class="page-title mt-3">My Profile</h1>
        
        <asp:Label ID="lblLastUpdated" runat="server" CssClass="text-muted small ps-3" Visible="false"></asp:Label>
        
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container mt-4 mb-5">
        <!-- Success/Error Messages -->
        <div class="row">
            <div class="col-12">
                <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert alert-dismissible fade show">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </asp:Panel>
            </div>
        </div>

        <!-- Profile Header -->
        <div class="profile-header text-center mb-4">
            <div class="position-relative d-inline-block">
                <img src=""
                    alt="Profile Picture" class="profile-pic rounded-circle" runat="server" id="imgProfile" />
                <asp:FileUpload ID="fuProfilePic" runat="server" CssClass="d-none" accept="image/*" />
                <button type="button" class="btn btn-sm btn-primary position-absolute bottom-0 end-0 rounded-circle"
                    onclick="document.getElementById('<%= fuProfilePic.ClientID %>').click()">
                    <i class="fas fa-camera"></i>
                </button>
            </div>
            <asp:Label runat="server" CssClass="fw-bold fs-4 d-block mt-2" ID="lblUserName"></asp:Label>
            <asp:Label runat="server" CssClass="text-muted" ID="lblUserTitle"></asp:Label>
        </div>

        <!-- Personal Information Section -->
        <div class="card section-card mb-4">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0"><i class="fas fa-user me-2"></i>Personal Information</h5>
                <asp:LinkButton ID="btnEditPersonal" runat="server" CssClass="btn btn-sm btn-light" OnClick="btnEditPersonal_Click">
                    <i class="fas fa-edit me-1"></i>Edit
                </asp:LinkButton>
            </div>
            <div class="card-body">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Full Name</label>
                        <asp:TextBox runat="server" ID="txtFullName" CssClass="form-control" Enabled="false"></asp:TextBox>
                        
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Date of Birth</label>
                        <asp:TextBox runat="server" ID="txtDOB" TextMode="Date" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" Enabled="false"></asp:TextBox>
                        
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Phone Number</label>
                        <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" Enabled="false"></asp:TextBox>
                       
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Gender</label>
                        <asp:DropDownList runat="server" ID="ddlGender" CssClass="form-select" Enabled="false">
                            <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                            <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                            <asp:ListItem Text="Prefer not to say" Value="P"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>

        
        <!-- Action Buttons -->
        <div class="text-end">
            <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-outline-secondary me-2"
                Text="Cancel" Visible="false" OnClick="btnCancel_Click" />
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary"
                Text="Save Changes" OnClick="btnSave_Click" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
    <script>
        // Handle profile picture upload preview
        document.getElementById('<%= fuProfilePic.ClientID %>').addEventListener('change', function (e) {
            if (this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('<%= imgProfile.ClientID %>').src = e.target.result;
                }
                reader.readAsDataURL(this.files[0]);

                // Trigger upload (you'll need to handle this in code-behind)
                __doPostBack('<%= fuProfilePic.ClientID %>', '');
            }
        });


    </script>
    
</asp:Content>
