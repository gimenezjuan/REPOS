using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text.RegularExpressions;
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
        private bool CheckTimes(DateTime date)
        {
            string validateDate = @"^(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])/\d{4}$";

            Regex regex = new Regex(validateDate);

            if (!regex.IsMatch(validateDate))
            {
                return false;
            }

            return true;
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtFnaEmp.Text = Calendar1.SelectedDate.ToShortDateString();
            DateTime dtToday = System.DateTime.Now;
            DateTime dtBday = Calendar1.SelectedDate;

            string cadena = "";

            if (dtBday.Date > dtToday.Date)
            {
                cadena = cadena + "La fecha de cumpleaños no puede se mayor que la fecha actual" + "\n";
                lblError1.Text = cadena;
                lblError1.Visible = true;
            }
            else
            {
                lblError1.Visible = false;
            }

        }
        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            txtFinEmp.Text = Calendar2.SelectedDate.ToShortDateString();
            DateTime dtIngression = Calendar2.SelectedDate;
            DateTime dtToday = System.DateTime.Now;
            DateTime dtBday = Calendar1.SelectedDate;

            int year = dtToday.Year - dtIngression.Year;
            int month = dtToday.Month - dtIngression.Month;
            int days = dtToday.Day - dtIngression.Day;

            if (days < 0)
            {
                month--;
                days += DateTime.DaysInMonth(dtIngression.Year, dtIngression.Month);  
            }

            if (month < 0)
            {
                year--;
                month += 12; 
            }

            txtAños.Text = year.ToString();
            TxtMeses.Text = month.ToString();
            txtDias.Text = days.ToString();

            string cadena = "";

            if (dtIngression.Date > dtToday.Date)
            {
                cadena = cadena + "La fecha de ingreso no puede ser mayor que la fecha actual" + "\n";
                lblError2.Text = cadena;
                lblError2.Visible = true;
            }
            else
            {
                lblError2.Visible = false;
            }

            if (dtIngression.Date < dtBday.Date)
            {
                cadena = cadena + "La fecha de ingreso no puede ser menor que la fecha del cumpleaños" + "\n";
                lblError3.Text = cadena;
                lblError3.Visible = true;
            }
            else
            {
                lblError3.Visible = false;
            }

        }
    }
}