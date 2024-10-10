<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cabecera.ascx.cs" Inherits="GesPresta.Cabecera" %>

<div class="header-div">
    <div class="hyperlink-div">
        <asp:LinkButton class="hyperlink-header" id="hyperlink1" PostBackUrl="Default.aspx" runat="server" CausesValidation="false">Inicio</asp:LinkButton>
        <asp:LinkButton class="hyperlink-header" id="hyperlink2" PostBackUrl="Empleados.aspx" runat="server" CausesValidation="false">Empleados</asp:LinkButton>
        <asp:LinkButton class="hyperlink-header" id="hyperlink3" PostBackUrl="Prestaciones.aspx" runat="server" CausesValidation="false">Prestaciones</asp:LinkButton>
    </div>

    <div class="title-div">
        <h1>ACME INNOVACIÓN, S.FIG</h1>
    </div>

    <div class="subtitle-div">
        <h3 class="h3-header">Gestión de Prestaciones Sociales</h3>
        <hr />
    </div>  

</div>