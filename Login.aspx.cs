using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;

namespace Proyecto_Analisis2
{
    public partial class Login : Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSesion_Click(object sender, EventArgs e)
        {
            string correo = txtUsuario.Text.Trim();
            string contrasena = txtContra.Text.Trim();

            // Validar campos
            if (string.IsNullOrEmpty(correo) || string.IsNullOrEmpty(contrasena))
            {
                lblAlertas.Text = "Por favor ingrese correo y contraseña.";
                lblAlertas.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Consultar base de datos
            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                try
                {
                    conn.Open();
                    string query = @"SELECT u.ContrasenaEncriptada, r.NombreRol 
                                 FROM Usuarios u 
                                 INNER JOIN Roles r ON u.RolID = r.RolID 
                                 WHERE u.CorreoElectronico = @Correo AND u.Estado = 1";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Correo", correo);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Recuperar datos
                                byte[] contrasenaEncriptadaBD = (byte[])reader["ContrasenaEncriptada"];
                                string nombreRol = reader["NombreRol"].ToString();

                                // Validar contraseña
                                if (contrasena == System.Text.Encoding.UTF8.GetString(contrasenaEncriptadaBD))
                                {
                                    // Redirigir según el rol
                                    switch (nombreRol)
                                    {
                                        case "Aprobador jefe":
                                            Response.Redirect("Form_Menu_Jefe.aspx");
                                            break;
                                        case "Administrador":
                                            Response.Redirect("Form_Prin_Admin.aspx");
                                            break;
                                        case "Aprobador financiero":
                                            Response.Redirect("Form_Menu_Financiero.aspx");
                                            break;
                                        case "Usuario":
                                            Response.Redirect("Form_MenuUsuario.aspx");
                                            break;
                                        default:
                                            lblAlertas.Text = "Rol no reconocido.";
                                            lblAlertas.ForeColor = System.Drawing.Color.Red;
                                            break;
                                    }
                                }
                                else
                                {
                                    lblAlertas.Text = "Contraseña incorrecta.";
                                    lblAlertas.ForeColor = System.Drawing.Color.Red;
                                }
                            }
                            else
                            {
                                lblAlertas.Text = "Usuario no encontrado o inactivo.";
                                lblAlertas.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblAlertas.Text = "Error al conectar con la base de datos: " + ex.Message;
                    lblAlertas.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
