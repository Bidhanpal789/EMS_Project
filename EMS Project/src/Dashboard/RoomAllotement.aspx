<%@ Page Title="" Language="C#" MasterPageFile="~/src/Dashboard/Dashboard.master" AutoEventWireup="true" CodeFile="RoomAllotement.aspx.cs" Inherits="src_Dashboard_RoomAllotement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">
 Sudent Management - EMS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderStyles" Runat="Server">
        <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../assets/css/Roomallotement.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- DataTables JS -->
<script type="text/javascript" src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DashboardHeader" Runat="Server">
    <h1 class="page-title mt-3">Sudent and Room Mapping</h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="btn btn-primary">
     <i class="fas fa-save "></i>
     <asp:button text="Save Student" id="btnalloted" cssClass="btn bg-transparent" runat="server" />
 </div>
    <div class="row" id="table-container">
       <%-- Table Show Here...--%>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FooterScripts" Runat="Server">
</asp:Content>

