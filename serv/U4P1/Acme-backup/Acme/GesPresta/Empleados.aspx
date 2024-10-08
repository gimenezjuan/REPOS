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
                <%-- CODIGO REGEX --%>
               <asp:RegularExpressionValidator ID="regtxtCodEmp" ControlToValidate="txtCodEmp" runat="server" ErrorMessage="El formato de los datos a introducir debe ser: una letra y 5 dígitos."  ForeColor="green" ValidationExpression="\w\d{5}"></asp:RegularExpressionValidator>
                <%-- REQUIRIMIENTO VALIDACIÓN --%>
                <asp:RequiredFieldValidator ID="rqdtxtCodEmp" runat="server" ErrorMessage="El Código Empleado es obligatorio" ControlToValidate="txtCodEmp" Text="*" ForeColor="red"/>
            </div>
            <%-- NIF --%>
            <div class="container-line">
                <label>NIF</label>  
                <asp:TextBox ID="txtNifEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
                 <%-- CODIGO REGEX --%>
                <asp:RegularExpressionValidator ID="regtxtNifEmp" ControlToValidate="txtNifEmp" runat="server" ErrorMessage="El formato de los datos a introducir debe ser: 8 dígitos, un guion y una letra."  ForeColor="green" ValidationExpression="\d{8}-\w"></asp:RegularExpressionValidator>
                <%-- REQUIRIMIENTO VALIDACIÓN --%>
                <asp:RequiredFieldValidator ID="rqdtxtNifEmp" runat="server" ErrorMessage="El NIF es obligatorio" ControlToValidate="txtNifEmp" Text="*" ForeColor="red"/>
            </div>
            <%-- Nombre --%>
            <div class="container-line"  id="line-names">
                <label>Apellidos y Nombre </label> 
                <asp:TextBox ID="txtNomEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="rqdtxtNomEmp" runat="server" ErrorMessage="El Apeillido y nombre son obligatorios" ControlToValidate="txtNomEmp" Text="*" ForeColor="red"/>
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
                <asp:RequiredFieldValidator ID="rqdtxtTelEmp" runat="server" ErrorMessage="El teléfono es obligatorio" ControlToValidate="txtTelEmp" Text="*" ForeColor="red"/>
            </div>
            <%-- Fecha Nacimiento --%>
            <div class="container-line">
                <label>Fecha Nacimiento </label> 
                <asp:TextBox ID="txtFnaEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
                 <%-- CODIGO REGEX --%>
                <asp:RegularExpressionValidator ID="regtxtFnaEmp" ControlToValidate="txtFnaEmp" runat="server" ErrorMessage="El formato de los datos a introducir debe ser: Formato de fecha dd/mm/aaaa."  ForeColor="green" ValidationExpression="\d\d\/\d\d\/\d\d\d\d"></asp:RegularExpressionValidator>
                <%-- Validación de comparación --%>
                <asp:CompareValidator ID="cmptxtFnaEmp" runat="server" ErrorMessage="La Fecha de Ingreso del Empleado debe ser mayor que la Fecha de Nacimiento" ControlToValidate="txtFnaEmp" ControlToCompare="txtFinEmp"  Type="Date" Operator="LessThan" ForeColor="red"></asp:CompareValidator>
                <%-- Validación de requirimiento --%>
                <asp:RequiredFieldValidator ID="rqdtxtFnaEmp" runat="server" ErrorMessage="La fecha de naciemiento es obligatoria" ControlToValidate="txtFnaEmp" Text="*" ForeColor="red"/>
            </div>
            <%-- Fecha Ingreso --%>
            <div class="container-line">
                <label>Fecha Ingreso </label>
                <asp:TextBox ID="txtFinEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
                 <%-- CODIGO REGEX --%>
                <asp:RegularExpressionValidator ID="regtxtFinEmp" ControlToValidate="txtFinEmp" runat="server" ErrorMessage="El formato de los datos a introducir debe ser:Formato de fecha dd/mm/aaaa."  ForeColor="green" ValidationExpression="\d\d\/\d\d\/\d\d\d\d"></asp:RegularExpressionValidator>
                <%-- Validación de requirimiento --%>
                <asp:RequiredFieldValidator ID="rqdtxtFinEmp" runat="server" ErrorMessage="La fecha de ingreso es obligatorio" ControlToValidate="txtFinEmp" Text="*" ForeColor="red"/>
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
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="red"/>
    </form>
</body>
</html>
