<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SandrelenaWebApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="jumbotron">
            <h1>Sandrelena</h1>
            <p class="lead">La plataforma de gestión educativa de tu universidad. Aprendiendo de la mejor manera.</p>
            <p><a href="#" class="btn btn-primary btn-lg custom-button"><span>Descubre Sandrelena</span></a></p>
        </div>

        <div class="row text-center">
            <div class="col-md-4 border-right infobox">
                <i class="fa fa-book fa-2x"></i>
                <h2>Estudia</h2>
                <p>
                    ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
                A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
                </p>
                <p>
                    <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                </p>
            </div>
            <div class="col-md-4 border-right infobox">
                <i class="fa fa-graduation-cap fa-2x"></i>
                <h2>Aprende</h2>
                <p>
                    NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                </p>
                <p>
                    <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                </p>
            </div>
            <div class="col-md-4 infobox">
                <i class="fa fa-users fa-2x"></i>
                <h2>Colabora</h2>
                <p>
                    You can easily find a web hosting company that offers the right mix of features and price for your applications.
                </p>
                <p>
                    <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                </p>
            </div>
        </div>
        <div class="row contact">
            <div class="col-md-offset-2"><h1 class="section-title">Contactanos</h1></div>
            <div class="row"> 
                <div class="col-md-3 col-md-offset-2">
                    <div class="form-group">
                         <input type="text" placeholder="Nombre" class="form-control custom-field"/>
                    </div>
                   
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <input type="text" placeholder="Correo Electronico" class="form-control custom-field"/>
                    </div>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <div class="form-group">
                        <textarea class="form-control"></textarea>
                    </div>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-offset-8 col-md-2">
                    <div class="form-group">
                        <button class="btn btn-primary form-control">Enviar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
      <div class="container">
       <p>&copy; <%: DateTime.Now.Year %> - Sandrelena v0.1.0</p>
      </div>
   </footer>

</asp:Content>
