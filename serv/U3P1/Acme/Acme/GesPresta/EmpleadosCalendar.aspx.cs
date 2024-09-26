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
            lblError1.Visible = false;
            lblError2.Visible = false;
            lblError3.Visible = false;
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
        private void CalculateSenior(DateTime dIngr, DateTime dToday)
        {
            TimeSpan diferencia = dToday - Calendar2.SelectedDate;
            DateTime fechamin = new DateTime(1, 1, 1);

            int year = dToday.Year - dIngr.Year;
            int month = dToday.Month - dIngr.Month;
            int days = dToday.Day - dIngr.Day;

            if (dIngr > dToday && days < 0)
            {
                lblError2.Visible = true;
                txtFinEmp.Text = "";
                txtAños.Text = "";
                TxtMeses.Text = "";
                txtDias.Text = "";
            }
            else
            {
                txtAños.Text = ((fechamin + diferencia).Year - 1).ToString();
                TxtMeses.Text = ((fechamin + diferencia).Month - 1).ToString();
                txtDias.Text = ((fechamin + diferencia).Day).ToString();
            }

        }
        private void CheckDates(DateTime dBday, DateTime dIngr, DateTime dToday)
        {
            string cadena = "";

            if (dIngr != DateTime.MinValue)
            {
                if (dIngr < dBday)
                {
                    cadena = cadena + "La fecha de ingreso no puede ser menor que la fecha del cumpleaños" + "\n";
                    lblError1.Text = cadena;
                    lblError1.Visible = true;
                }
            }
            if (dIngr > dToday)
            {
                cadena = cadena + "La fecha de ingreso no puede se mayor que la fecha actual" + "\n";
                lblError2.Text = cadena;
                lblError2.Visible = true;
            }
            if (dBday > dToday)
            {
                cadena = cadena + "La fecha de cumpleaños no puede se mayor que la fecha actual" + "\n";
                lblError3.Text = cadena;
                lblError3.Visible = true;
            }
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtFnaEmp.Text = Calendar1.SelectedDate.ToShortDateString();
            DateTime dtToday = System.DateTime.Now;
            DateTime dtIngression = Calendar2.SelectedDate;
            DateTime dtBday = Calendar1.SelectedDate;
            CheckDates(dtBday, dtIngression, dtToday);
       
        }
        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            txtFinEmp.Text = Calendar2.SelectedDate.ToShortDateString();
            DateTime dtToday = System.DateTime.Now;
            DateTime dtBday = Calendar1.SelectedDate;
            DateTime dtIngression = Calendar2.SelectedDate;

            CheckDates(dtBday, dtIngression, dtToday);
            CalculateSenior(dtIngression, dtToday);
        }
    }
}