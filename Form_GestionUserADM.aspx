<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_GestionUserADM.aspx.cs" Inherits="Proyecto_Analisis2.Form_GestionUserADM" ValidateRequest="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Usuarios</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1a1a2e;
            background-image: url('Imagenes/FondoADMdesenfoque.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }
        .header {
            text-align: center;
            font-size: 24px;
            color: #ff8c42;
            padding: 10px;
            border-bottom: 3px solid #ff8c42;
        }
        .form-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background-color: #1e1e3f;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            color: #f5f5f5;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #33334d;
            border-radius: 5px;
            background-color: #2e2e52;
            color: #f5f5f5;
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
            background-color: #ff8c42;
        }
        .edit-btn {
            background-color: #2e2e52;
        }
        .delete-btn {
            background-color: #e74c3c;
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
            border-bottom: 1px solid #33334d;
            color: white;
        }
        .user-table th {
            background-color: #2e2e52;
            font-weight: bold;
            color: #ff8c42;
        }
        .user-table tr:nth-child(even) {
            background-color: #1a1a2e;
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
                <label for="contrasena">Contraseña:</label>
                <asp:TextBox runat="server" ID="txtContrasena" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="rol">Rol:</label>
                <asp:DropDownList runat="server" ID="ddlRol" CssClass="form-control">
                    <asp:ListItem Value="1">Usuario</asp:ListItem>
                    <asp:ListItem Value="2">Aprobador Jefe</asp:ListItem>
                    <asp:ListItem Value="3">Aprobador Financiero</asp:ListItem>
                    <asp:ListItem Value="4">Administrador</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="button-container">
                <asp:Button runat="server" ID="btnGuardar" CssClass="save-btn" Text="Guardar" OnClick="btnGuardar_Click" />
                <asp:Button runat="server" ID="btnActualizar" CssClass="edit-btn" Text="Actualizar" OnClick="btnEditar_Click" />
                <asp:Button runat="server" ID="btnEliminar" CssClass="delete-btn" Text="Eliminar" OnClick="btnEliminar_Click" />
                 <asp:Button ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" />
                <br />
                z<asp:Label ID="lblMensaje" runat="server" ForeColor="White"></asp:Label>
            </div>
        </div>

        <asp:GridView runat="server" ID="gvUsuarios" AutoGenerateColumns="False" CssClass="user-table" OnSelectedIndexChanged="gvUsuarios_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="UsuarioID" HeaderText="ID" />
                <asp:BoundField DataField="Cedula" HeaderText="Cédula" />
                <asp:BoundField DataField="NombreUsuario" HeaderText="Nombre" />
                <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                <asp:BoundField DataField="CorreoElectronico" HeaderText="Correo" />
                <asp:BoundField DataField="RolID" HeaderText="Rol" />
                <asp:ButtonField Text="Seleccionar" CommandName="Select" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>

