<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="MPPrestaciones.aspx.cs" Inherits="GesPresta.MPPrestaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="styles.css"/>
    <link rel="stylesheet" href="cabecera.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="h2-empl">
         <h2>DATOS DE LAS PRESTACIONES</h2>
     </div>
         <div class="pres-container">
             <!-- COD.PREST -->
             <div class="container-line">
                 <label>Código Prestación</label> <asp:TextBox ID="txtCodPre" CssClass="txtB-empl" runat="server"></asp:TextBox>
             </div>
             <!-- DRESCRIPCION -->
             <div class="container-line">
                 <label>Descripción</label> <asp:TextBox ID="txtDesPre" CssClass="txtB-empl" runat="server"></asp:TextBox>
             </div>
             <!-- IMPORTE FIJO -->
             <div class="container-line">
                 <label>Importe Fijo</label> <asp:TextBox ID="txtImpPre" CssClass="txtB-empl" runat="server"></asp:TextBox>
             </div>
             <!-- PORCENTAJE IMPORTE -->
             <div class="container-line">
                 <label>Porcentaje de Importe</label> <asp:TextBox ID="txtPorPre" CssClass="txtB-empl" runat="server"></asp:TextBox>
             </div>
             <!-- TIPO PRESTACION -->
             <div class="button-department-pres">
             <label>Tipo de prestación</label>
             <asp:DropDownList ID="ddlTipPre" runat="server">
                 <asp:ListItem Value="Dentaria"> Dentaria </asp:ListItem>
                 <asp:ListItem Value="Familiar"> Familiar </asp:ListItem>
                 <asp:ListItem Selected="True" Value="Ocular"> Ocular </asp:ListItem>
                 <asp:ListItem Value="Otras"> Otras </asp:ListItem>
             </asp:DropDownList>
         </div>
     </div>
     <asp:Button ID="cmdEnviar" Text="Enviar" runat="server"/> 
</asp:Content>
