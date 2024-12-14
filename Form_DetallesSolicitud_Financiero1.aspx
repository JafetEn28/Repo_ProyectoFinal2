<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_DetallesSolicitud_Financiero1.aspx.cs" Inherits="Proyecto_Analisis2.Form_DetallesSolicitud_Financiero" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Financiero (1 - 100,000)</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #2B3A55;
            background-image: url('Imagenes/FondoFinanDesenfoque.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: #F1F6F9;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
        }

        .container {
            width: 900px;
            background-color: #394867;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #A2D2FF;
            margin-bottom: 20px;
        }

        .grid-container {
            width: 100%;
            margin-bottom: 20px;
            border: 1px solid #A2D2FF;
            border-radius: 10px;
            padding: 0;
            overflow: hidden;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            color: #F1F6F9;
        }

        th {
            background-color: #2B3A55;
        }

        td {
            background-color: #3A4A6B;
        }

        .form-container {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 15px;
            border: 1px solid #A2D2FF;
            border-radius: 10px;
            padding: 15px;
            background-color: #3A4A6B;
            margin-top: 10px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], textarea {
            width: 90%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #F1F6F9;
            color: #2B3A55;
        }

        .button-container {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        button {
            width: 150px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #2B3A55;
            color: #F1F6F9;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

            button:hover {
                background-color: #A2D2FF;
                color: #2B3A55;
            }
        .auto-style1 {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 15px;
            border: 1px solid #A2D2FF;
            border-radius: 10px;
            padding: 15px;
            background-color: #3A4A6B;
            margin-top: 10px;
            width: 872px;
            height: 419px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Financiero (1 - 100.000)</h1>

        <!-- Contenedor del DataGrid -->
        <div class="grid-container">
            <table>
                <thead>
                    <tr>
                        <th>ID Usuario</th>
                        <th>ID Requisición</th>
                        <th>Descripción</th>
                        <th>Cantidad</th>
                        <th>Costo</th>
                        <th>Comentario Jefe</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>USR001</td>
                        <td>REQ1001</td>
                        <td>Compra de equipos de oficina</td>
                        <td>10</td>
                        <td>₡50,000</td>
                        <td>Aprobado para compra</td>
                        <td>Pendiente</td>
                    </tr>
                    <tr>
                        <td>USR002</td>
                        <td>REQ1002</td>
                        <td>Material de construcción</td>
                        <td>5</td>
                        <td>₡120,000</td>
                        <td>Requiere revisión</td>
                        <td>Rechazado</td>
                    </tr>
                    <tr>
                        <td>USR003</td>
                        <td>REQ1003</td>
                        <td>Compra de software</td>
                        <td>1</td>
                        <td>₡95,000</td>
                        <td>Urgente</td>
                        <td>Aprobado</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Contenedor del formulario -->
        <div class="auto-style1">
            <label for="idUsuario">ID Usuario:</label>
            <input type="text" id="idUsuario" name="idUsuario" value="USR001" readonly="readonly" />

            <label for="idRequisicion">
            <br />
            ID Requisición:</label>
            <input type="text" id="idRequisicion" name="idRequisicion" value="REQ1001" readonly="readonly" />

            <label for="descripcion">Descripción:</label>
            <input type="text" id="descripcion" name="descripcion" value="Compra de equipos de oficina" readonly="readonly" />

            <label for="cantidad">
            <br />
            Cantidad:<br />
            </label>
            &nbsp;<input type="text" id="cantidad" name="cantidad" value="10" readonly="readonly" />

            <label for="costo">
            <br />
            Costo:<br />
            </label>
            &nbsp;<input type="text" id="costo" name="costo" value="₡50,000" readonly="readonly" />

            <label for="comentarioJefe">Comentario Jefe:</label>
            <textarea id="comentarioJefe" name="comentarioJefe" rows="2" readonly="readonly">Aprobado para compra</textarea>

            <label for="comentarioFinanciero">Comentario Financiero:</label>&nbsp;
            <br />
            <textarea id="comentarioFinanciero" name="comentarioFinanciero" rows="2" cols="20"></textarea></div>

        <!-- Contenedor de botones -->
        <div class="button-container">
            <button type="button" onclick="aceptar()">Aceptar</button>
            <button type="button" onclick="rechazar()">Rechazar</button>
        </div>
    </div>

    <script>
        function aceptar() {
            alert("Requisición aceptada");
        }

        function rechazar() {
            alert("Requisición rechazada");
        }
    </script>
</body>
</html>
