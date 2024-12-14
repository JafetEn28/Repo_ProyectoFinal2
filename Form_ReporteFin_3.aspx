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
                <asp:Button ID="Button1" runat="server" Text="Todas" Width="79px" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Aprobadas" OnClick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" Text="En proceso" OnClick="Button3_Click" />
                <asp:Button ID="Button4" runat="server" Text="Rechazadas" OnClick="Button4_Click" />
            </div>
            <div class="grid-container">
                                        <asp:GridView ID="GridViewRequisiciones" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewRequisiciones_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="RequisicionID" HeaderText="ID" />
        <asp:BoundField DataField="FechaCreacion" HeaderText="Fecha de Creación" />
        <asp:BoundField DataField="Monto" HeaderText="Monto" />
        <asp:BoundField DataField="Estado" HeaderText="Estado" />
        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
        <asp:BoundField DataField="Justificacion" HeaderText="Justificación" />
        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
    </Columns>
</asp:GridView>
                <br />
                <asp:Button ID="Button5" runat="server" Height="33px" OnClick="Button5_Click" Text="Rechazar" Width="78px" />
                <asp:Button ID="Button6" runat="server" Height="33px" OnClick="Button6_Click" Text="Aprobar" Width="80px" />
                <asp:Label ID="lblAlertas" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

