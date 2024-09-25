using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
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
            DateTime dtToday = System.DateTime.Now;
            DateTime dtBday = Calendar1.SelectedDate;
            DateTime dtIngression = Calendar2.SelectedDate;
            txtFnaEmp.Text = Calendar1.SelectedDate.ToShortDateString();

            if (dtIngression.Date > dtBday.Date)
            {
                cadena = cadena + "La fecha de ingreso no puede se menor que la fecha del cumpleaños" + "\n";
                lblError1.Text = cadena;
                lblError1.Visible = true;
            }
            if (dtIngression.Date > dtToday.Date)
            {
                cadena = cadena + "La fecha de ingreso no puede se mayor que la fecha actual" + "\n";
                lblError2.Text = cadena;
                lblError2.Visible = true;
            }
            if (dtBday.Date > dtToday.Date)
            {
                cadena = cadena + "La fecha del cumpleaños no puede se mayor que la fecha actual" + "\n";
                lblError3.Text = cadena;
                lblError3.Visible = true;
            }

        }
    }
}