<%@ Page Title="" Language="C#" MasterPageFile="~/src/Student/Dashboard.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="src_Student_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Dashboard - EMS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../../assets/css/Student/StudetnDashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h4>Dashboard</h4>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container-fluid">
        <!-- Welcome Card -->
        <div class="welcome-card">
            <h3>Welcome back,
             <asp:Label ID="lblStudentName" runat="server" Text=""></asp:Label>!</h3>
        </div>

        <div class="row d-flex justify-content-center">
            <div class="col-md-10">

                  <asp:GridView runat="server" ID="gridExamDate" AutoGenerateColumns="false" 
      CssClass="exam-grid table table-striped table-bordered" HeaderStyle-CssClass="thead-dark">
      <Columns>
          <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width="20%" />
          <asp:BoundField DataField="email" HeaderText="Email" ItemStyle-Width="15%" />
          <asp:BoundField DataField="phone" HeaderText="Phone" ItemStyle-Width="15%" />
          <asp:BoundField DataField="date" HeaderText="Date" ItemStyle-Width="15%" />
          <asp:BoundField DataField="RoomId" HeaderText="Room No" ItemStyle-Width="10%" />
          <asp:BoundField DataField="Sem" HeaderText="Semester" ItemStyle-Width="10%" />
      </Columns>
      <EmptyDataTemplate>
          <div class="alert alert-info text-center">
              No student room allocation data available.
          </div>
      </EmptyDataTemplate>
  </asp:GridView>

               <%-- <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="../../assets/Img/1.jpg" class="d-block " style="height: 26rem; width: 50rem" alt="..." />
                        </div>
                        <div class="carousel-item">
                            <img src="../../assets/Img/2.jpeg" class="d-block " style="height: 26rem; width: 50rem" alt="..." />
                        </div>
                        <div class="carousel-item">
                            <img src="../../assets/Img/3.jpg" class="d-block" style="height: 26rem; width: 50rem" alt="..." />
                        </div>
                    </div>
                </div>--%>

            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script> 
</asp:Content>

