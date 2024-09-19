<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="GesPresta.Empleados" %>

<%@ Register Src="~/Cabecera.ascx" TagPrefix="uc1" TagName="Cabecera" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Cabecera runat="server" ID="Cabecera" />
        <div class="h2-empl">
            <h2>DATOS DE LOS EMPLEADOS</h2>
        </div>
        <div class="empl-container">

            <div class="container-line">
                <label>Código Empleado</label> <asp:TextBox CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>

            <div class="container-line">
                <label>NIF</label>  <asp:TextBox CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>

            <div class="container-line"  id="line-names">
                <label>Apellidos y Nombre </label> <asp:TextBox CssClass="txtB-empl" runat="server"></asp:TextBox> 
            </div>

            <div class="container-line"  id="line-adress">
                <label>Dirección </label> <asp:TextBox CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>

            <div class="container-line"  id="line-city">
                <label>Ciudad </label> <asp:TextBox CssClass="txtB-empl" runat="server"></asp:TextBox> 
            </div>

            <div class="container-line"  id="line-phone">
                <label>Teléfonos </label> <asp:TextBox CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>

            <div class="container-line">
                <label>Fecha Nacimiento </label> <asp:TextBox CssClass="txtB-empl" runat="server"></asp:TextBox> 
            </div>

            <div class="container-line">
                <label>Fecha Ingreso </label> <asp:TextBox CssClass="txtB-empl" runat="server"></asp:TextBox> 
            </div>

            <div class="button-gender-empl">
             <label>Sexo</label>
                <asp:RadioButtonList  runat= "server"> 
                    <asp:ListItem>Hombre</asp:ListItem><asp:ListItem>Mujer</asp:ListItem>

                </asp:RadioButtonList>
            </div>

            <div class="button-department-empl">
                <label>Departamento</label>
                <asp:DropDownList runat="server">
                    <asp:ListItem Selected="True" Value="Investigación"> Investigación </asp:ListItem>
                    <asp:ListItem Selected="False" Value="Lorem Ipsum"> Lorem Ipsum </asp:ListItem>
                </asp:DropDownList>
            </div>

        </div>

        <asp:Button id="Button1" Text="Enviar" runat="server"/>    
    </form>
</body>
</html>
