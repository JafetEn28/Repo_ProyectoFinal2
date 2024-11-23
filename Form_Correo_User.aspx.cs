using System;
using System.Collections.Generic;
using System.Web.UI;

namespace Proyecto_Analisis2
{
    public partial class Form_Correo_User : Page
    {
        // Definimos el modelo de Correo
        public class Correo
        {
            public string Asunto { get; set; }
            public string Remitente { get; set; }
            public DateTime Fecha { get; set; }
            public string Cuerpo { get; set; }  // Esta propiedad debe existir
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Simulamos una lista de correos electrónicos para mostrar
                List<Correo> correos = new List<Correo>
                {
                    new Correo { Asunto = "Reunión de equipo", Remitente = "juan@empresa.com", Fecha = DateTime.Now.AddDays(-1), Cuerpo = "Detalles sobre la reunión del equipo." },
                    new Correo { Asunto = "Informe de proyecto", Remitente = "ana@empresa.com", Fecha = DateTime.Now.AddDays(-2), Cuerpo = "Informe detallado del proyecto." },
                    new Correo { Asunto = "Actualización de sistema", Remitente = "soporte@empresa.com", Fecha = DateTime.Now.AddDays(-3), Cuerpo = "Actualización sobre el sistema de soporte." }
                };

                // Asignamos la lista al GridView
                gvCorreos.DataSource = correos;
                gvCorreos.DataBind();
            }
        }

        // Opcional: Puedes manejar eventos cuando se cargan los datos de la fila, por ejemplo, para formatear la fecha
        protected void gvCorreos_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
            {
                // Formatear la fecha en un formato legible
                e.Row.Cells[2].Text = DateTime.Parse(e.Row.Cells[2].Text).ToString("dd/MM/yyyy");
            }
        }
    }
}
