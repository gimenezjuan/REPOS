<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlError.aspx.cs" Inherits="GesTienda.ControlError" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="~/Estilos/HojaEstilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="errorContainer">
            <section class="errorSectionUno">
                <h2 class="h2-title">Aplicacion Web Gestienda</h2>
                <h3>Error de ejecución</h3>
            </section>
            <br />
            <section class="errorSectionDos">
                <p>Error Asp.NET:</p>
                <asp:Label ID="lblErrorASP" ForeColor="red" runat="server"></asp:Label>
                <p>Error ADO.NET:</p>
                <asp:Label ID="lblErrorADO" ForeColor="red" runat="server"></asp:Label>
            </section>
                <br />
                <br />
        </div>
    </form>
</body>
</html>
