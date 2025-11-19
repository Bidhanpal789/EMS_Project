<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam Management System (EMS) Homepage</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/Default.css" rel="stylesheet" />
    <link href="../../assets/pics/favicon.png" type="image/x-icon" rel="icon" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

</head>
<body data-bs-spy="scroll" data-bs-target="#navbarSupportedContent">
    <form id="form1" runat="server">
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

        <!-- Hero Section -->
        <section class="hero text-center">
            <div class="container">
                <h2 class="display-4 fw-bold mb-3">Streamline Your Examination Process</h2>
                <p class="lead mb-4">Exam Management System (EMS) is an automated platform for efficient exam scheduling, administration, and management.</p>
                <div class="cta-buttons my-4">
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-outline-secondary rounded-pill btn-lg me-3" NavigateUrl="../src/Register.aspx">Register Now</asp:HyperLink>
                    <asp:HyperLink ID="lnkLearnMore" runat="server" CssClass="btn btn-outline-primary px-5 rounded-pill btn-lg" NavigateUrl="../src/Login.aspx">Login</asp:HyperLink>
                </div>

            </div>
        </section>

        <!-- Features Section -->
        <section class="features py-5" id="features">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="display-5 fw-bold">Powerful Features</h2>
                    <p class="lead text-muted">Discover how EMS can transform your examination management process</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="card p-4 text-center feature-card shadow-sm">
                            <i class="fas fa-calendar-alt fa-3x mb-3 text-primary"></i>
                            <h3>Automated Scheduling</h3>
                            <p class="text-muted">Automatically generate conflict-free exam schedules.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card p-4 text-center feature-card shadow-sm">
                            <i class="fas fa-users fa-3x mb-3 text-primary"></i>
                            <h3>Student Management</h3>
                            <p class="text-muted">Manage student data and seating arrangements.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card p-4 text-center feature-card shadow-sm">
                            <i class="fas fa-chart-bar fa-3x mb-3 text-primary"></i>
                            <h3>Real-time Analytics</h3>
                            <p class="text-muted">Insights into exam performance and attendance.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card p-4 text-center feature-card shadow-sm">
                            <i class="fas fa-bell fa-3x mb-3 text-primary"></i>
                            <h3>Notifications</h3>
                            <p class="text-muted">Automated exam reminders and alerts.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card p-4 text-center feature-card shadow-sm">
                            <i class="fas fa-file-alt fa-3x mb-3 text-primary"></i>
                            <h3>Custom Reporting</h3>
                            <p class="text-muted">Generate detailed reports on all exam metrics.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card p-4 text-center feature-card shadow-sm">
                            <i class="fas fa-lock fa-3x mb-3 text-primary"></i>
                            <h3>Secure Platform</h3>
                            <p class="text-muted">Data encryption and access control included.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- How It Works Section -->
        <section class="how-it-works py-5 bg-light" id="how-it-works">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="display-5 fw-bold">How EMS Works</h2>
                    <p class="lead text-muted">Simple steps to transform your exam management</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-3">
                        <div class="card p-3 text-center h-100">
                            <div class="step-number bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 50px; height: 50px; margin: 0 auto;">1</div>
                            <h4>Set Up Institution</h4>
                            <p>Add courses, classrooms, and faculty members</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card p-3 text-center h-100">
                            <div class="step-number bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 50px; height: 50px; margin: 0 auto;">2</div>
                            <h4>Define Parameters</h4>
                            <p>Specify exam dates, duration, and requirements</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card p-3 text-center h-100">
                            <div class="step-number bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 50px; height: 50px; margin: 0 auto;">3</div>
                            <h4>Generate Schedule</h4>
                            <p>Let our algorithm create optimal schedules</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card p-3 text-center h-100">
                            <div class="step-number bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 50px; height: 50px; margin: 0 auto;">4</div>
                            <h4>Review & Publish</h4>
                            <p>Finalize and distribute to students and staff</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials -->
        <section class="testimonials py-5" id="testimonials">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="display-5 fw-bold">Client Testimonials</h2>
                    <p class="lead text-muted">What our clients say about EMS</p>
                </div>
                <div class="row g-4">
                    <asp:Repeater ID="rptTestimonials" runat="server">
                        <ItemTemplate>
                            <div class="col-md-4">
                                <div class="card p-4 h-100 testimonial-card shadow-sm">
                                    <p class="fst-italic mb-4"><i class="fas fa-quote-left text-muted me-2"></i><%# Eval("Text") %></p>
                                    <div class="d-flex align-items-center">
                                        <img src='<%# Eval("ImageUrl") %>' class="rounded-circle me-3" width="60" height="60" alt='<%# Eval("Name") %>' />
                                        <div>
                                            <h6 class="mb-0"><%# Eval("Name") %></h6>
                                            <small class="text-muted"><%# Eval("Position") %></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta-section py-5 text-center bg-primary text-white" id="contact">
            <div class="container">
                <h2 class="display-5 fw-bold mb-3">Ready to Transform Your Exam Management?</h2>
                <p class="lead mb-4">Join hundreds of institutions using EMS today.</p>
                <asp:Button ID="btnRequestDemo" runat="server" Text="Register Now" CssClass="btn btn-light rounded-pill btn-lg px-4" OnClick="btnRequestDemo_Click" />
            </div>
        </section>

        <!-- Footer -->
        <footer class="bg-dark text-white pt-5 pb-4">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="mb-3">About EMS</h5>
                        <p>A complete system to automate your exam workflow and scheduling process.</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="mb-3">Quick Links</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2"><a href="#features" class="text-white text-decoration-none">Features</a></li>
                            <li class="mb-2"><a href="#how-it-works" class="text-white text-decoration-none">How It Works</a></li>
                            <li class="mb-2"><a href="#testimonials" class="text-white text-decoration-none">Testimonials</a></li>
                            <li class="mb-2"><a href="#contact" class="text-white text-decoration-none">Contact</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="mb-3">Contact Us</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2"><i class="fas fa-map-marker-alt me-2"></i>123 Education St, Tech City</li>
                            <li class="mb-2"><i class="fas fa-phone me-2"></i>(123) 456-7890</li>
                            <li class="mb-2"><i class="fas fa-envelope me-2"></i>info@ems-system.com</li>
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="mb-3">Follow Us</h5>
                        <div class="d-flex gap-3">
                            <a href="#" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                            <a href="#" class="text-white"><i class="fab fa-twitter fa-lg"></i></a>
                            <a href="#" class="text-white"><i class="fab fa-linkedin-in fa-lg"></i></a>
                            <a href="#" class="text-white"><i class="fab fa-instagram fa-lg"></i></a>
                        </div>
                    </div>
                </div>
                <hr class="my-4" />
                <div class="text-center">
                    <p class="mb-0">&copy; <%: DateTime.Now.Year %> Exam Management System (EMS). All rights reserved.</p>
                </div>
            </div>
        </footer>
    </form>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
   
    <script src="assets/js/custom.js"></script>
</body>
</html>
