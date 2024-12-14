<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_DetallesSolicitudJEFE.aspx.cs" Inherits="Proyecto_Analisis2.Form_DetallesSolicitudJEFE" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<<<<<<< Updated upstream
        <div class="form-container">
        
            <div class="form-title">
                Detalles de Solicitud
            </div>

            <div class="form-row">
                <label class="form-label" for="TextBox7">ID:</label>
                <asp:TextBox ID="txtId" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
            </div>

                <div class="form-row">
                <label class="form-label" for="TextBox2">Descripción:</label>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
            </div>

     
            <div class="form-row">
                <label class="form-label" for="TextBox3">Cantidad:</label>
                <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
            </div>

       
            <div class="form-row">
                <label class="form-label" for="TextBox4">Costo:</label>
                <asp:TextBox ID="txtCosto" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
            </div>

      
            <div class="form-row">
                <label class="form-label" for="TextBox5">Justificación comprador:</label>
                <asp:TextBox ID="txtJustComprador" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
            </div>

      
            <div class="form-row">
                <label class="form-label" for="TextBox6">Detalle aprobador jefe:<asp:TextBox ID="TextJustJefe" runat="server" CssClass="form-input"></asp:TextBox>
                </label>&nbsp;
                <asp:GridView ID="gdReq" runat="server" AutoGenerateColumns="False" CssClass="form-input" 
    OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="RequisicionID" HeaderText="ID" />
        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
        <asp:BoundField DataField="Monto" HeaderText="Costo" />
        <asp:BoundField DataField="Justificacion" HeaderText="Justificación Comprador" />
        <asp:ButtonField Text="Seleccionar" CommandName="Select" />
    </Columns>
</asp:GridView>
            </div>

         
            <div class="button-row">
                <asp:Button ID="btnAprobar" runat="server" CssClass="form-button" Text="Aprobar" />
                <asp:Button ID="btnRechazar" runat="server" CssClass="auto-style1" Text="Rechazar" />
                <asp:Button ID="Button1" runat="server" Text="Button" />
            </div>
=======
        <div>
            <asp:GridView ID="GridView1" runat="server" Height="195px" Width="1582px">
            </asp:GridView>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnRechazar" runat="server" Height="28px" Text="Button" Width="102px" />
            <asp:Button ID="Button2" runat="server" Height="28px" Text="Button" Width="116px" />
>>>>>>> Stashed changes
        </div>
    </form>
</body>
</html>
