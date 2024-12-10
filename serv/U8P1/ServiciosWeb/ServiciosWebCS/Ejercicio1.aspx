<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ejercicio1.aspx.cs" Inherits="ServiciosWebCS.Ejercicio1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="styles.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="ejercio1" style="text-align: center">
            <h3>CONSUMIR UN SERVICIO WEB YA EXISTENTE</h3>
            <h2>Titulaciones Oficiales en la Universidad de Alicante</h2>
            <div>
            <label>Curso acádemico (fomarto aaaa-aa)<asp:TextBox ID="txtCurso" Width="211px" runat="server"></asp:TextBox>&nbsp; </label><asp:Button ID="btnObtenerInformacion" runat="server" Text="Obtener Información" OnClick="btnObtenerInformacion_Click" />
            </div>
                <asp:Label ID="lblResultado" runat="server"></asp:Label>
        </div>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
