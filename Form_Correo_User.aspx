<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Correo_User.aspx.cs" Inherits="Proyecto_Analisis2.Form_Correo_User" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Bandeja de Entrada</title>
    <style>
        body {
    margin: 0;
    padding: 0;
    background-color: #1e1e2f;
    background-image: url('Imagenes/AzulUserDesenfoque.png');
    background-size: 100% auto; /* La imagen ocupa todo el ancho sin recortar el alto */
    background-repeat: no-repeat;
    background-position: top center; /* Centra la imagen horizontalmente y alinea al inicio */
    font-family: Arial, sans-serif;
    color: #ffffff;
    min-height: 100vh; /* Asegura que el cuerpo siempre ocupe el 100% de la altura de la pantalla */
}


        h2 {
            color: #00c4b4;
            text-align: center;
            padding-top: 20px;
        }

        .email-list {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            color: #c7c7c7;
        }

        .email-list th, .email-list td {
            padding: 15px;
            border: 1px solid #444;
        }

        .email-list th {
            background-color: #2a2a3d;
            color: #ffffff;
            text-align: left;
        }

        .email-list td {
            background-color: #1e1e2f;
        }

        .email-list tr:hover {
            background-color: #00c4b4;
            color: #1e1e2f;
        }

        footer {
            background-color: #2a2a3d;
            color: #c7c7c7;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            overflow: auto;
            padding-top: 60px;
        }

        .modal-content {
            background-color: #2a2a3d;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            color: #c7c7c7;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #00c4b4;
            text-decoration: none;
            cursor: pointer;
        }

        .email-body {
            margin-top: 15px;
            font-size: 1.1em;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Bandeja de Entrada</h2>

            <!-- Contenedor de la lista de correos -->
            <asp:GridView ID="gvCorreos" runat="server" AutoGenerateColumns="False" CssClass="email-list" 
                OnRowDataBound="gvCorreos_RowDataBound" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Asunto" HeaderText="Asunto" SortExpression="Asunto" />
                    <asp:BoundField DataField="Remitente" HeaderText="Remitente" SortExpression="Remitente" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <!-- Botón para ver el correo -->
                            <button type="button" class="view-btn" onclick="openModal('<%# Eval("Cuerpo") %>')">Ver</button>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <!-- Modal para mostrar el cuerpo del correo -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h3>Detalles del Correo</h3>
                <div id="emailBody" class="email-body"></div>
            </div>
        </div>

        <footer>
            Usuario Comprador
        </footer>
    </form>

    <script>
        // Función para abrir el modal con el cuerpo del correo
        function openModal(cuerpoCorreo) {
            document.getElementById("emailBody").innerHTML = cuerpoCorreo;
            document.getElementById("myModal").style.display = "block";
        }

        // Función para cerrar el modal
        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }

        // Cerrar el modal si el usuario hace clic fuera de él
        window.onclick = function(event) {
            if (event.target == document.getElementById("myModal")) {
                closeModal();
            }
        }
    </script>
</body>
</html>
