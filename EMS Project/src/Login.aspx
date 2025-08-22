<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="src_Login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EMS Login - Exam Management System</title>
    <link href="../../assets/pics/favicon.png" type="image/x-icon" rel="icon" />
    <%--<link href="../assets/css/Login.css" rel="stylesheet" />--%>
    <link href="../assets/css/Register.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body class="overflow-hidden overflow-auto" style="height: 100vh">

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
            <span class="text-gray">Login to Exam Management System account</span><br />

        </div>

        <form class="register-form" runat="server" id="registerForm">



            <%--Email Id--%>
            <div class="form-group mb-2">
                <asp:Label ID="lblMail" CssClass="txt-size" Text="Username" runat="server" />
                <div class="input-group">
                    <span class="input-group-icon bg-icon">
                        <i class="fas fa-envelope"></i>
                    </span>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your Mail Id" />
                </div>
            </div>



            <%--Confirm Password--%>
            <div class="form-group mb-2">
                <asp:Label ID="lblCnfPassword" CssClass="txt-size" Text="Password" runat="server" />
                <div class="input-group">
                    <span class="input-group-icon bg-icon toggle-password" onclick="togglePasswordVisibility(this)">
                        <i class="fas fa-eye"></i>
                    </span>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm your password" />
                </div>
            </div>



            <asp:Button ID="btnLogin" class="register-btn" Text="Login" runat="server" OnClick="btnLogin_Click" />

        </form>

        <div class="register-footer">
            <p>Already have an account? <a href="../src/Register.aspx">Sign Up</a></p>
        </div>
    </div>
    <script src="../assets/js/Register.js"></script>
    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/PasswordToggle.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>
