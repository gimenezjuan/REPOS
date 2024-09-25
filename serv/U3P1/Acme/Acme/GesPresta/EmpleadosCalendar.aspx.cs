using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GesPresta
{
    public partial class EmpleadosCalendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void cmdEnviar_Click(object sender, EventArgs e)
        {
            
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string cadena = "";

            if (true)
            {
                
            }
            cadena = cadena + "Código: " + Request.Form["txtCodPre"] + "<br/>";
            cadena = cadena + "Descripción: " + Request.Form["txtDesPre"] + "<br/>";
            cadena = cadena + "Importe: " + Request.Form["txtImpPre"] + "<br/>";
            cadena = cadena + "Porcentaje: " + Request.Form["txtPorPre"] + "<br/>";
            cadena = cadena + "Tipo de Prestación: " + Request.Form["ddlTipPre"] + "<br/>";
            lblValores.Text = cadena;
            lblValores.Visible = true;
        }
    }
}