<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Gestion_Usuario.aspx.cs" Inherits="Proyecto_Analisis2.Form_Prin_Admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gestion de Usuarios</title>
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
    .button-container button {
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
</style>

<div class="header">Gestión de Usuarios</div>

<div class="form-container">
    <div class="form-group">
        <label for="cedula">Cédula:</label>
        <input type="text" id="cedula" />
    </div>
    <div class="form-group">
        <label for="idUsuario">ID Usuario:</label>
        <input type="text" id="idUsuario" />
    </div>
    <div class="form-group">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" />
    </div>
    <div class="form-group">
        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" />
    </div>
    <div class="form-group">
        <label for="correo">Correo:</label>
        <input type="email" id="correo" />
    </div>
    <div class="form-group">
        <label for="rol">Rol:</label>
        <select id="rol">
            <option value="comprador">Comprador</option>
            <option value="aprobador_jefe">Aprobador jefe</option>
            <option value="aprobador_financiero">Aprobador financiero</option>
        </select>
    </div>
    <div class="button-container">
        <button class="save-btn">Guardar</button>
        <button class="edit-btn">Editar</button>
        <button class="delete-btn">Eliminar</button>
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
            <th>Departamento</th>
        </tr>
    </thead>
    <tbody>
        <!-- Aquí se rellenarán los datos de los usuarios -->
        <tr>
            <td>1</td>
            <td>123456789</td>
            <td>Juan Pérez</td>
            <td>555-1234</td>
            <td>juan@example.com</td>
            <td>Compras</td>
        </tr>
    </tbody>
</table>
    </head>
    </html>
