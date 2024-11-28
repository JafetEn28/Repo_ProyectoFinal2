<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormCodigoCorreo.aspx.cs" Inherits="Proyecto_Analisis2.FormCodigoCorreo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Recuperación de Contraseña</title>
    <style type="text/css">
        /* Estilo global */
        body {
            background-color: #1e1e2f; /* Fondo oscuro */
            background-image: url('Imagenes/FondoLogin.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            font-family: Arial, sans-serif;
            color: #c7c7c7; /* Texto claro */
            margin: 0;
            padding: 0;
        }

        /* Contenedor principal */
        .container {
            width: 60%;
            margin: 50px auto;
            padding: 40px;
            background-color: #2a2a3d; /* Fondo gris oscuro */
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 196, 180, 0.5); /* Sombra verde */
        }

        h2 {
            color: #00c4b4; /* Verde claro */
            font-size: 2em;
            text-align: center;
            margin-bottom: 20px;
        }

        .message {
            text-align: center;
            font-size: 1.1em;
            margin-bottom: 30px;
        }

        /* Estilo para los campos de entrada */
        .input-field {
            width: 100%;
            padding: 12px;
            border: 2px solid #00c4b4;
            background-color: #1e1e2f;
            color: #c7c7c7;
            font-size: 1em;
            border-radius: 5px;
            margin-bottom: 20px;
        }

            .input-field:focus {
                outline: none;
                border-color: #00c4b4;
            }

        /* Estilo para el mensaje de error */
        .error-message {
            color: #FF0000; /* Rojo para errores */
            font-size: 1em;
            margin-top: -15px;
            text-align: center;
        }

        /* Estilo para el botón */
        .btn-submit {
            background-color: #00c4b4; /* Fondo verde */
            color: #2a2a3d; /* Texto gris oscuro */
            font-size: 1.2em;
            padding: 15px;
            width: 100%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

            .btn-submit:hover {
                background-color: #c7c7c7; /* Fondo gris claro */
                color: #1e1e2f;
            }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <h2>Recuperación de Contraseña</h2>

            <!-- Mensaje informativo -->
            <div class="message">
                <asp:Label ID="lblCorreo" runat="server" Text="Label"></asp:Label>
            </div>

            <!-- Ingreso del código -->
            <div class="form-group">
                <label for="TextBox1">Ingresa el código</label>
                <asp:TextBox ID="txtCodigo" runat="server" CssClass="input-field" />
            </div>

            <!-- Mensaje de error -->

            <!-- Botón de verificación -->
            <asp:Button ID="Button1" runat="server" CssClass="btn-submit" Text="Verificar" OnClick="Button1_Click" />
            <asp:Label ID="lblAlertas" runat="server" Text="Label"></asp:Label>
        </div>
    </form>

</body>
</html>
