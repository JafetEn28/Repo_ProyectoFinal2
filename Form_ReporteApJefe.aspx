<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_ReporteApJefe.aspx.cs" Inherits="Proyecto_Analisis2.Form_ReporteApJefe" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reportes</title>
    <style type="text/css">
        /* Asegurar que el cuerpo ocupe toda la pantalla */
        html, body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100vh;
            background-color: #121212;
            background-image: url('Imagenes/FondoNegroDesenfoque.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: #E0E0E0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            width: 100%;
            max-width: 1200px; /* Ajusta según el ancho máximo deseado */
            padding: 20px;
            background-color: #1E1E1E;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .form-title {
            text-align: center;
            font-size: 2em;
            color: #FFC300;
            margin-bottom: 20px;
            border-bottom: 2px solid #FFC300;
            padding-bottom: 10px;
        }

        .form-row {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .form-label {
            color: #FFC300;
            font-weight: bold;
            flex: 1;
        }

        .form-select {
            flex: 2;
            padding: 10px;
            border: 1px solid #FFC300;
            border-radius: 5px;
            background-color: #2C2C2C;
            color: #E0E0E0;
        }

        .form-select:focus {
            border-color: #FF5733;
            outline: none;
        }

        .button-row {
            text-align: center;
            margin-top: 20px;
        }

        .form-button {
            background-color: #001D3D;
            color: #FFC300;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: all 0.3s ease;
            margin: 5px;
        }

        .form-button:hover {
            background-color: #FF5733;
        }

        .grid-container {
            margin-top: 20px;
            overflow-x: auto; /* Permite el desplazamiento horizontal si la tabla es muy grande */
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            background-color: #2C2C2C;
            color: #E0E0E0;
        }

        .grid-view th,
        .grid-view td {
            padding: 10px;
            border: 1px solid #FFC300;
            text-align: center;
        }

        .grid-view th {
            background-color: #001D3D;
            color: #FFC300;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <div class="form-title">Reportes</div>

            <div class="form-row">
                <label for="DropDownList1" class="form-label">Estado:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
                    <asp:ListItem Selected="True">Todas</asp:ListItem>
                    <asp:ListItem>Aprobadas</asp:ListItem>
                    <asp:ListItem>Rechazadas</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-row">
                <label for="DropDownList2" class="form-label">Rango de requisición:</label>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select">
                    <asp:ListItem>1 - 100 000</asp:ListItem>
                    <asp:ListItem Selected="True">100 000 - 1 000 000</asp:ListItem>
                    <asp:ListItem>+1 000 000</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="button-row">
                <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="form-button" />
                <asp:Button ID="btnDescargar" runat="server" Text="Descargar" CssClass="form-button" />
            </div>

            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grid-view">
                    <Columns>
                        <asp:BoundField DataField="AprobacionID" HeaderText="Aprobación ID" />
                        <asp:BoundField DataField="RequisicionID" HeaderText="Requisición ID" />
                        <asp:BoundField DataField="AprobadorID" HeaderText="Aprobador ID" />
                        <asp:BoundField DataField="FechaAprobacion" HeaderText="Fecha Aprobación" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>