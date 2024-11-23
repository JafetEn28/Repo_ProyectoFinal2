<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_DetallesSolicitudJEFE.aspx.cs" Inherits="Proyecto_Analisis2.Form_Menu_Jefe" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Detalles de Solicitud</title>
    <style type="text/css">
        /* Estilos generales */
        body {
            background-color: #121212;
             background-image: url('Imagenes/FondoNegroDesenfoque.png');
             background-size: cover;
             background-repeat: no-repeat;
             background-position: center;
            color: #E0E0E0;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            min-height: 100vh;
        }

        /* Contenedor principal */
        .form-container {
            padding: 50px;
            max-width: 1000px;
            margin-top: 60px; /* Caja más abajo */
            background-color: #1E1E1E;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        /* Título */
        .form-title {
            text-align: center;
            font-size: 1.8em;
            color: #FFC300;
            margin-bottom: 30px; /* Mayor separación */
        }

        /* Etiquetas */
        .form-label {
            color: #FFC300;
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
        }

        /* Entradas de texto */
        .form-input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #FFC300;
            border-radius: 5px;
            background-color: #2C2C2C;
            color: #E0E0E0;
        }

        .form-input:focus {
            outline: none;
            border-color: #FF5733;
        }

        .form-input[readonly] {
            background-color: #444444; /* Fondo gris para cajas no editables */
        }

        /* Botones */
        .form-button {
            background-color: #001D3D;
            color: #FFC300;
            border: none;
            padding: 15px 30px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2em;
            transition: background-color 0.3s;
            flex: 1; /* Hacerlos más grandes */
        }

        .form-button:hover {
            background-color: #FF5733;
        }

        /* Fila de botones */
        .button-row {
            display: flex;
            justify-content: space-evenly;
            margin-top: 30px;
        }

        /* Ajustes generales de fila */
        .form-row {
            margin-bottom: 20px;
        }
        .auto-style1 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #001D3D;
            color: #FFC300;
            padding: 15px 30px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2em;
            transition: background-color 0.3s;
            flex: 1;
            margin-left: 41px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <!-- Título del formulario -->
            <div class="form-title">
                Detalles de Solicitud
            </div>

            <!-- Fila de ID -->
            <div class="form-row">
                <label class="form-label" for="TextBox7">ID:</label>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
            </div>

            <!-- Fila de Descripción -->
            <div class="form-row">
                <label class="form-label" for="TextBox2">Descripción:</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
            </div>

            <!-- Fila de Cantidad -->
            <div class="form-row">
                <label class="form-label" for="TextBox3">Cantidad:</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
            </div>

            <!-- Fila de Costo -->
            <div class="form-row">
                <label class="form-label" for="TextBox4">Costo:</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
            </div>

            <!-- Fila de Justificación comprador -->
            <div class="form-row">
                <label class="form-label" for="TextBox5">Justificación comprador:</label>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
            </div>

            <!-- Fila de Detalle aprobador jefe -->
            <div class="form-row">
                <label class="form-label" for="TextBox6">Detalle aprobador jefe:</label>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-input"></asp:TextBox>
            </div>

            <!-- Fila de botones -->
            <div class="button-row">
                <asp:Button ID="Button1" runat="server" CssClass="form-button" Text="Aceptar" />
                <asp:Button ID="Button2" runat="server" CssClass="auto-style1" Text="Rechazar" />
            </div>
        </div>
    </form>
</body>
</html>
