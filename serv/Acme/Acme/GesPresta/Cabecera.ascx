﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cabecera.ascx.cs" Inherits="GesPresta.Cabecera" %>
<link rel="stylesheet" href="styles.css">
<div class="header-div">
    <div class="hyperlink-div">
        <asp:LinkButton class="hyperlink-header" id="hyperlink1" OnClick="#" runat="server">Inicio</asp:LinkButton>
        <asp:LinkButton class="hyperlink-header" id="hyperlink2" OnClick="#" runat="server">Empleados</asp:LinkButton>
        <asp:LinkButton class="hyperlink-header" id="hyperlink3" OnClick="#" runat="server">Prestaciones</asp:LinkButton>
        <hr />
    </div>
    <div class="title-div">
        <h1>ACME INNOVACIÓN, S.FIG</h1>
        <hr />
    </div>
    <div class="subtitle-div">
        <p>Gestión de Prestaciones Sociales</p>
        <hr />
    </div>
</div>