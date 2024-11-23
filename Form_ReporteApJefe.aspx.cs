using OfficeOpenXml;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace Proyecto_Analisis2
{
    public partial class Form_ReporteApJefe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        private void CargarDatos()
        {
            // Leer el connection string desde Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

            // Crear la conexión a la base de datos
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Crear el comando SQL, en este caso un SELECT
                SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.Aprobaciones", conn);

                try
                {
                    // Abrir la conexión
                    conn.Open();

                    // Ejecutar el comando y leer los datos
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            // Asignar los datos al control GridView
                            GridView1.DataSource = reader;
                            GridView1.DataBind();
                        }
                        else
                        {
                            // Opcional: mensaje o lógica si no hay datos
                            GridView1.DataSource = null;
                            GridView1.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    // Opcional: Log o mostrar mensaje al usuario
                    Console.WriteLine("Error al cargar los datos: " + ex.Message);
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Establecer el contexto de licencia
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial; // Cambia a Commercial si es necesario

            // Configuración de la respuesta para la descarga
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Reporte_Aprobaciones.xlsx");
            Response.Charset = "";
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            using (ExcelPackage excel = new ExcelPackage())
            {
                // Crear una hoja de trabajo
                var workSheet = excel.Workbook.Worksheets.Add("Aprobaciones");

                // Cargar los datos en el GridView
                CargarDatos();

                // Obtener los datos del GridView
                for (int i = 0; i < GridView1.Columns.Count; i++)
                {
                    // Establecer el encabezado
                    workSheet.Cells[1, i + 1].Value = GridView1.Columns[i].HeaderText;
                }

                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    for (int j = 0; j < GridView1.Columns.Count; j++)
                    {
                        // Establecer los valores en las celdas
                        workSheet.Cells[i + 2, j + 1].Value = GridView1.Rows[i].Cells[j].Text;
                    }
                }

                // Ajustar el ancho de las columnas
                workSheet.Cells.AutoFitColumns();

                // Guardar el archivo en la respuesta
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    excel.SaveAs(memoryStream);
                    memoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }
    }
}











