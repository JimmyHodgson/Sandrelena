<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SandrelenaWebApplication.Views.login" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <webopt:BundleReference runat="server" Path="~/Content/css" />

    
    
    <link rel="stylesheet" href="../Content/login-style.css">
    
    <title>Login</title>
    
    
    
    <style>
        body {
            position: sticky;
            background: url("../Resources/bg.jpg") center no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
    <form runat="server">

         <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <asp:ScriptReference Path="~/Scripts/select2.min.js" />
                <asp:ScriptReference Path="~/Scripts/jquery.transit.min.js" />
                <asp:ScriptReference Path="~/Scripts/jquery-ui-1.11.4.min.js" />
                <asp:ScriptReference Path="~/Scripts/login.js" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>




    <div class="modal fade" id="myModal" tabindex="-1">
        <div class="modal-dialog vertical-align-center">
            <div class="modal-content">
                
                <div class="modal-header">
                    <!--data-dismiss="modal" makes the click close all modals-->
                    <!--button type="button" class="close">x</button-->
                    <h4 class="modal-title">¡Bienvenid@!</h4>
                </div>
                
                <div class="modal-body">
                    
                        <div class="input-group">
                            <asp:TextBox ID="uLogin" runat="server" ClientIDMode="Static" CssClass="form-control" PlaceHolder="Usuario"></asp:TextBox>
                            <label for="uLogin" class="input-group-addon glyphicon glyphicon-user"></label>
                        </div>
                            
                        <div class="input-group">
                            <asp:TextBox ID="uPassword" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Password" PlaceHolder="Contraseña"></asp:TextBox>
                            <label for="uPassword" class="input-group-addon glyphicon glyphicon-lock"></label>
                        </div>
                        
                        <input type="checkbox"> Recordarme
                        <br>
                        <label id="warning" class="label label-danger hidden" style="float:right; position:relative; bottom:17px"><br></label>
                    
                </div>
                
                <div class="modal-footer">
                    <div class="division"></div>
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-default btn-sm hide" ClientIDMode="Static" />
                    <asp:Button ID="btnlogin" runat="server" Text="Iniciar Sesión" CssClass="btn btn-primary btn-sm" ClientIDMode="Static" OnClick="btnlogin_Click" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
