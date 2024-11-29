using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Analisis2
{
    public partial class FormValidarCorreo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
            lblAlertas.Text = string.Empty;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }
        private bool CorreoExiste(string correo)
        {
            bool existe = false;
            string query = "SELECT COUNT(1) FROM Usuarios WHERE CorreoElectronico = @Correo";

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Correo", correo);

                    conn.Open();
                    existe = Convert.ToInt32(cmd.ExecuteScalar()) > 0; // Si el valor es mayor que 0, el correo existe
                }
            }

            return existe;
        }

    }
}