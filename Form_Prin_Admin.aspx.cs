using System;
using System.Web.UI.WebControls;

namespace Proyecto_Analisis2
{
    public partial class Form_Prin_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        protected void CerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Limpia todas las variables de sesión
            Session.Abandon(); // Abandona la sesión actual
            Response.Redirect("Login.aspx"); // Redirige al login
        }
    }
}