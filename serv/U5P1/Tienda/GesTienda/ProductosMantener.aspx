<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdm.Master" AutoEventWireup="true" CodeBehind="ProductosMantener.aspx.cs" Inherits="GesTienda.ProductosMantener" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="InfoContenido" runat="server">
    <div class="contenidotitulo-pdCliente"><h2>Mantenimiento productos</h2></div> 

    <div class="container-prodMantener">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IdProducto], [DesPro], [PrePro] FROM [PRODUCTO]"></asp:SqlDataSource>

        <asp:GridView ID="grdProductos" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IdProducto" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="50%" OnSelectedIndexChanged="Page_Load" OnPageIndexChanged="Page_Load" Height="253px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="IdProducto" HeaderText="IdProducto" ReadOnly="True" SortExpression="IdProducto" />
                <asp:BoundField DataField="DesPro" HeaderText="DesPro" SortExpression="DesPro" />
                <asp:BoundField DataField="PrePro" HeaderText="PrePro" SortExpression="PrePro" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="Primero" LastPageText="Último" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <div class="second-prodMantener">
            <asp:Label ID="lblIdProducto" runat="server" Text="IdProducto"></asp:Label>
            <asp:TextBox ID="txtIdProducto" runat="server" Enabled="false"></asp:TextBox>
            <br />
            <asp:Label ID="lblDesPro" runat="server" Text="DesPro"></asp:Label>
            <asp:TextBox ID="txtDesPro" runat="server" Enabled="false"></asp:TextBox>
            <br />
            <asp:Label ID="lblPrePro" runat="server" Text="PrePro"></asp:Label>
            <asp:TextBox ID="txtPrePro" runat="server" Text="0" Enabled="false"></asp:TextBox>
            <br />
            <asp:Label ID="lblIdUnidad" runat="server" Text="IdUnidad"></asp:Label>
            <asp:DropDownList ID="ddlIdUnidad" runat="server" DataSourceID="SqlDataSource2" DataTextField="IdUnidad" DataValueField="IdUnidad">
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblIdTipo" runat="server" Text="IdTipo"></asp:Label>
            <asp:DropDownList ID="ddlIdTipo" runat="server" DataSourceID="SqlDataSource3" DataTextField="DesTip" DataValueField="IdTipo">
            </asp:DropDownList>
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UNIDAD]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [TIPO]"></asp:SqlDataSource>
    </div>
        <div>       
        <asp:Label ID="lblResultado" runat="server"></asp:Label>
        <br />
    </div>
    <div>
        <asp:Label ID="lblMensajes" ForeColor="red" runat="server"></asp:Label>
        <br />
    </div>  
</asp:Content>
