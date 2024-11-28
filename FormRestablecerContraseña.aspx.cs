using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace Proyecto_Analisis2
{
    public partial class FormRestablecerContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Correo"] == null)
            {
                Response.Redirect("FormValidarCorreo.aspx");
            }
        }

        // Método para encriptar la contraseña (ajustado para devolver byte[])
        private byte[] EncriptarContrasena(string contrasena)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                return sha256.ComputeHash(Encoding.UTF8.GetBytes(contrasena));
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string correo = Session["Correo"].ToString();
            string nuevaContrasena = txtContra.Text.Trim();

            if (string.IsNullOrEmpty(nuevaContrasena))
            {
                lblAlertas.Text = "Por favor ingrese una nueva contraseña.";
                lblAlertas.ForeColor = System.Drawing.Color.Red;
                lblAlertas.Visible = true;
                return;
            }

            try
            {
                // Conexión a la base de datos
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Consultamos el usuario con el correo proporcionado
                    string query = "SELECT UsuarioID FROM Usuarios WHERE CorreoElectronico = @Correo";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Correo", correo);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();  // Leer la fila
                        int usuarioID = Convert.ToInt32(reader["UsuarioID"]);

                        // Encriptar la nueva contraseña
                        byte[] contrasenaEncriptada = EncriptarContrasena(nuevaContrasena); // Cambiado a byte[]

                        // Actualizamos la contraseña y el estado
                        reader.Close();  // Cerrar el lector para que se pueda ejecutar otra consulta

                        string updateQuery = "UPDATE Usuarios SET ContrasenaEncriptada = @Contrasena, Estado = 1 WHERE UsuarioID = @UsuarioID";
                        SqlCommand updateCmd = new SqlCommand(updateQuery, conn);
                        updateCmd.Parameters.AddWithValue("@Contrasena", contrasenaEncriptada);
                        updateCmd.Parameters.AddWithValue("@UsuarioID", usuarioID);

                        int rowsAffected = updateCmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblAlertas.Text = "Contraseña restablecida exitosamente.";
                            lblAlertas.ForeColor = System.Drawing.Color.Green;

                            Response.Redirect("Login.aspx");
                        }
                        else
                        {
                            lblAlertas.Text = "Error al restablecer la contraseña.";
                            lblAlertas.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblAlertas.Text = "Correo no encontrado.";
                        lblAlertas.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            catch (Exception ex)
            {
                lblAlertas.Text = "Error en el catch: " + ex.Message;
                lblAlertas.ForeColor = System.Drawing.Color.Red;
            }
        }
   
    }
}
