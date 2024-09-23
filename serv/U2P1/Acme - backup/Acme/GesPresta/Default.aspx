﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GesPresta.Default" %>

<%@ Register Src="~/Cabecera.ascx" TagPrefix="uc1" TagName="Cabecera" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="styles.css">

</head> 
<body>
    <form id="form1" runat="server">
        <uc1:Cabecera runat="server" id="Cabecera" />
        <p>La corporación ACME está comprometida con sus empleados. Para ello ha establecido una serie de prestaciones que pueden utilizar sus empleados para obtener ayudas sociales asociados a diversos gastos de tipo familiar, médico, etc.</p>
        <p>Esta aplicación a través de Web permite realizar todas las tareas de gestión relacionadas con la prestación de ayudas a los empleados.</p>
        <p> Para cualquier duda o consulta puede contactar con el Departamento de Ayuda Social: <a href="mailto:ayuda.social@acme.com">ayuda.social@acme.com</a></p>
        <div>
        </div>
    </form>
</body>
</html>
