<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpleadosCalendar.aspx.cs" Inherits="GesPresta.EmpleadosCalendar" %>

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

            <div class="container-line">
                <label>Código Empleado</label> <asp:TextBox ID="txtCodEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>

            <div class="container-line">
                <label>NIF</label>  <asp:TextBox ID="txtNifEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>

            <div class="container-line"  id="line-names">
                <label>Apellidos y Nombre </label> <asp:TextBox ID="txtNomEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
            </div>

            <div class="container-line"  id="line-adress">
                <label>Dirección </label> <asp:TextBox ID="txtDirEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
            </div>

            <div class="container-line"  id="line-city">
                <label>Ciudad </label> <asp:TextBox ID="txtCiuEmp" CssClass="txtB-empl" runat="server"></asp:TextBox> 
            </div>

            <div class="container-line"  id="line-phone">
                <label>Teléfonos </label> <asp:TextBox ID="txtTelEmp" CssClass="txtB-empl" runat="server"></asp:TextBox>
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
        <div class="calendar-div">
            <div class="container-line">
                <div class="bDay-div">
                    <label>Fecha Nacimiento <asp:TextBox ID="txtFnaEmp" OnTextChanged="txtFnaEmp_OnTextChanged"  AutoPostBack="True" CssClass="txtB-empl" runat="server"></asp:TextBox> 
                    </label>  
                </div>
                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </div>

            <div class="container-line">
                <div class="ingressDay-div">
                    <label>Fecha Ingreso </label> <asp:TextBox ID="txtFinEmp" OnTextChanged="txtFinEmp_OnTextChanged"  AutoPostBack="True" CssClass="txtB-empl" runat="server"></asp:TextBox> 
                </div>
                <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" >
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </div>
            <div class="container-line">
                <div class="seniorJob-div">
                    <label>Antiguedad:</label>
                    <asp:TextBox ID="txtAños" CssClass="txtB-empl" runat="server"></asp:TextBox> Años
                    <asp:TextBox ID="TxtMeses" CssClass="txtB-empl" runat="server"></asp:TextBox> Meses
                    <asp:TextBox ID="txtDias" CssClass="txtB-empl" runat="server"></asp:TextBox> Dias
                </div>
            </div>
        </div>
            
            

        <div class ="footer-container">
            <asp:Button ID="cmdEnviar" Text="Enviar" runat="server" OnClick="cmdEnviar_Click"/>    
            <asp:Label ID="lblError1" runat="server" BackColor="#FF0000" ForeColor="White" Text="Label" Visible="False" Width="60%"></asp:Label>
            <asp:Label ID="lblError2" runat="server" BackColor="#FF0000" ForeColor="White" Text="Label" Visible="False" Width="60%"></asp:Label>
            <asp:Label ID="lblError3" runat="server" BackColor="#FF0000" ForeColor="White" Text="Label" Visible="False" Width="60%"></asp:Label>
            <asp:Label ID="lblError4" runat="server" BackColor="#FF0000" ForeColor="White" Text="Label" Visible="False" Width="60%"></asp:Label>

        </div>
        
    </form>
</body>
</html>
