<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PruebaEntity.aspx.cs" Inherits="SandrelenaWebApplication.Views.PruebaEntity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server">
            <Columns>
                <asp:BoundField HeaderText="IDCarrera" DataField="IDCarrera" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
