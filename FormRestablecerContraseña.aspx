<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormRestablecerContraseña.aspx.cs" Inherits="Proyecto_Analisis2.FormRestablecerContraseña" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Restablecer Contraseña</title>
    <style type="text/css">
        /* Estilo global */
        body {
            font-family: Arial, sans-serif;
            background-color: #1e1e2f; /* Fondo oscuro */
            background-image: url('Imagenes/FondoLogin.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: #c7c7c7; /* Texto gris claro */
            margin: 0;
            padding: 0;
        }

        /* Contenedor principal */
        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #2a2a3d; /* Fondo gris oscuro */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 196, 180, 0.5); /* Sombra verde clara */
        }

        h2 {
            text-align: center;
            color: #00c4b4; /* Verde claro */
            font-size: 2em;
            margin-bottom: 20px;
        }

        /* Estilo de los campos */
        .input-field {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #00c4b4; /* Borde verde claro */
            border-radius: 5px;
            background-color: #1e1e2f; /* Fondo oscuro */
            color: #c7c7c7; /* Texto gris claro */
        }

            .input-field:focus {
                outline: none;
                border-color: #00c4b4; /* Borde verde claro */
            }

        /* Estilo para el botón */
        .btn-submit {
            background-color: #00c4b4; /* Fondo verde claro */
            color: #2a2a3d; /* Texto gris oscuro */
            font-size: 1.1em;
            padding: 12px 20px;
            width: 100%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            .btn-submit:hover {
                background-color: #c7c7c7; /* Fondo gris claro */
                color: #1e1e2f; /* Texto oscuro */
            }

        .error-message {
            color: #FF0000; /* Rojo para los mensajes de error */
            font-size: 0.9em;
            margin-top: -15px;
        }

        /* Espaciado y estructura del formulario */
        .form-group {
            margin-bottom: 25px;
        }

            .form-group label {
                font-size: 1.1em;
                display: block;
                margin-bottom: 8px;
            }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <h2>Restablecer Contraseña</h2>

            <!-- Nueva contraseña -->
            <div class="form-group">
                <label for="TextBox3">Digite la nueva contraseña</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="input-field" TextMode="Password"></asp:TextBox>
            </div>

            <!-- Confirmar contraseña -->
            <div class="form-group">
                <label for="TextBox2">Confirmar contraseña</label>
                <asp:TextBox ID="txtContra" runat="server" CssClass="input-field" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator
                    ID="CompareValidator2"
                    runat="server"
                    ControlToCompare="TextBox3"
                    ControlToValidate="txtContra"
                    ErrorMessage="Las contraseñas no coinciden"
                    ForeColor="Red"
                    CssClass="error-message" />
            </div>

            <!-- Botón Guardar -->
            <div class="form-group">
                <asp:Button ID="Button1" runat="server" CssClass="btn-submit" Text="Guardar" OnClick="Button1_Click" />
            </div>
        </div>
    </form>

</body>
</html>
