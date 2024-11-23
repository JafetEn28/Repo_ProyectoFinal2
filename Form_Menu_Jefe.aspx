<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Menu_Jefe.aspx.cs" Inherits="Proyecto_Analisis2.Form_Menu_Jefe" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Menú Aprobador Jefe</title>
    <style type="text/css">
        /* Estilos generales */
        body {
            background-color: #121212;
            background-image: url('Imagenes/fondonegro.jpg');
             background-size: cover;
             background-repeat: no-repeat;
             background-position: center;
            color: #E0E0E0;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Barra de menú superior */
        .menu-bar {
            background-color: #1E1E1E;
            padding: 20px;
            display: flex;
            justify-content: center;
        }

        .menu-item {
            color: #FFC300;
            text-decoration: none;
            font-size: 1.2em;
            margin: 0 15px;
            transition: color 0.3s;
        }

        .menu-item:hover {
            color: #FF5733;
        }

        /* Sección de bienvenida */
        .content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #FFC300;
            font-size: 2em;
            text-align: center;
            background: url('background-pattern.png') no-repeat center center;
            background-size: cover;
        }

        /* Footer */
        .footer {
            background-color: #1E1E1E;
            color: #FFC300;
            text-align: center;
            padding: 15px;
            font-size: 0.9em;
        }

        .footer strong {
            color: #FFC300;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="display: flex; flex-direction: column; min-height: 100vh;">
        <!-- Barra de menú -->
        <div class="menu-bar">
            <asp:HyperLink ID="lnkInicio" runat="server" NavigateUrl="~/Form_Menu_Jefe.aspx" CssClass="menu-item">Inicio</asp:HyperLink>
            <asp:HyperLink ID="lnkSolicitudesPendientes" runat="server" NavigateUrl="~/Form_Solicitudes_Pendiente_Jefe.aspx" CssClass="menu-item">Solicitudes Pendientes</asp:HyperLink>
            <asp:HyperLink ID="lnkDetallesSolicitud" runat="server" NavigateUrl="~/Form_DetallesSolicitud.aspx" CssClass="menu-item">Detalles de Solicitud</asp:HyperLink>
            <asp:HyperLink ID="lnkReportes" runat="server" NavigateUrl="~/Form_ReporteApJefe" CssClass="menu-item">Reportes</asp:HyperLink>
            <strong>
           <asp:LinkButton ID="btnCerrarSesion" runat="server" CssClass="nav-link" OnClientClick="return confirmarCierre();" OnClick="CerrarSesion_Click" style="color: #FFC300; text-decoration: none; font-size: large">Cerrar Sesión</asp:LinkButton>

            </strong>

        </div>

        <!-- Contenido principal -->
        <div class="content">
            Bienvenido, Aprobador Jefe
        </div>

        <!-- Footer -->
        <div class="footer">
            © 2024 Menu Jefe | Proyecto de Análisis 2 | Creado por <strong>ROES</strong>
        </div>
    </form>

    <script type="text/javascript">
    function confirmarCierre() {
        return confirm("¿Estás seguro de que deseas cerrar sesión?");
    }
    </script>

</body>
</html>
