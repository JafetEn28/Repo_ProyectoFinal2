<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Menu_Financiero.aspx.cs" Inherits="Proyecto_Analisis2.Form_Menu_Financiero" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aprobador Financiero</title>
    <style>
        /* Estilos globales */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #2B3A55; /* Fondo principal */
            background-image: url('Imagenes/FondoFinan.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: #F1F6F9; /* Texto */
        }

        /* Barra de navegación */
        .navbar {
            background-color: #394867; /* Fondo del menú */
            color: #F1F6F9; /* Texto del menú */
            display: flex;
            justify-content: center;
            padding: 15px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

            .navbar ul {
                list-style: none;
                display: flex;
                gap: 30px; /* Espaciado entre las opciones */
                margin: 0;
                padding: 0;
            }

                .navbar ul li {
                    display: inline;
                }

                    .navbar ul li a,
                    .navbar ul li .nav-link {
                        color: #E7F6F2; /* Texto de los enlaces */
                        text-decoration: none;
                        font-weight: bold;
                        font-size: 1.1em;
                        transition: color 0.3s ease;
                    }

                        .navbar ul li a:hover,
                        .navbar ul li .nav-link:hover {
                            color: #A2D2FF; /* Hover en los enlaces */
                        }

        /* Contenido central */
        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 110px); /* Ajustar para excluir la barra de navegación y pie */
            text-align: center;
        }

            .content h1 {
                color: #A2D2FF; /* Color del mensaje principal */
                font-size: 2.5em;
            }

        /* Pie de página */
        .footer {
            background-color: #394867; /* Fondo del pie */
            color: #F1F6F9; /* Texto */
            text-align: center;
            padding: 10px 0;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Barra de navegación -->
        <div class="navbar">
            <ul>
                <li><a href="Form_DetallesSolicitud_Financiero">Solicitudes Pendientes</a></li>
                <li><a href="Form_HistorialFinanciero1">Reportes</a></li>
                <li>
                    <asp:LinkButton ID="btnCerrarSesion" runat="server" CssClass="nav-link" OnClientClick="return confirmarCierre();" OnClick="CerrarSesion_Click">
                        Cerrar Sesión
                    </asp:LinkButton>
                </li>
            </ul>
        </div>

        <!-- Contenido principal -->
        <div class="content">
            <h1>Bienvenido, Aprobador Financiero</h1>
        </div>

        <!-- Pie de página -->
        <div class="footer">
            © 2024 Aprobador Financiero | Proyecto de Análisis 2 | Creado por ROES
        </div>
    </form>

    <script type="text/javascript">
        function confirmarCierre() {
            return confirm("¿Estás seguro de que deseas cerrar sesión?");
        }
    </script>
</body>
</html>



