<%@ Page Title="" Language="C#" MasterPageFile="~/src/Teacher/Teacher.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="src_Teacher_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    Dashboard - EMS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" runat="Server">
    <link href="../../assets/css/Teacher/Dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" runat="Server">
    <h4 class="mb-0">Dashboard</h4>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container-fluid mb-0 pb-0">
        <div class="row d-flex">
            <div class="col-md-12">

               

            </div>
            
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" runat="Server">
      <!-- Font Awesome for icons -->
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <script>
      // Any dashboard-specific scripts can go here
      $(document).ready(function () {
          // Initialize any plugins or add interactions
      });
  </script>
</asp:Content>

