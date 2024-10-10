<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prestaciones.aspx.cs" Inherits="GesPresta.Prestaciones1" %>

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
            <h2>DATOS DE LAS PRESTACIONES</h2>
        </div>
            <div class="pres-container">
                <!-- COD.PREST -->
                <div class="container-line">
                    <label>Código Prestación</label> <asp:TextBox ID="txtCodPre" CssClass="txtB-empl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqdtxtCodPre" runat="server" ErrorMessage="El Código Prestación es obligatorio" ControlToValidate="txtCodPre"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regtxtCodPre" ControlToValidate="txtCodPre" runat="server" ErrorMessage="El formato de los datos a introducir debe ser: 3 dígitos, un guión, 3 dígitos, un guion y, 3 dígitos"  ForeColor="green" ValidationExpression="\d{3}-\d{3}-\d{3}"></asp:RegularExpressionValidator>
                </div>
                <!-- DRESCRIPCION -->
                <div class="container-line">
                    <label>Descripción</label> <asp:TextBox ID="txtDesPre" CssClass="txtB-empl" runat="server"></asp:TextBox>
                </div>
                <!-- IMPORTE FIJO -->
                <div class="container-line">
                    <label>Importe Fijo</label> <asp:TextBox ID="txtImpPre" CssClass="txtB-empl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqdtxtImpPre" runat="server" ErrorMessage="El Importe Fijo es obligatorio" ControlToValidate="txtImpPre"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rngtxtImpPre" runat="server" ErrorMessage="El valor introducido debe estar comprendido entre el 0,00 y el 500,00" ControlToValidate="txtImpPre"  MinimumValue="0,00" MaximumValue="500,00" ForeColor="red" Type="Double"></asp:RangeValidator>
                </div>
                <!-- PORCENTAJE IMPORTE -->
                <div class="container-line">
                    <label>Porcentaje de Importe</label> <asp:TextBox ID="txtPorPre" CssClass="txtB-empl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqdtxtPorPre" runat="server" ErrorMessage="El Importe Fijo es obligatorio" ControlToValidate="txtPorPre"></asp:RequiredFieldValidator>

                    <asp:RangeValidator ID="rngtxtPorPre" runat="server" ErrorMessage="El valor introducido debe estar comprendido entre el 0,00 y el 15,00 %" ControlToValidate="txtPorPre" MinimumValue="0,00" MaximumValue="15,00" ForeColor="red" Type="Double"></asp:RangeValidator>
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
    </form>
</body>
</html>
