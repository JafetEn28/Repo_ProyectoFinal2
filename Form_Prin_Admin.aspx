<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Prin_Admin.aspx.cs" Inherits="Proyecto_Analisis2.Form_Prin_Admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Administrador de Sistema</title>
    <style type="text/css">

        /* Estilos globales */
        body {
            background-color: #121212;
            background-image: url('Imagenes/oscuro-transformed.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: #E0E0E0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Barra de navegación */
        nav {
            background-color: #15012A;
            padding: 15px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        nav a {
            color: #FFC107;
            margin: 0 20px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1em;
        }

        nav a:hover {
            color: white;
        }

        /* Contenedor del contenido principal */
        .content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 40px;
        }

        .welcome-text {
            font-size: 2.5em;
            color: #FFC107;
            margin-bottom: 20px;
        }

        /* Pie de página */
        .footer {
            background-color: #DD5045;
            color: white;
            text-align: center;
            padding: 10px;
            font-size: 0.9em;
            position: relative;
        }
        .auto-style6 {
            font-size: 2.5em;
            color: #FF5023;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <!-- Barra de navegación -->
    <form id="form1" runat="server">
    <nav>
        <strong>
            <asp:HyperLink ID="linkInicio" runat="server" NavigateUrl="~/Form_Prin_Admin.aspx" CssClass="nav-link" style="color: #FF5023">
                Inicio
            </asp:HyperLink>
            <asp:HyperLink ID="linkGestionUsuarios" runat="server" NavigateUrl="~/Form_Gestion_Usuario.aspx" CssClass="nav-link" style="color: #FF5023">
                Gestión de Usuarios
            </asp:HyperLink>
            <asp:HyperLink ID="linkUsuariosActivos" runat="server" NavigateUrl="~/Form_Usuarios_Activos.aspx" CssClass="nav-link" style="color: #FF5023">
                Usuarios Activos
            </asp:HyperLink>
            <asp:LinkButton ID="btnCerrarSesion" runat="server" CssClass="nav-link btn-cerrar-sesion" 
                OnClientClick="return confirmarCierre();" OnClick="CerrarSesion_Click" style="color: #FF5023">
                Cerrar Sesión
            </asp:LinkButton>
        </strong>
    </nav>
</form>



    <!-- Contenido principal -->
    <div class="content">
        <p class="auto-style6">Bienvenido, Administrador</p>
    </div>

    <!-- Pie de página -->
    <div class="footer">
        © 2024 Administrador de Sistema | Proyecto de Análisis 2 | Creado por <strong>ROES</strong></div>

    <script type="text/javascript">
    function confirmarCierre() {
        return confirm("¿Estás seguro de que deseas cerrar sesión?");
    }
    </script>

</body>
</html>
