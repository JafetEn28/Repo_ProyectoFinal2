<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Historial_Reportes.aspx.cs" Inherits="Proyecto_Analisis2.Form_Historial_Reportes" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <title>Historial y Reportes</title>
    <style>
        /* Ajustes generales */
        body {
            font-family: Arial, sans-serif;
            background-color: #1e1e2f;
            background-image: url('Imagenes/AzulUserDesenfoque.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: #c7c7c7;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            width: 520%;
            max-width: 800px;
            background-color: #2a2a3d;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .container{
            margin-left: -40%;
            position: relative;
            top: -220px; /* Ajusta el valor negativo para mover hacia arriba y positivo para mover hacia abajo */
        }

        h1 {
            font-size: 24px;
            color: #00c4b4;
            margin-bottom: 20px;
        }

        .combo-box {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .combo-box label {
            font-size: 14px;
            color: #c7c7c7;
            margin-right: 10px;
        }

        .dropdown {
            padding: 8px;
            border: 1px solid #00c4b4;
            border-radius: 4px;
            background-color: #1e1e2f;
            color: #c7c7c7;
            min-width: 200px;
        }

        .buttons {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            gap: 10px;
            flex-wrap: wrap;
        }

        .button {
            flex: 1;
            padding: 10px;
            background-color: #00c4b4;
            border: none;
            border-radius: 4px;
            color: #1e1e2f;
            cursor: pointer;
            font-weight: bold;
            text-align: center;
        }

        .button:hover {
            background-color: #00a994;
        }

        .data-grid {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .data-grid th,
        .data-grid td {
            padding: 10px;
            border: 1px solid #00c4b4;
            text-align: left;
        }

        .data-grid th {
            background-color: #2a2a3d;
            color: #00c4b4;
        }

        .data-grid td {
            background-color: #1e1e2f;
            color: #c7c7c7;
        }

        .details-button {
            width: 100%;
            padding: 10px;
            background-color: #00c4b4;
            border: none;
            border-radius: 4px;
            color: #1e1e2f;
            font-weight: bold;
            cursor: pointer;
        }

        .details-button:hover {
            background-color: #00a994;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Historial y Reportes</h1>
            <div class="combo-box">
                <label for="requisitionId">ID Requisición:</label>
                <asp:DropDownList ID="requisitionId" runat="server" CssClass="dropdown" Width="197px">
                </asp:DropDownList>
            </div>
            <div class="buttons">
                <asp:Button ID="btnTodas" runat="server" Text="Todas" CssClass="button" />
                <asp:Button ID="btnEnProceso" runat="server" Text="En Proceso" CssClass="button" />
                <asp:Button ID="btnAprobadas" runat="server" Text="Aprobadas" CssClass="button" />
                <asp:Button ID="btnRechazadas" runat="server" Text="Rechazadas" CssClass="button" />
            </div>
            <asp:GridView ID="gridViewRequisiciones" runat="server" CssClass="data-grid">
            </asp:GridView>
            <asp:Button ID="btnVerDetalles" runat="server" Text="Ver detalles" CssClass="details-button" />
        </div>
    </form>
</body>
</html>
