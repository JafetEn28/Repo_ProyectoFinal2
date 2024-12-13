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
          
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                return bytes; 
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

            
            object result = ExecuteScalar(query, parameters);

            if (result != DBNull.Value)
            {
                return Convert.ToInt32(result) > 0; 
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
                    return cmd.ExecuteScalar(); 
                }
            }
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string correo = txtCorreo.Text;

           
            if (ExisteCorreo(correo))
            {
                lblMensaje.Text = "El correo electrónico ya está registrado.";
                return;  
            }

            string query = @"
        INSERT INTO Usuarios (Cedula, NombreUsuario, Telefono, CorreoElectronico, RolID, ContrasenaEncriptada)
        VALUES (@Cedula, @Nombre, @Telefono, @Correo, @RolID, @Contrasena)";

            SqlParameter[] parameters = {
        new SqlParameter("@Cedula", txtCedula.Text),
        new SqlParameter("@Nombre", txtNombre.Text),
        new SqlParameter("@Telefono", txtTelefono.Text),
        new SqlParameter("@Correo", correo),
        new SqlParameter("@RolID", ddlRol.SelectedValue),
        new SqlParameter("@Contrasena", txtContrasena.Text) 
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
        new SqlParameter("@ContrasenaEncriptada", HashPassword(txtContrasena.Text)) 
        {
            SqlDbType = SqlDbType.VarBinary 
        },
        new SqlParameter("@UsuarioID", txtIdUsuario.Text)
    };

            int rowsAffected = ExecuteNonQuery(query, parameters);
            lblMensaje.Text = rowsAffected > 0 ? "Usuario actualizado correctamente." : "Error al actualizar el usuario.";
            CargarUsuarios();
            LimpiarCampos();  

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string query = "DELETE FROM Usuarios WHERE UsuarioID = @UsuarioID";
            SqlParameter[] parameters = { new SqlParameter("@UsuarioID", txtIdUsuario.Text) };

            int rowsAffected = ExecuteNonQuery(query, parameters);
            lblMensaje.Text = rowsAffected > 0 ? "Usuario eliminado correctamente." : "Error al eliminar el usuario.";

            CargarUsuarios();
            LimpiarCampos(); 


        }

        private DataTable ExecuteQuery(string query, SqlParameter[] parameters = null)
        {
          
            string connectionString = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                
                con.Open();

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                  
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    return dt; 
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
            txtContrasena.Text = ""; 
            ddlRol.SelectedIndex = 0; 
            lblMensaje.Text = ""; 
        }

        private int ExecuteNonQuery(string query, SqlParameter[] parameters)
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
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();  
        }
    }
}
