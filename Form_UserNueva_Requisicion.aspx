<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_UserNueva_Requisicion.aspx.cs" Inherits="Proyecto_Analisis2.Nueva_Requisicion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Nueva Requisición</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #1e1e2f;
            background-image: url('Imagenes/AzulUserDesenfoque.png');
background-size: cover;
background-repeat: no-repeat;
background-position: center;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            width: 100vw;
        }
        .container {
            width: 200%; /* Ajusta el tamaño al 90% del ancho de la pantalla */
            max-width: 1200px; /* Máximo ancho para que no se vea demasiado grande */
            height: 80%; /* Ocupa el 80% de la altura de la pantalla */
            background-color: #2a2a3d;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            
        }

        .container {
             margin-left: -110px; /* Empuja el contenedor a la derecha */
             margin-right: auto; /* Centra el contenedor */
        }

        h2 {
            text-align: center;
            color: #00c4b4;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
            flex: 1;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-size: 1.2em;
        }
        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 15px;
            font-size: 1.1em;
            color: #ffffff;
            background-color: #3a3a4f;
            border: 1px solid #555;
            border-radius: 5px;
            margin-top: 5px;
        }
        textarea {
            resize: none;
            height: 150px;
        }
        button {
            width: 100%;
            padding: 20px;
            font-size: 1.3em;
            color: #ffffff;
            background-color: #00c4b4;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
        }
        button:hover {
            background-color: #00a394;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
    <h2>Nueva Requisición</h2>

    <div class="form-group">
        <label for="txtDescripcion">Descripción</label>
        <asp:TextBox ID="txtDescripcion" runat="server" placeholder="Ingrese la descripción del producto"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtCantidad">Cantidad</label>
        <asp:TextBox ID="txtCantidad" runat="server" placeholder="Ingrese la cantidad" TextMode="Number"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtCosto">Costo</label>
        <asp:TextBox ID="txtCosto" runat="server" placeholder="Ingrese el costo unitario"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="txtJustificacion">Justificación</label>
        <asp:TextBox ID="txtJustificacion" runat="server" placeholder="Ingrese la justificación" TextMode="MultiLine"></asp:TextBox>
    </div>

    <button type="submit" runat="server" onserverclick="btnEnviar_Click">Enviar Requisición</button>
</div>

    </form>
</body>
</html>
