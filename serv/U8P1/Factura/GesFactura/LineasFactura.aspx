<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LineasFactura.aspx.cs" Inherits="GesFactura.LineasFactura_aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="~/HojaEstilo.css" rel="stylesheet" type="text/css" />
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h3>Uso de Servicio Web - Cálculos factura de un artículo</h3>
            <div class="main" >
                <div class="auto-style1">
                <label>Cantidad</label>
                   <br />
                <label>Precio</label>
                   <br />
                <label>Descuento (%)</label>
                   <br />
                <label>Tipo de Iva (%)</label>
                </div>

                <div class="inputs" >
                <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
                    <br />
                <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
                    <br />
                <asp:TextBox ID="txtDescuento" runat="server"></asp:TextBox>
                    <br />
                <asp:TextBox ID="txtTipoIVA" runat="server"></asp:TextBox>
                </div>
            </div>
            <br /><br />
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />
            <br /><br /><br /><br />
            <div class="second-container">
                <label>Resultado de los cálculos:</label>
                 <br /><br />
                <div class="labels-titulos-mensajes">
                    <br />
                    <div>
                        <label><strong>Bruto</strong></label>
                        <br />
                        <asp:Label ID="lblBruto" runat="server" Text=""></asp:Label>
                   </div>
                    <br />

                    <div>
                        <label><strong>Descuento</strong></label>
                        <br />
                         <asp:Label ID="lblDescuento" runat="server" Text=""></asp:Label>
                    </div>
                    <br />
                    
                    <div class="auto-style1">
                        <label><strong>Base Imponible</strong></label>
                        <br />
                        <asp:Label ID="lblBaseImponible" runat="server" Text=""></asp:Label>
                    </div>
                    <br />

                    <div>
                        <label><strong>IVA</strong></label>
                        <br />
                        <asp:Label ID="lblIva" runat="server" Text=""></asp:Label>
                    </div>
                    <br />

                     <div>
                        <label><strong>Total</strong></label>
                        <br />
                        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
