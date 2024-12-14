using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Proyecto_Analisis2
{
    public partial class Nueva_Requisicion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["UsuarioID"] == null)
            {
                Response.Redirect("Login.aspx"); 
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // Verificar campos vacíos
            if (string.IsNullOrWhiteSpace(txtDescripcion.Text) ||
                string.IsNullOrWhiteSpace(txtJustificacion.Text) ||
                string.IsNullOrWhiteSpace(txtCosto.Text) ||
                string.IsNullOrWhiteSpace(txtCantidad.Text))
            {
                lblAlertas.Text = "Por favor, complete todos los campos.";
                lblAlertas.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                // Obtener el UsuarioID de la sesión activa
                int usuarioID = Convert.ToInt32(Session["UsuarioID"]);

                // Captura los valores del formulario
                string descripcion = txtDescripcion.Text;
                string justificacion = txtJustificacion.Text;

                // Validar el monto y cantidad
                if (!decimal.TryParse(txtCosto.Text, out decimal costo))
                {
                    lblAlertas.Text = "Por favor, ingrese un monto válido.";
                    lblAlertas.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                if (!int.TryParse(txtCantidad.Text, out int cantidad))
                {
                    lblAlertas.Text = "Por favor, ingrese una cantidad válida.";
                    lblAlertas.ForeColor = System.Drawing.Color.Red;
                    return;
                }

               
                string connectionString = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Insertar la requisición en la base de datos, incluyendo los estados de Jefe y Financiero
                    string query = @"INSERT INTO Requisiciones 
                                     (CompradorID, Descripcion, Justificacion, Monto, Cantidad,  EstadoJefe, EstadoFinanciero) 
                                     VALUES (@CompradorID, @Descripcion, @Justificacion, @Monto, @Cantidad, 'En proceso', 'En proceso')";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@CompradorID", usuarioID); // Se usa el UsuarioID de la sesión
                        cmd.Parameters.AddWithValue("@Descripcion", descripcion);
                        cmd.Parameters.AddWithValue("@Justificacion", justificacion);
                        cmd.Parameters.AddWithValue("@Monto", costo);
                        cmd.Parameters.AddWithValue("@Cantidad", cantidad);

                        cmd.ExecuteNonQuery(); // Ejecutar el query de inserción
                    }
                }

                // Mensaje de éxito
                lblAlertas.Text = "Requisición guardada exitosamente.";
                lblAlertas.ForeColor = System.Drawing.Color.Green;

                // Limpia los campos del formulario
                txtDescripcion.Text = "";
                txtJustificacion.Text = "";
                txtCosto.Text = "";
                txtCantidad.Text = "";
            }
            catch (Exception ex)
            {
                // Manejo de errores
                lblAlertas.Text = "Ocurrió un error al guardar la requisición: " + ex.Message;
                lblAlertas.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
