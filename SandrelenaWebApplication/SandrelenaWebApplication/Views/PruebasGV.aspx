<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PruebasGV.aspx.cs" EnableEventValidation="false" Inherits="SandrelenaWebApplication.Views.PruebasGV" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                            runat="server" AutoGenerateColumns="false" OnRowDataBound = "OnRowDataBound"
                            OnSelectedIndexChanged = "OnSelectedIndexChanged" DataKeyNames="Name">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" Visible="false" />
                        <asp:BoundField DataField="Country" HeaderText="Country" ItemStyle-Width="150" />
                    </Columns>
                </asp:GridView>
                <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
        
    </div>
    </form>
</body>
</html>
