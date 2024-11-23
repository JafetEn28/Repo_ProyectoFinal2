using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Proyecto_Analisis2
{
    public partial class FormCodigoCorreo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack) 
            {
                string codigo = GenerarCodigoAleatorio();
                ViewState["CodigoGenerado"] = codigo; 

                EnviarCorreo("rodriguezisaac193@gmail.com", "Restablecer contraseña", "Tu código es: " + codigo);
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Obtener el código aleatorio generado (puedes almacenarlo en ViewState o Session)
            string codigoGenerado = (string)ViewState["CodigoGenerado"]; 

            // Verificar si el código ingresado es correcto
            if (TextBox1.Text == codigoGenerado)
            {
                Response.Redirect("FormRestablecerContraseña.aspx");
            }
            else
            {
                
                Label1.Visible = true;
                Label1.Text = "El código ingresado es incorrecto. Intenta de nuevo."; 
            }
        }


        public void EnviarCorreo(string destinatario, string asunto, string mensaje)
        {
            
            MailMessage correo = new MailMessage();
            correo.To.Add(destinatario);
            correo.Subject = asunto;
            correo.Body = mensaje;

            SmtpClient clienteSmtp = new SmtpClient();

            try
            {
                clienteSmtp.Send(correo);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al enviar el correo: " + ex.Message);
            }
        }

        private string GenerarCodigoAleatorio()
        {
            Random random = new Random();
            int codigo = random.Next(100000, 999999); 
            return codigo.ToString(); 
        }


    }
}