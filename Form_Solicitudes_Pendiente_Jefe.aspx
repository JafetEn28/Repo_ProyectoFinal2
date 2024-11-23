<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Solicitudes_Pendiente_Jefe.aspx.cs" Inherits="Proyecto_Analisis2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Solicitudes Pendientes</title>
    <style type="text/css">
        body {
            background-color: #0D1117;

            background-image: url('Imagenes/FondoNegroDesenfoque.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;    


            color: #C9D1D9;
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #161B22;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
            width: 90%;
            max-width: 700px;
            text-align: center;
        }

        h1 {
            color: #FFD700;
            font-size: 2em;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .table-container {
            width: 100%;
            margin: 20px 0;
            background-color: #0D1117;
            border-radius: 8px;
            overflow: hidden;
        }

        .grid-container {
            width: 100%;
            border-collapse: collapse;
        }

        .grid-container th, .grid-container td {
            padding: 12px;
            text-align: center;
            color: #C9D1D9;
        }

        .grid-container th {
            background-color: #21262D;
            font-weight: bold;
        }

        .grid-container tr:nth-child(even) {
            background-color: #161B22;
        }

        .grid-container tr:hover {
            background-color: #1F6FEB;
            color: #FFF;
        }

        .report-label {
            color: #FFD700;
            font-size: 1em;
            margin-top: 20px;
            display: inline-block;
        }

        .button-container {
            margin-top: 25px;
        }

        .btn-view {
            background-color: #1F6FEB;
            color: #FFF;
            border: none;
            padding: 12px 24px;
            font-size: 1em;
            cursor: pointer;
            border-radius: 6px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-view:hover {
            background-color: #FFD700;
            color: #0D1117;
            transform: scale(1.05);
        }

        .btn-view:active {
            transform: scale(0.95);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Solicitudes Pendientes</h1>
        <div class="table-container">
            <asp:GridView ID="GridView1" runat="server" CssClass="grid-container" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Estatus" HeaderText="Estatus" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd}" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="report-label">
        </div>

        <div class="button-container">
            <asp:Button ID="Button3" runat="server" CssClass="btn-view" Text="Ver" />
        </div>
    </form>
</body>
</html>
