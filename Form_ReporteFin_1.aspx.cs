using System;
using System.Collections.Generic;

namespace Proyecto_Analisis2
{
    public partial class Form_HistorialFinanciero1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Datos de ejemplo
                var requisiciones = new List<Requisicion>
                {
                    new Requisicion { Usuario = "1", IdRequisicion = "REQ001", Descripcion = "Compra de materiales", Cantidad = 50, Costo = 50000, ComentarioJefe = "Todo en orden", Estado = "Aprobada" },
                    new Requisicion { Usuario = "2", IdRequisicion = "REQ002", Descripcion = "Compra de equipos", Cantidad = 20, Costo = 40000, ComentarioJefe = "Requiere revisión", Estado = "En Proceso" },
                    new Requisicion { Usuario = "3", IdRequisicion = "REQ003", Descripcion = "Reparación de infraestructura", Cantidad = 10, Costo = 30000, ComentarioJefe = "Rechazada por presupuesto", Estado = "Rechazada" }
                };

                // Asignar los datos al GridView
                GridViewRequisiciones.DataSource = requisiciones;
                GridViewRequisiciones.DataBind();
            }
        }
    }

    // Clase para representar los datos
    public class Requisicion
    {
        public string Usuario { get; set; }
        public string IdRequisicion { get; set; }  // Cambié 'Requisicion' por 'IdRequisicion'
        public string Descripcion { get; set; }
        public int Cantidad { get; set; }
        public decimal Costo { get; set; }
        public string ComentarioJefe { get; set; }
        public string Estado { get; set; }
    }
}
