<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="MPEmpleados.aspx.cs" Inherits="GesPresta.MPEmpleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="styles.css"/>
    <link rel="stylesheet" href="cabecera.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="h2-empl">
            <h2>DATOS DE LOS EMPLEADOS</h2>
        </div>
        <div class="empl-container">
            <!-- CODIGO EMPLEADO -->
            <div class="container-line">
                <label>Código Empleado</label> 
                <asp:TextBox ID="txtCodEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>
            <!-- NIF -->
            <div class="container-line">
                <label>NIF</label>  
                <asp:TextBox ID="txtNifEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>
            <!-- Nombre -->
            <div class="container-line"  id="line-names">
                <label>Apellidos y Nombre </label> 
                <asp:TextBox ID="txtNomEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
            </div>
            <!-- Dirección -->
            <div class="container-line"  id="line-adress">
                <label>Dirección </label> 
                <asp:TextBox ID="txtDirEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>
            <!-- Ciudad -->
            <div class="container-line"  id="line-city">
                <label>Ciudad </label> 
                <asp:TextBox ID="txtCiuEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
            </div>
            <!-- Tel -->
            <div class="container-line"  id="line-phone">
                <label>Teléfonos </label> 
                <asp:TextBox ID="txtTelEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>
            <!-- Fecha Nacimiento -->
            <div class="container-line">
                <label>Fecha Nacimiento </label> 
                <asp:TextBox ID="txtFnaEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
            </div>
            <!-- Fecha Ingreso -->
            <div class="container-line">
                <label>Fecha Ingreso </label>
                <asp:TextBox ID="txtFinEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
            </div>
            <!-- Genero -->
            <div class="button-gender-empl">
                <label>Sexo</label>
                <asp:RadioButtonList ID="rblSexEmp" RepeatDirection="Horizontal" runat= "server"> 
                    <asp:ListItem Selected="True" Value="H">Hombre</asp:ListItem> <asp:ListItem Value="M">Mujer</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <!-- Departamento -->
            <div class="button-department-empl">
                <label>Departamento</label>
                <asp:DropDownList ID="ddlDepEmp" runat="server">
                    <asp:ListItem Selected="True" Value="Investigación"> Investigación </asp:ListItem>
                    <asp:ListItem Value="Desarrollo"> Desarrollo </asp:ListItem>
                    <asp:ListItem Value="Innovación"> Innovación </asp:ListItem>
                    <asp:ListItem Value="Administración"> Administración </asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <asp:Button ID="cmdEnviar" Text="Enviar" runat="server"/>    
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="red"/>
</asp:Content>
