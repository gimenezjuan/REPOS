<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prestaciones1Respuesta.aspx.cs" Inherits="GesPresta.Prestaciones1Respuesta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="styles.css" />
    <link rel="stylesheet" href="cabecera.css" />
</head>
<body>
     <div class="h2-empl">
         <h1>VALORES RECIBIDOS DESDE EL FORMULARIO PRESTACIONES1.ASPX</h1>
    </div>

    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblValores" runat="server" BackColor="#C0FFFF" Text="Label" Visible="False" Width="70%"></asp:Label>
        </div>
    </form>
</body>
</html>
