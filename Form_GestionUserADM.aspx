<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_GestionUserADM.aspx.cs" Inherits="Proyecto_Analisis2.Form_GestionUserADM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Usuarios</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1a1a2e; /* Color de fondo del cuerpo */
            background-image: url('Imagenes/FondoADMdesenfoque.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }
        .header {
            text-align: center;
            font-size: 24px;
            color: #ff8c42; /* Color del encabezado */
            padding: 10px;
            border-bottom: 3px solid #ff8c42; /* Línea debajo del encabezado */
        }
        .form-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background-color: #1e1e3f; /* Fondo del formulario */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            color: #f5f5f5; /* Color de las etiquetas */
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #33334d; /* Color de borde de inputs */
            border-radius: 5px;
            background-color: #2e2e52; /* Fondo de inputs */
            color: #f5f5f5; /* Color de texto en inputs */
        }
        .form-group input:focus,
        .form-group select:focus {
            border-color: #ff8c42; /* Color de borde al enfocarse */
            outline: none;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button-container input {
            padding: 10px 20px;
            margin: 0 5px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }
        .save-btn {
            background-color: #ff8c42; /* Botón Guardar */
        }
        .edit-btn {
            background-color: #2e2e52; /* Botón Editar */
        }
        .delete-btn {
            background-color: #e74c3c; /* Botón Eliminar */
        }
        .user-table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        .user-table th,
        .user-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #33334d; /* Color de los bordes de la tabla */
            color: white;
        }
        .user-table th {
            background-color: #2e2e52; /* Fondo de las cabeceras */
            font-weight: bold;
            color: #ff8c42; /* Color de texto de las cabeceras */
        }
        .user-table tr:nth-child(even) {
            background-color: #1a1a2e; /* Fondo alterno de filas */
        }
        .auto-style1 {
            color: #FFFFFF;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="header">Gestión de Usuarios</div>

    <form runat="server">
        <div class="form-container">
            <div class="form-group">
                <label for="cedula">Cédula:</label>
                <asp:TextBox runat="server" ID="txtCedula" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="idUsuario">ID Usuario:</label>
                <asp:TextBox runat="server" ID="txtIdUsuario" CssClass="form-control" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="correo">Correo:</label>
                <asp:TextBox runat="server" ID="txtCorreo" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="rol">Rol:</label>
                <asp:DropDownList runat="server" ID="ddlRol" CssClass="form-control">
    <asp:ListItem Value="1">Comprador</asp:ListItem>
    <asp:ListItem Value="2">Aprobador Jefe</asp:ListItem>
    <asp:ListItem Value="3">Aprobador Financiero</asp:ListItem>
                    <asp:ListItem Value="4">Administrador</asp:ListItem>
</asp:DropDownList>

                <br />
                <label for="telefono">Contraseña:<br />
                <asp:TextBox runat="server" ID="txtContra" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </label>
                <br />
                <br />
                <br />
            </div>

            <div class="button-container">
                <asp:Button runat="server" ID="btnGuardar" CssClass="save-btn" Text="Guardar" OnClick="btnGuardar_Click" />
                <asp:Button runat="server" ID="btnEditar" CssClass="edit-btn" Text="Editar" OnClick="btnEditar_Click" Width="103px" />
                <asp:Button runat="server" ID="btnEliminar" CssClass="delete-btn" Text="Eliminar" OnClick="btnEliminar_Click" />
                <br />
                <asp:Label ID="lblMensaje" runat="server" CssClass="auto-style1" Text="Label"></asp:Label>
            </div>
        </div>

        <table class="user-table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Cédula</th>
            <th>Nombre</th>
            <th>Teléfono</th>
            <th>Correo</th>
            <th>Rol</th>
        </tr>
    </thead>
    <tbody id="userTableBody" runat="server">
        <!-- Aquí se cargarán las filas con los datos -->
    </tbody>
</table>

        <p class="auto-style2">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="Label"></asp:Label>
        </p>
    </form>
</body>
</html>
