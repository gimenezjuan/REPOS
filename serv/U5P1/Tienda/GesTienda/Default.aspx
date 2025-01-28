<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GesTienda.Default" %>
<%@ OutputCache Duration="1" VaryByParam="None" %> 
    
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="~/Estilos/HojaEstilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div id="cabecera">
            <div id="cabecera1">
                <br />
                comerciodaw.com &nbsp;
            </div>
            <div id="cabecera2">
                <br />
                &nbsp;&nbsp;TIENDA ONLINE - SHOPPING DAW<br />
                <br />
        </div>
         <div>
             <h2 class="h2-title">GesTienda</h2>
         </div>
        <div class="divLogin" style="vertical-align: middle">
            <asp:Login ID="Login1" runat="server" CssClass="auto-style3" OnAuthenticate="Login1_Authenticate">
                <LayoutTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0">
                                    <tr>
                                        <td align="center" id="iniciarSesionText" colspan="2"><b>Iniciar sesión</b></td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;<asp:Button runat="server" CommandName="Login" Text="Inicio de sesi&#243;n" ValidationGroup="Login1" ID="LoginButton"></asp:Button>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
        </div>
        <div class="lblMensajes">
            <asp:Label ID="lblMensajes" style="color:Red" runat="server"></asp:Label>
            <asp:LinkButton  runat="server" PostBackUrl="~/Registrarse.aspx">Registrarse</asp:LinkButton>
        </div>
            <div id="pie">
            <br />
            <br />
            © Desarrollo de Aplicaciones Web interactivas con Acceso a Datos
            <br />
            IES Mare Nostrum (Alicante)
        </div>
    </form>
</body>
</html>
