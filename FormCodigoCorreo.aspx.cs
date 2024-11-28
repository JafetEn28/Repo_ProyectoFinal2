using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace Proyecto_Analisis2
{
    public partial class FormCodigoCorreo : Page
    {
        private string codigoGenerado;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Correo"] != null)
            {
                // Verificamos si la página es un postback. Si no lo es, generamos el código
                if (!IsPostBack)
                {
                    string correo = Session["Correo"].ToString();
                    lblCorreo.Text = "Se ha enviado el código al correo " + correo;

                    // Generar el código aleatorio y almacenarlo en la variable y en el ViewState
                    codigoGenerado = GenerarCodigoAleatorio(); // Guardamos en la variable
                    ViewState["CodigoGenerado"] = codigoGenerado; // También lo guardamos en ViewState

                    // Enviar el correo con el código
                    EnviarCorreo(correo, "Restablecer contraseña", "Tu código es: " + codigoGenerado);
                }
            }
            else
            {
                // Si no hay correo en la sesión, redirigir a la página de validación
                Response.Redirect("FormValidarCorreo.aspx");
            }
        }

        public void EnviarCorreo(string destinatario, string asunto, string mensaje)
        {
            try
            {
                // Configurar el correo
                MailMessage correo = new MailMessage();
                correo.From = new MailAddress("rodriguezisaac193@gmail.com");
                correo.To.Add(destinatario);
                correo.Subject = asunto;
                correo.Body = mensaje;

                // Configurar el cliente SMTP
                SmtpClient clienteSmtp = new SmtpClient();
                clienteSmtp.Send(correo);

                // Mostrar mensaje de éxito
                lblAlertas.Text = "El correo con el código ha sido enviado correctamente.";
                lblAlertas.ForeColor = System.Drawing.Color.Green;
                lblAlertas.Visible = true;
            }
            catch (Exception ex)
            {
                // Mostrar mensaje de error
                lblAlertas.Text = "Error al enviar el correo: " + ex.Message;
                lblAlertas.ForeColor = System.Drawing.Color.Red;
                lblAlertas.Visible = true;
            }
        }

        private string GenerarCodigoAleatorio()
        {
            // Generar un código aleatorio de 6 dígitos
            Random random = new Random();
            int codigo = random.Next(100000, 999999);
            return codigo.ToString();  // Convertir el código a cadena
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Obtener el código ingresado por el usuario
            string codigoIngresado = txtCodigo.Text;

            // Obtener el código generado del ViewState
            string codigoGenerado = ViewState["CodigoGenerado"] as string;

            // Verificar si el código ingresado es igual al generado
            if (codigoIngresado == codigoGenerado)
            {
                // Si el código es correcto, redirigir al formulario de restablecimiento de contraseña
                Response.Redirect("FormRestablecerContraseña.aspx");
            }
            else
            {
                // Si el código es incorrecto, mostrar el mensaje en lblAlertas
                lblAlertas.Text = "El código ingresado es incorrecto.";
                lblAlertas.ForeColor = System.Drawing.Color.Red;
                lblAlertas.Visible = true;
            }
        }
    }
}


