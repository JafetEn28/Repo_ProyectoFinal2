using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        }


        public static byte[] HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Calcula el hash como un arreglo de bytes
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                return bytes; // Retorna el arreglo de bytes
            }
        }

        private void CargarUsuarios()
        {
            string query = "SELECT UsuarioID, Cedula, NombreUsuario, Telefono, CorreoElectronico, RolID FROM Usuarios";
            DataTable dt = ExecuteQuery(query);
            gvUsuarios.DataSource = dt;
            gvUsuarios.DataBind();
        }

        private bool ExisteCorreo(string correo)
        {
            string query = "SELECT COUNT(*) FROM Usuarios WHERE CorreoElectronico = @Correo";
            SqlParameter[] parameters = { new SqlParameter("@Correo", correo) };

            // Ejecuta la consulta y obtiene el número de registros
            object result = ExecuteScalar(query, parameters);

            // Verifica si la consulta devolvió un valor y si el valor es mayor que 0
            if (result != DBNull.Value)
            {
                return Convert.ToInt32(result) > 0; // Si hay registros, significa que el correo existe
            }
            return false;
        }


        private object ExecuteScalar(string query, SqlParameter[] parameters)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    con.Open();
                    return cmd.ExecuteScalar(); // Devuelve el valor de la primera columna de la primera fila
                }
            }
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string correo = txtCorreo.Text;

            // Verificar si el correo ya existe en la base de datos
            if (ExisteCorreo(correo))
            {
                lblMensaje.Text = "El correo electrónico ya está registrado.";
                return;  // Detener el proceso de guardado si el correo ya existe
            }

            // Si el correo no existe, realizar la inserción
            string query = @"
        INSERT INTO Usuarios (Cedula, NombreUsuario, Telefono, CorreoElectronico, RolID, ContrasenaEncriptada)
        VALUES (@Cedula, @Nombre, @Telefono, @Correo, @RolID, @Contrasena)";

            SqlParameter[] parameters = {
        new SqlParameter("@Cedula", txtCedula.Text),
        new SqlParameter("@Nombre", txtNombre.Text),
        new SqlParameter("@Telefono", txtTelefono.Text),
        new SqlParameter("@Correo", correo),
        new SqlParameter("@RolID", ddlRol.SelectedValue),
        new SqlParameter("@Contrasena", txtContrasena.Text) // Asegúrate de que el campo txtContrasena esté en el formulario
    };

            int rowsAffected = ExecuteNonQuery(query, parameters);
            lblMensaje.Text = rowsAffected > 0 ? "Usuario guardado correctamente." : "Error al guardar el usuario.";
            CargarUsuarios();

        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvUsuarios.SelectedRow;
            txtIdUsuario.Text = row.Cells[0].Text;
            txtCedula.Text = row.Cells[1].Text;
            txtNombre.Text = row.Cells[2].Text;
            txtTelefono.Text = row.Cells[3].Text;
            txtCorreo.Text = row.Cells[4].Text;
            ddlRol.SelectedValue = row.Cells[5].Text;
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string query = @"
        UPDATE Usuarios
        SET Cedula = @Cedula, NombreUsuario = @Nombre, Telefono = @Telefono, 
            CorreoElectronico = @Correo, RolID = @RolID, ContrasenaEncriptada = @ContrasenaEncriptada
        WHERE UsuarioID = @UsuarioID";

            SqlParameter[] parameters = {
        new SqlParameter("@Cedula", txtCedula.Text),
        new SqlParameter("@Nombre", txtNombre.Text),
        new SqlParameter("@Telefono", txtTelefono.Text),
        new SqlParameter("@Correo", txtCorreo.Text),
        new SqlParameter("@RolID", ddlRol.SelectedValue),
        new SqlParameter("@ContrasenaEncriptada", HashPassword(txtContrasena.Text)) // Usamos el hash de la contraseña
        {
            SqlDbType = SqlDbType.VarBinary // Asegúrate de especificar que es un arreglo de bytes
        },
        new SqlParameter("@UsuarioID", txtIdUsuario.Text)
    };

            int rowsAffected = ExecuteNonQuery(query, parameters);
            lblMensaje.Text = rowsAffected > 0 ? "Usuario actualizado correctamente." : "Error al actualizar el usuario.";
            CargarUsuarios();
            LimpiarCampos();  // Limpiar los campos después de guardar

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string query = "DELETE FROM Usuarios WHERE UsuarioID = @UsuarioID";
            SqlParameter[] parameters = { new SqlParameter("@UsuarioID", txtIdUsuario.Text) };

            int rowsAffected = ExecuteNonQuery(query, parameters);
            lblMensaje.Text = rowsAffected > 0 ? "Usuario eliminado correctamente." : "Error al eliminar el usuario.";

            CargarUsuarios();
            LimpiarCampos();  // Limpiar los campos después de guardar


        }

        private DataTable ExecuteQuery(string query, SqlParameter[] parameters = null)
        {
            // Obtiene la cadena de conexión desde el archivo Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

            // Usa un bloque using para manejar la conexión de manera segura
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Abre la conexión
                con.Open();

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Si hay parámetros, agrégalos al comando
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    // Usa SqlDataAdapter para llenar un DataTable
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    return dt; // Retorna el DataTable con los datos
                }
            }
        }

        private void LimpiarCampos()
        {
            txtCedula.Text = "";
            txtIdUsuario.Text = "";
            txtNombre.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";
            txtContrasena.Text = ""; // Asegúrate de que tienes un TextBox para la contraseña
            ddlRol.SelectedIndex = 0; // Establecer el valor predeterminado del DropDownList
            lblMensaje.Text = ""; // Limpiar cualquier mensaje de error o éxito
        }

        private int ExecuteNonQuery(string query, SqlParameter[] parameters)
        {
            // Obtiene la cadena de conexión desde el archivo Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

            // Usa un bloque using para manejar la conexión de manera segura
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Si hay parámetros, agrégalos al comando
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    // Abre la conexión y ejecuta el comando
                    con.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();  // Limpiar los campos después de guardar
        }
    }
}
