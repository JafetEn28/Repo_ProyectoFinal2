<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Perfil_user.aspx.cs" Inherits="Proyecto_Analisis2.Form_Perfil_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Perfil de Usuario</title>
    <style type="text/css">
        body {
            background-color: #1e1e2f;
            background-image: url('Imagenes/AzulUserDesenfoque.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: #c7c7c7;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .container {
            background-color: #2a2a3d;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
        }
        
        h1 {
            color: #00c4b4;
            margin-bottom: 30px;
            font-size: 24px;
        }
        
        .info-label {
            color: #c7c7c7;
            font-weight: bold;
            text-align: left;
            display: block;
            margin-bottom: 5px;
        }
        
        .info-text {
            background-color: #1e1e2f;
            color: #c7c7c7;
            padding: 10px;
            border: 1px solid #00c4b4;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
            text-align: left;
        }

        .section {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Perfil de Usuario</h1>
            
            <div class="section">
                <label class="info-label">Cédula:</label>
                <div class="info-text">20106888</div>
            </div>
            
            <div class="section">
                <label class="info-label">Nombre:</label>
                <div class="info-text">JOEL</div>
            </div>
            
            <div class="section">
                <label class="info-label">Teléfono:</label>
                <div class="info-text">8856 6698</div>
            </div>
            
            <div class="section">
                <label class="info-label">Correo:</label>
                <div class="info-text">joelhou@gmail.com</div>
            </div>
            
            <div class="section">
                <label class="info-label">Departamento:</label>
                <div class="info-text">Contabilidad</div>
            </div>
        </div>
    </form>
</body>
</html>
