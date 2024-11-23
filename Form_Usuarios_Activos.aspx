<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Usuarios_Activos.aspx.cs" Inherits="Proyecto_Analisis2.Form_Usuarios_Activos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Usuarios Activos</title>
    <style type="text/css">
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #1a1a2e;
            background-image: url('Imagenes/FondoADMdesenfoque.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: #f5f5f5;
        }
        .header {
            text-align: center;
            font-size: 28px;
            color: #ff8c42;
            padding: 20px;
            margin-bottom: 40px; /* Aumenta el espacio debajo del título */
        }
        .table-container {
            max-width: 800px;
            margin: auto;
            background-color: #1e1e3f;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .user-table {
            width: 100%;
            border-collapse: collapse;
            color: #ffffff;
            margin-bottom: 20px;
        }
        .user-table th,
        .user-table td {
            padding: 10px;
            border: 1px solid #33334d;
        }
        .user-table th {
            background-color: #2e2e52;
            font-weight: bold;
            color: #ff8c42;
        }
        .user-table tr:nth-child(even) {
            background-color: #1a1a2e;
        }
        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 10px;
        }
        .button-container button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            color: #fff;
            background-color: #ff8c42;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .button-container button:hover {
            background-color: #ffa366;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Encabezado -->
        <div class="header">Gestión de Usuarios Activos</div>

        <!-- Contenedor de la Tabla -->
        <div class="table-container">
            <table class="user-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Cédula</th>
                        <th>Nombre</th>
                        <th>Teléfono</th>
                        <th>Correo</th>
                        <th>Rol</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>123456789</td>
                        <td>Juan Pérez</td>
                        <td>555-1234</td>
                        <td>juan@example.com</td>
                        <td>Financiero</td>
                        <td>Activo</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>987654321</td>
                        <td>María López</td>
                        <td>555-5678</td>
                        <td>maria@example.com</td>
                        <td>Usuario</td>
                        <td>Inactivo</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>567891234</td>
                        <td>Carlos González</td>
                        <td>555-9876</td>
                        <td>carlos@example.com</td>
                        <td>Jefe</td>
                        <td>Activo</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Botones de Acción -->
        <div class="button-container">
            <button type="button" class="activate-btn">✔ Activar Usuario</button>
            <button type="button" class="deactivate-btn">✖ Inactivar Usuario</button>
        </div>
    </form>
</body>
</html>
