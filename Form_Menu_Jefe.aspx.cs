using System;

namespace Proyecto_Analisis2
{
    public partial class Form_Menu_Jefe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CerrarSesion_Click(object sender, EventArgs e)
        {
            // Limpiar la sesión
            Session.Clear();
            Session.Abandon();
            // Redirigir al login
            Response.Redirect("Login.aspx");
        }
    }
}