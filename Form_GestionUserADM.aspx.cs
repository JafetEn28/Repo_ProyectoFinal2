using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace Proyecto_Analisis2
{
    public partial class Form_GestionUserADM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }

            metConexion();
        }

        private void CargarUsuarios()
        {
            // Establecemos la conexión con la base de datos
            string strConexion = ConfigurationManager.ConnectionStrings["Usuarios"].ConnectionString;
            using (SqlConnection conexion = new SqlConnection(strConexion))
            {
                // Creamos la consulta SQL para obtener los usuarios
                string query = "SELECT u.UsuarioID, u.Cedula, u.NombreUsuario, u.Telefono, u.CorreoElectronico, r.NombreRol " +
               "FROM Usuarios u " +
               "INNER JOIN Roles r ON u.RolID = r.RolID";

                // Creamos el comando SQL y le pasamos la conexión
                SqlDataAdapter da = new SqlDataAdapter(query, conexion);

                // Creamos el DataTable para almacenar los datos
                DataTable dt = new DataTable();

                // Llenamos el DataTable con los resultados de la consulta
                da.Fill(dt);

                // Ahora agregamos las filas al tbody
                foreach (DataRow row in dt.Rows)
                {
                    // Creamos una nueva fila en la tabla
                    string newRow = "<tr>" +
                                    "<td>" + row["UsuarioID"] + "</td>" +
                                    "<td>" + row["Cedula"] + "</td>" +
                                    "<td>" + row["NombreUsuario"] + "</td>" +
                                    "<td>" + row["Telefono"] + "</td>" +
                                    "<td>" + row["CorreoElectronico"] + "</td>" +
                                    "<td>" + row["NombreRol"] + "</td>" +
                                    "</tr>";

                    // Agregamos la fila al tbody con id="userTableBody"
                    userTableBody.InnerHtml += newRow;
                }
            }
        }

        private void LimpiarCampos()
        {
            txtCedula.Text = "";
            txtNombre.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";
            txtContra.Text = "";
            ddlRol.SelectedIndex = -1; // Resetea el DropDownList
        }

        void metConexion()
        {
            //Creamos objeto de conexion
            SqlConnection conexion = new SqlConnection();

            //Creamos el string de conexion
            string strconexion = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

            conexion.ConnectionString = strconexion;

            conexion.Open();

            Label1.Text = "Conexion Exitosa";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                // Obtener valores desde los controles del formulario
                string cedula = txtCedula.Text.Trim(); // Asegúrate de que es un string
                string nombre = txtNombre.Text.Trim();
                string correo = txtCorreo.Text.Trim();
                string telefono = txtTelefono.Text.Trim();
                string rol = ddlRol.SelectedValue; // Asumiendo que es un DropDownList con RolID
                string contrasena = txtContra.Text.Trim(); // Asumiendo que tienes un campo para la contraseña

                // Validar formato del correo (puedes usar Regex)
                if (!IsValidEmail(correo))
                {
                    lblMensaje.Text = "Correo electrónico no válido.";
                    return;
                }

                // Comprobar si el usuario ya existe en la base de datos
                if (UsuarioExiste(cedula, correo))
                {
                    lblMensaje.Text = "El usuario con esa cédula o correo electrónico ya existe.";
                    return;
                }

                // Encriptar contraseña (ejemplo con SHA-256)
                byte[] contrasenaEncriptada = EncryptPassword(contrasena);

                // Establecer la cadena de conexión
                string strConexion = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

                using (SqlConnection conexion = new SqlConnection(strConexion))
                {
                    string query = "INSERT INTO Usuarios (Cedula, NombreUsuario, CorreoElectronico, Telefono, ContrasenaEncriptada, RolID) " +
                                   "VALUES (@Cedula, @Nombre, @Correo, @Telefono, @ContrasenaEncriptada, @RolID)";

                    using (SqlCommand cmd = new SqlCommand(query, conexion))
                    {
                        // Parametrizar la consulta
                        cmd.Parameters.AddWithValue("@Cedula", cedula);
                        cmd.Parameters.AddWithValue("@Nombre", nombre);
                        cmd.Parameters.AddWithValue("@Correo", correo);
                        cmd.Parameters.AddWithValue("@Telefono", telefono);
                        cmd.Parameters.AddWithValue("@ContrasenaEncriptada", contrasenaEncriptada);
                        cmd.Parameters.AddWithValue("@RolID", rol); // Suponiendo que rol es el RolID

                        // Abrir conexión e insertar
                        conexion.Open();
                        cmd.ExecuteNonQuery();
                        conexion.Close();

                        lblMensaje.Text = "Usuario guardado exitosamente.";

                 
                        CargarUsuarios();

                  
                        LimpiarCampos();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
            }
        }

        private bool UsuarioExiste(string cedula, string correo)
        {
            string strConexion = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;
            using (SqlConnection conexion = new SqlConnection(strConexion))
            {
                string query = "SELECT COUNT(*) FROM Usuarios WHERE Cedula = @Cedula OR CorreoElectronico = @Correo";
                using (SqlCommand cmd = new SqlCommand(query, conexion))
                {
                    cmd.Parameters.AddWithValue("@Cedula", cedula);
                    cmd.Parameters.AddWithValue("@Correo", correo);

                    conexion.Open();
                    int count = (int)cmd.ExecuteScalar();
                    conexion.Close();

                    return count > 0; // Si count > 0, significa que ya existe un usuario con esa cédula o correo
                }
            }
        }

        // Función para verificar si el correo es válido
        private bool IsValidEmail(string email)
        {
            try
            {
                var mail = new System.Net.Mail.MailAddress(email);
                return mail.Address == email;
            }
            catch
            {
                return false;
            }
        }

        // Función para encriptar la contraseña con SHA-256
        private byte[] EncryptPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                return sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            // Implementar la lógica de edición aquí
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            // Implementar la lógica de eliminación aquí
        }
    }
}

