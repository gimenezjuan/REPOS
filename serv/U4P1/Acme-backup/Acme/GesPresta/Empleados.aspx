<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="GesPresta.Empleados"%>

<%@ Register Src="~/Cabecera.ascx" TagPrefix="uc1" TagName="Cabecera" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="cabecera.css">
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Cabecera runat="server" ID="Cabecera" />
        <div class="h2-empl">
            <h2>DATOS DE LOS EMPLEADOS</h2>
        </div>
        <div class="empl-container">
            <%-- CODIGO EMPLEADO --%>
            <div class="container-line">
                <label>Código Empleado</label> 
                <asp:TextBox ID="txtCodEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqdtxtCodEmp" runat="server" ErrorMessage="El Código Empleado es obligatorio" ControlToValidate="txtCodEmp"/>
            </div>
            <%-- NIF --%>
            <div class="container-line">
                <label>NIF</label>  
                <asp:TextBox ID="txtNifEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqdtxtNifEmp" runat="server" ErrorMessage="El NIF es obligatorio" ControlToValidate="txtNifEmp"/>
            </div>
            <%-- Nombre --%>
            <div class="container-line"  id="line-names">
                <label>Apellidos y Nombre </label> 
                <asp:TextBox ID="txtNomEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="rqdtxtNomEmp" runat="server" ErrorMessage="El Apeillido y nombre son obligatorios" ControlToValidate="txtNomEmp"/>
            </div>
            <%-- Dirección --%>
            <div class="container-line"  id="line-adress">
                <label>Dirección </label> 
                <asp:TextBox ID="txtDirEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>
            <%-- Ciudad --%>
            <div class="container-line"  id="line-city">
                <label>Ciudad </label> 
                <asp:TextBox ID="txtCiuEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
            </div>
            <%-- Tel --%>
            <div class="container-line"  id="line-phone">
                <label>Teléfonos </label> 
                <asp:TextBox ID="txtTelEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqdtxtTelEmp" runat="server" ErrorMessage="El teléfono es obligatorio" ControlToValidate="txtTelEmp"/>
            </div>
            <%-- Fecha Nacimiento --%>
            <div class="container-line">
                <label>Fecha Nacimiento </label> 
                <asp:TextBox ID="txtFnaEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="rqdtxtFnaEmp" runat="server" ErrorMessage="La fecha de naciemiento es obligatoria" ControlToValidate="txtFnaEmp"/>
            </div>
            <%-- Fecha Ingreso --%>
            <div class="container-line">
                <label>Fecha Ingreso </label>
                <asp:TextBox ID="txtFinEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="rqdtxtFinEmp" runat="server" ErrorMessage="La fecha de ingreso es obligatorio" ControlToValidate="txtFinEmp"/>
            </div>

            <div class="button-gender-empl">
             <label>Sexo</label>
                <asp:RadioButtonList ID="rblSexEmp" RepeatDirection="Horizontal" runat= "server"> 
                    <asp:ListItem Selected="True" Value="H">Hombre</asp:ListItem> <asp:ListItem Value="M">Mujer</asp:ListItem>
                </asp:RadioButtonList>
            </div>

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
    </form>
</body>
</html>
