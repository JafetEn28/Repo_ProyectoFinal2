<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto_Analisis2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <style type="text/css">
        /* Estilo para el fondo de la página */
        body {
            background-color: #1e1e2f;
            background-image: url('Imagenes/FondoLogin.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* Estilo del contenedor principal */
        .login-container {
            background-color: #2a2a3d;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 196, 180, 0.5);
            width: 450px;
            padding: 40px;
            text-align: center;
            color: #c7c7c7;
        }

            .login-container h2 {
                font-size: 2em;
                color: #00c4b4;
                margin-bottom: 20px;
            }

        /* Estilo para los campos de entrada */
        .login-input {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: 2px solid #00c4b4;
            border-radius: 5px;
            background-color: #1e1e2f;
            color: #c7c7c7;
            font-size: 1.1em;
            box-sizing: border-box;
        }

        /* Estilo para el botón */
        .login-button {
            background-color: #00c4b4;
            color: #2a2a3d;
            padding: 15px;
            border: none;
            border-radius: 5px;
            font-size: 1.2em;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            transition: background 0.3s;
        }

            .login-button:hover {
                background-color: #c7c7c7;
                color: #1e1e2f;
            }

        /* Estilo para enlaces adicionales */
        .login-links {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
            font-size: 0.9em;
        }

            .login-links a {
                color: #00c4b4;
                text-decoration: none;
                transition: color 0.3s;
            }

                .login-links a:hover {
                    color: #c7c7c7;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="login-container">
        <h2>
            <asp:Image ID="Image1" runat="server" Height="87px" ImageUrl="~/Iconos/IconUser.png" Width="88px" />
        </h2>
        <h2>Iniciar Sesión</h2>

        <asp:TextBox ID="txtUsuario" runat="server" CssClass="login-input" placeholder="Usuario"></asp:TextBox>

        <asp:TextBox ID="txtContra" runat="server" CssClass="login-input" placeholder="Contraseña" TextMode="Password"></asp:TextBox>

        <br />
        <br />

        <asp:Button ID="btnSesion" runat="server" CssClass="login-button" Text="Iniciar Sesión" OnClick="btnSesion_Click" />

        <div class="login-links">
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Mostrar Contraseña" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/FormCodigoCorreo.aspx">¿Olvidaste tu contraseña?</asp:HyperLink>
            <asp:Label ID="lblAlertas" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
