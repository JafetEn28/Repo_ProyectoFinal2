using System;
using System.Data;

namespace Proyecto_Analisis2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        private void LoadData()
        {
            // Crear un DataTable y añadir columnas
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Nombre");
            dt.Columns.Add("Estatus");
            dt.Columns.Add("Fecha");

            // Añadir filas con datos de ejemplo
            dt.Rows.Add("1", "Solicitud de Juan", "Pendiente", DateTime.Now.AddDays(-3).ToString("yyyy-MM-dd"));
            dt.Rows.Add("2", "Solicitud de María", "Completado", DateTime.Now.AddDays(-10).ToString("yyyy-MM-dd"));
            dt.Rows.Add("3", "Solicitud de Carlos", "En Proceso", DateTime.Now.AddDays(-5).ToString("yyyy-MM-dd"));
            dt.Rows.Add("4", "Solicitud de Ana", "Pendiente", DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd"));
            dt.Rows.Add("5", "Solicitud de Luis", "Completado", DateTime.Now.AddDays(-8).ToString("yyyy-MM-dd"));

            // Asignar el DataTable como origen de datos del GridView y enlazar los datos
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}