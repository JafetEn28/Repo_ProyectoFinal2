using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Analisis2
{
    public partial class Form_ReporteFin_2 : System.Web.UI.Page
    { 
        private string connectionString = "Data Source=ISAAC;Initial Catalog=Proyecto_Analisis_Diseños;Integrated Security=False;User ID=sa; Password=Lm15ty87";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarRequisiciones();
            }
        }
        private void CargarRequisiciones(string estado = null)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT RequisicionID, FechaCreacion, Monto, Estado, Descripcion, Justificacion, Cantidad  " +
                               "FROM Requisiciones WHERE Monto BETWEEN 100001 AND 1000000";
                if (!string.IsNullOrEmpty(estado))
                {
                    query += " WHERE Estado = @Estado";
                }

                SqlCommand cmd = new SqlCommand(query, conn);

                if (!string.IsNullOrEmpty(estado))
                {
                    cmd.Parameters.AddWithValue("@Estado", estado);
                }

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                GridViewRequisiciones.DataSource = dt;
                GridViewRequisiciones.DataBind();
            }
        }
        protected void GridViewRequisiciones_SelectedIndexChanged(object sender, EventArgs e)
        {
       // Obtener el índice de la fila seleccionada
            int index = GridViewRequisiciones.SelectedIndex;

            // Obtener datos de una celda específica
            string requisicionID = GridViewRequisiciones.SelectedRow.Cells[1].Text; 

            // Mostrar el dato seleccionado (ejemplo)
            Response.Write($"Fila seleccionada: Requisición ID = {requisicionID}");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CargarRequisiciones();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            CargarRequisiciones("Aprobada");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            CargarRequisiciones("En proceso");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            CargarRequisiciones("Rechazada");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            // Verifica si hay una fila seleccionada
            if (GridViewRequisiciones.SelectedIndex >= 0)
            {
                // Obtén el ID de la requisición de la fila seleccionada
                int requisicionID = Convert.ToInt32(GridViewRequisiciones.SelectedRow.Cells[1].Text);

                // Actualiza el estado en la base de datos
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "UPDATE Requisiciones SET Estado = @Estado WHERE RequisicionID = @RequisicionID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Estado", "Rechazado");
                    cmd.Parameters.AddWithValue("@RequisicionID", requisicionID);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Recargar el GridView para mostrar el cambio
                        CargarRequisiciones();
                        lblAlertas.Text = "La requisición ha sido rechazada.";
                    }
                    else
                    {
                        lblAlertas.Text = "No se pudo rechazar la requisición.";
                    }
                }
            }
            else
            {
                lblAlertas.Text = "Por favor, seleccione una requisición.";
            }

        }

        protected void Button6_Click(object sender, EventArgs e)
        {

            // Verifica si hay una fila seleccionada
            if (GridViewRequisiciones.SelectedIndex >= 0)
            {
                // Obtén el ID de la requisición de la fila seleccionada
                int requisicionID = Convert.ToInt32(GridViewRequisiciones.SelectedRow.Cells[1].Text);

                // Actualiza el estado en la base de datos
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "UPDATE Requisiciones SET Estado = @Estado WHERE RequisicionID = @RequisicionID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Estado", "Aprobada");
                    cmd.Parameters.AddWithValue("@RequisicionID", requisicionID);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Recargar el GridView para mostrar el cambio
                        CargarRequisiciones();
                        lblAlertas.Text = "La requisición ha sido Aprobada.";
                    }
                    else
                    {
                        lblAlertas.Text = "No se pudo aprobar la requisición.";
                    }
                }
            }
            else
            {
                lblAlertas.Text = "Por favor, seleccione una requisición.";
            }

        }
    }
}