<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_ReporteFin_3.aspx.cs" Inherits="Proyecto_Analisis2.Form_ReporteFin_3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Reportes Financieros (+1000.000)</title>
    <style>
        body {
            background-color: #2B3A55;
            background-image: url('Imagenes/FondoFinanDesenfoque.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: #F1F6F9;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #394867;
            border-radius: 10px;
        }

        .filters {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }

            .filters button {
                background-color: #2B3A55;
                color: #A2D2FF;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }

                .filters button:hover {
                    background-color: #4C5B7C;
                }

        .grid-container {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #394867;
            color: #A2D2FF;
            padding: 10px;
        }

        td {
            background-color: #2B3A55;
            color: #F1F6F9;
            padding: 10px;
            text-align: center;
        }

        .btn-detail {
            background-color: #4C5B7C;
            color: #A2D2FF;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .auto-style1 {
            text-align: center;
        }

        .auto-style2 {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #394867;
            border-radius: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style2">
            <h2 class="auto-style1">Reportes Financieros (+1000.000)</h2>
            <div class="filters" role="group" aria-label="Filtros de requisiciones">
                <button id="btnTodas" runat="server" aria-label="Mostrar todas las requisiciones">Todas</button>
                <button id="btnEnProceso" runat="server" aria-label="Mostrar requisiciones en proceso">En Proceso</button>
                <button id="btnAprobadas" runat="server" aria-label="Mostrar requisiciones aprobadas">Aprobadas</button>
                <button id="btnRechazadas" runat="server" aria-label="Mostrar requisiciones rechazadas">Rechazadas</button>
            </div>
            <div class="grid-container">
                <asp:GridView ID="GridViewRequisiciones" runat="server" AutoGenerateColumns="False" CssClass="grid-view">
                    <Columns>
                        <asp:BoundField DataField="Usuario" HeaderText="ID Usuario" SortExpression="Usuario" />
                        <asp:BoundField DataField="IdRequisicion" HeaderText="ID Requisición" SortExpression="IdRequisicion" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" SortExpression="Descripcion" />
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                        <asp:BoundField DataField="Costo" HeaderText="Costo" SortExpression="Costo" />
                        <asp:BoundField DataField="ComentarioJefe" HeaderText="Comentario Jefe" SortExpression="ComentarioJefe" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                    </Columns>
                </asp:GridView>
            </div>
            <button class="btn-detail" id="btnVerDetalle" runat="server">Ver detalle</button>
        </div>
    </form>
</body>
</html>

