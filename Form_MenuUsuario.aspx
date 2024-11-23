<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_MenuUsuario.aspx.cs" Inherits="Proyecto_Analisis2.Form_MenuUsuario" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Interfaz Mejorada</title>
    <style>
        html, body {
            background-image: url('Imagenes/AzulUser.png');
            margin: 0;
            padding: 0;
            height: 100%;
            display: flex;
            flex-direction: column;
            font-family: Arial, sans-serif;
            background-color: #1e1e2f;
            color: #ffffff;
        }

        form {
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        .navbar {
            background-color: #2a2a3d;
            padding: 15px 20px;
            display: flex;
            justify-content: space-around;
            border-bottom: 2px solid #00c4b4;
        }

        .navbar .nav-link {
            color: #c7c7c7;
            text-decoration: none;
            font-size: 1.1em;
            padding: 10px 15px;
            transition: color 0.3s, background-color 0.3s;
        }

        .navbar .nav-link:hover,
        .navbar .nav-link.active {
            background-color: #00c4b4;
            color: #1e1e2f;
            border-radius: 5px;
        }

        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1; /* Se expande para ocupar el espacio restante */
            text-align: center;
            color: #c7c7c7;
        }

        h1 {
            font-size: 2.5em;
            color: #2883CA;
        }

        footer {
            text-align: left;
            padding: 10px 20px;
            background-color: #2a2a3d;
            color: #c7c7c7;
        }
        .auto-style1 {
            color: #FFFFFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">    
            <asp:HyperLink NavigateUrl="~/Form_UserNueva_Requisicion.aspx" Text="Nueva Requisición" CssClass="nav-link active" runat="server" />
            <asp:HyperLink NavigateUrl="Form_Historial_Reportes" Text="Historial" CssClass="nav-link" runat="server" />
            <asp:HyperLink NavigateUrl="Form_Perfil_user" Text="Perfil" CssClass="nav-link" runat="server" />
            <asp:HyperLink NavigateUrl="Form_Correo_User" Text="Correo" CssClass="nav-link" runat="server" />
            <asp:LinkButton ID="btnCerrarSesion" runat="server" CssClass="nav-link" OnClientClick="return confirmarCierre();" OnClick="CerrarSesion_Click">Cerrar Sesión</asp:LinkButton>

        </div>
        <div class="content">
            <h1 class="auto-style1">Bienvenido</h1>
        </div>
        <footer>
            Usuario Comprador
        </footer>
    </form>

    <script type="text/javascript">
    function confirmarCierre() {
        return confirm("¿Estás seguro de que deseas cerrar sesión?");
    }
    </script>

</body>
</html>
