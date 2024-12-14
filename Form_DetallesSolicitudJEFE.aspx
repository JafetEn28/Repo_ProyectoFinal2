<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_DetallesSolicitudJEFE.aspx.cs" Inherits="Proyecto_Analisis2.Form_DetallesSolicitudJEFE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Detalles Aprobador Jefe<br />
            <br />
            <br />
            <br />
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="RequisicionID">
    <Columns>
        <asp:BoundField DataField="RequisicionID" HeaderText="ID Requisición" />
        <asp:BoundField DataField="CompradorID" HeaderText="ID Comprador" />
        <asp:BoundField DataField="FechaCreacion" HeaderText="Fecha Creación" />
        <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:C}" />
        <asp:BoundField DataField="EstadoJefe" HeaderText="Estado Jefe" />
        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
        <asp:BoundField DataField="Justificacion" HeaderText="Justificación" />
        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
        <asp:BoundField DataField="Justificacion_Jefe" HeaderText="Justificación Jefe" />
        <asp:CommandField ShowSelectButton="True" HeaderText="Acciones" />
    </Columns>
</asp:GridView>


            <br />
            Comentario jefe:<br />

            <br />
            <asp:TextBox ID="txtJustJefe" runat="server" Width="241px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnRechazar" runat="server" Text="Rechazar" OnClick="btnRechazar_Click" />
&nbsp;
            <asp:Button ID="btnAprobar" runat="server" Text="Aprobar" OnClick="btnAprobar_Click" />
&nbsp;<asp:Label ID="lblAlertas" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
