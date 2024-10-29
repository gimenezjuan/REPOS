<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="GesTienda.Registrarse" %>

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
    </div>
   <div>
       <h2 class="h2-title">GesTienda</h2>
   </div>
  <div class="divLogin" style="vertical-align: middle">
      
     <div class="empl-container">

    <div class="container-line">
        <label>Correo Eléctronico</label> <asp:TextBox ID="txtCorCli" CssClass="txtB-empl" runat="server"></asp:TextBox>
    </div>

    <div class="container-line">
        <label>Contraseña</label>  <asp:TextBox ID="txtPassword1" CssClass="txtB-empl" runat="server" TextMode="Password"></asp:TextBox>
    </div>

    <div class="container-line"  id="line-names">
        <label>Introduzca nuevamente la contraseña</label> <asp:TextBox ID="txtPassword2" CssClass="txtB-empl" runat="server" TextMode="Password"></asp:TextBox> 
    </div>

    <div class="container-line"  id="line-adress">
        <label>NIF/NIE/CIF</label> <asp:TextBox ID="txtIdCliente" CssClass="txtB-empl" runat="server"></asp:TextBox>
    </div>

    <div class="container-line"  id="line-city">
        <label>Nombre/Razón Social </label> <asp:TextBox ID="txtNomCli" CssClass="txtB-empl" runat="server"></asp:TextBox> 
    </div>

    <div class="container-line"  id="line-phone">
        <label>Dirección </label> <asp:TextBox ID="txtDirCli" CssClass="txtB-empl" runat="server"></asp:TextBox>
    </div>

    <div class="container-line">
        <label>Población </label> <asp:TextBox ID="txtPobCli" CssClass="txtB-empl" runat="server"></asp:TextBox> 
    </div>

    <div class="container-line">
        <label>Codigo Postal </label> <asp:TextBox ID="txtCpoCli" CssClass="txtB-empl" runat="server"></asp:TextBox> 
    </div>
    <div class="container-line">
        <label>Teléfono </label> <asp:TextBox ID="txtTelCli" CssClass="txtB-empl" runat="server"></asp:TextBox> 
   </div>
  </div>
</div>
    <div class="hyperlinks">
        <asp:Button ID="btnInsertar" Text="Enviar" runat="server" OnClick="btnInsertar_Click"/> 
            <br />
        <asp:LinkButton  runat="server" PostBackUrl="~/Default.aspx">Ir al inicio</asp:LinkButton>
    </div>   
  <div class="lblMensajes">
  <asp:Label ID="lblMensajes" style="color:Red" runat="server"></asp:Label>
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
