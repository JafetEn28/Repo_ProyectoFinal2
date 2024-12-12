using System;

namespace Proyecto_Analisis2
{
    public partial class Form_Menu_Financiero : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Limpia todas las variables de sesión
            Session.Abandon(); // Abandona la sesión actual
            Response.Redirect("Login.aspx"); // Redirige al login
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}