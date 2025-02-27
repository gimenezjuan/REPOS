﻿using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Linq.Expressions;
using System.Net.NetworkInformation;
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
            lblError4.Visible = false;
        }
        protected void cmdEnviar_Click(object sender, EventArgs e)
        {
            
        }

        private void CalculateSenior(DateTime dIngr, DateTime dToday)
        {
            lblError2.Visible = false;
            TimeSpan diferencia = dToday - Calendar2.SelectedDate;
            DateTime fechamin = new DateTime(1, 1, 1);

            int year = dToday.Year - dIngr.Year;
            int month = dToday.Month - dIngr.Month;
            int days = dToday.Day - dIngr.Day;

            string cadena = "";

            if (dIngr <= dToday)
            {
                txtAños.Text = ((fechamin + diferencia).Year - 1).ToString();
                TxtMeses.Text = ((fechamin + diferencia).Month - 1).ToString();
                txtDias.Text = ((fechamin + diferencia).Day).ToString();
            }
            else
            {
                cadena = cadena + "La fecha de ingreso no puede se mayor que la fecha actual" + "\n";
                lblError2.Text = cadena;
                lblError2.Visible = true;
                txtFinEmp.Text = "";
                txtAños.Text = "";
                TxtMeses.Text = "";
                txtDias.Text = "";
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

        protected void txtFnaEmp_TextChanged(object sender, EventArgs e)
        {
            string dateBday = txtFnaEmp.Text;
            string dateIngression = txtFinEmp.Text;
            DateTime dtBday;
            DateTime dtIngression;
            DateTime dtToday = System.DateTime.Now;

            var formats = new[] { "d/M/yyyy", "dd/M/yyyy", "d/MM/yyyy", "dd/MM/yyyy" };

            string cadena = "";

            DateTime.TryParseExact(dateIngression, formats, null, DateTimeStyles.None, out dtIngression);

            if (DateTime.TryParseExact(dateBday, formats, null, DateTimeStyles.None, out dtBday))
            {
                Calendar1.SelectedDate = Convert.ToDateTime(txtFnaEmp.Text);
                Calendar1.VisibleDate = Convert.ToDateTime(txtFnaEmp.Text);

                if (dtIngression != DateTime.MinValue)
                {
                    CheckDates(dtBday, dtIngression, dtToday);
                }
            }
            else
            {
                cadena = cadena + "Error de formato" + "\n";
                lblError4.Text = cadena;
                lblError4.Visible = true;
                txtFnaEmp.Text = "";
            }
        }

        protected void txtFinEmp_TextChanged(object sender, EventArgs e)
        {
            string dateBday = txtFnaEmp.Text;
            string dateIngression = txtFinEmp.Text;
            DateTime dtBday;
            DateTime dtIngression;
            DateTime dtToday = System.DateTime.Now;

            var formats = new[] { "d/M/yyyy", "dd/M/yyyy", "d/MM/yyyy", "dd/MM/yyyy" };
            
            DateTime.TryParseExact(dateBday, formats, CultureInfo.InvariantCulture, DateTimeStyles.None, out dtBday);

            string cadena = "";

            if (DateTime.TryParseExact(dateIngression, formats, null, DateTimeStyles.None, out dtIngression))
            {
                Calendar2.SelectedDate = Convert.ToDateTime(txtFinEmp.Text);
                Calendar2.VisibleDate = Convert.ToDateTime(txtFinEmp.Text);
                CheckDates(dtBday, dtIngression, dtToday);
                CalculateSenior(dtIngression, dtToday);
            }
            else
            {
                cadena = cadena + "Error de formato" + "\n";
                lblError4.Text = cadena;
                lblError4.Visible = true;
                txtFinEmp.Text = "";
                txtAños.Text = "";
                TxtMeses.Text = "";
                txtDias.Text = "";

            }
        }
    }
}