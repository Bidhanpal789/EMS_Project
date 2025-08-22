<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="src_Register" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Register - Exam Management System (EMS)</title>
    <meta charset="UTF-8">
    <link href="../../assets/pics/favicon.png" type="image/x-icon" rel="icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/Register.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body class="overflow-x-hidden">
    <!-- Header -->
    <header class="fixed-top">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg ">
                <div class="container-fluid">
                    <div class="logo d-flex align-items-center">
                        <a href="../Default.aspx" class="text-decoration-none">
                            <i class="fas fa-graduation-cap fa-2x me-2 text-primary"></i>
                            <span class="fw-bold  navbar-brand mb-0">EMS</span>
                        </a>
                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="../Default.aspx#features">Features</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../Default.aspx#how-it-works">How It Works</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../Default.aspx#testimonials">Testimonials</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../Default.aspx#contact">Contact</a>
                            </li>
                        </ul>
                        <div class="d-flex gap-2">
                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-outline-secondary rounded-pill px-4" NavigateUrl="../src/Register.aspx">Register</asp:HyperLink>
                            <asp:HyperLink ID="lnkLogin" runat="server" CssClass="btn btn-outline-primary rounded-pill px-4" NavigateUrl="../src/Login.aspx">Login</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <div class="circle circle-1"></div>
    <div class="circle circle-2"></div>

    <div class="register-container">
        <div class="register-header">
            <div class="logo">
                <i class="fas fa-graduation-cap"></i>
                <h1>EMS</h1>
            </div>
            <span class="text-gray">Create your Exam Management System account</span><br />

        </div>

        <form class="register-form" runat="server" id="registerForm">


            <%--Full Name--%>
            <div class="form-group mb-2">
                <asp:Label ID="lblFullName" CssClass="txt-size" Text="Full Name" runat="server" />
                <div class="input-group">
                    <span class="input-group-icon bg-icon">
                        <i class="fas fa-user"></i>
                    </span>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name" />
                </div>
            </div>

            <%--Email Id--%>
            <div class="form-group mb-2">
                <asp:Label ID="lblMail" CssClass="txt-size" Text="Mail Address" runat="server" />
                <div class="input-group">
                    <span class="input-group-icon bg-icon">
                        <i class="fas fa-envelope"></i>
                    </span>
                    <asp:TextBox ID="txtMail" runat="server" CssClass="form-control" placeholder="Enter your Mail Id" />
                </div>
            </div>

            <%--Institution Name--%>
            <div class="form-group mb-2">
                <asp:Label ID="lblInstitution" CssClass="txt-size" Text="Institution" runat="server" />
                <div class="input-group">
                    <span class="input-group-icon bg-icon">
                        <i class="fas fa-school"></i>
                    </span>
                    <asp:TextBox ID="txtInstitution" runat="server" CssClass="form-control" placeholder="Enter your Institution Name" />
                </div>
            </div>

            <%--Id card--%>
            <div class="form-group mb-2">
                <asp:Label ID="lblIDCard" CssClass="txt-size" Text="ID Card No." runat="server" />
                <div class="input-group">
                    <span class="input-group-icon bg-icon">
                        <i class="fas fa-id-card"></i>
                    </span>
                    <asp:TextBox ID="txtIDCard" runat="server" CssClass="form-control" placeholder="Enter your ID number" />
                </div>
            </div>

            <%--Password--%>
            <div class="form-group mb-2">
                <asp:Label ID="lblPassword" CssClass="txt-size" Text="Password" runat="server" />
                <div class="input-group">
                    <span class="input-group-icon bg-icon toggle-password" onclick="togglePasswordVisibility(this)">
                        <i class="fas fa-eye"></i>
                    </span>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Create a password" />
                </div>
                <div class="password-strength"></div>
                <div class="password-hint">
                    Password must be at least 8 characters with a number and special character
                </div>
            </div>

            <%--Confirm Password--%>
            <div class="form-group mb-2">
                <asp:Label ID="lblCnfPassword" CssClass="txt-size" Text="Confirm Password" runat="server" />
                <div class="input-group">
                    <span class="input-group-icon bg-icon toggle-password" onclick="togglePasswordVisibility(this)">
                        <i class="fas fa-eye"></i>
                    </span>
                    <asp:TextBox ID="txtCNFPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm your password" />
                </div>
            </div>

            <div class="form-group mb-3">
                <label class="d-block mb-2 fw-semibold">Select User Type:</label>
                <div class="d-flex gap-5">
                    <div class="form-check form-check-inline">
                        <asp:RadioButton ID="rdoAdmin" CssClass="form-check-input" GroupName="UserType" runat="server" />
                        <%--<label class="form-check-label" for="<%= rdoAdmin.ClientID %>">Admin</label>--%>
                        <asp:Label ID="lblAdmin" Text="Admin" runat="server" class="form-check-label" />
                    </div>
                    <div class="form-check form-check-inline">
                        <asp:RadioButton ID="rdoTeacher" CssClass="form-check-input" GroupName="UserType" runat="server" />
                        <%--<label class="form-check-label" for="<%= rdoTeacher.ClientID %>">Teacher</label>--%>
                        <asp:Label ID="lblTeacher" Text="Teacher" runat="server" class="form-check-label" />

                    </div>
                    <div class="form-check form-check-inline">
                        <asp:RadioButton ID="rdoStudent" CssClass="form-check-input" GroupName="UserType" runat="server" />
                        <%--<label class="form-check-label" for="<%= rdoStudent.ClientID %>">Student</label>--%>
                        <asp:Label ID="lblStudent" Text="Student" runat="server" class="form-check-label" />

                    </div>
                </div>

            </div>

            <asp:Button ID="btnCreate" class="register-btn" Text="Create Account" runat="server" OnClick="btnCreate_Click" />

        </form>

        <div class="register-footer">
            <p>Already have an account? <a href="../src/Login.aspx">Sign in</a></p>
        </div>
    </div>
    <script src="../assets/js/Register.js"></script>
    <script src="../assets/js/PasswordToggle.js"></script>
    <script src="../assets/js/custom.js"></script>
</body>
</html>
