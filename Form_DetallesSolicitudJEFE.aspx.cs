using System;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Analisis2
{
    public partial class Form_DetallesSolicitudJEFE : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarRequisiciones();
            }
        }

        private void CargarRequisiciones()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT RequisicionID, CompradorID, FechaCreacion, Monto, EstadoJefe, Descripcion, Justificacion, Cantidad, Justificacion_Jefe " +
                               "FROM Requisiciones WHERE EstadoJefe = 'En proceso'";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int requisicionID = Convert.ToInt32(GridView1.SelectedDataKey.Value);
            ViewState["RequisicionID"] = requisicionID;
            lblAlertas.Text = $"Requisición {requisicionID} seleccionada.";
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            CambiarEstadoRequisicion("Aprobado");
        }

        protected void btnRechazar_Click(object sender, EventArgs e)
        {
            CambiarEstadoRequisicion("Rechazado");
        }

        private void CambiarEstadoRequisicion(string nuevoEstado)
        {
            int requisicionID = Convert.ToInt32(ViewState["RequisicionID"]);
            string justificacionJefe = txtJustJefe.Text;

            // Obtener el UsuarioID del jefe desde la sesión
            int usuarioID = Convert.ToInt32(Session["UsuarioID"]);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"UPDATE Requisiciones 
                                 SET EstadoJefe = @EstadoJefe, 
                                     Justificacion_Jefe = @JustificacionJefe,
                                     AprobadorJefe = @AprobadorJefe
                                 WHERE RequisicionID = @RequisicionID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EstadoJefe", nuevoEstado);
                cmd.Parameters.AddWithValue("@JustificacionJefe", justificacionJefe);
                cmd.Parameters.AddWithValue("@AprobadorJefe", usuarioID);  // Guardamos el UsuarioID del jefe
                cmd.Parameters.AddWithValue("@RequisicionID", requisicionID);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblAlertas.Text = $"Requisición {requisicionID} actualizada a '{nuevoEstado}' con la justificación del jefe.";
            txtJustJefe.Text = "";
            CargarRequisiciones();
        }
    }
}
