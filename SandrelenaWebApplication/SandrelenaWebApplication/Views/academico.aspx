<%@ Page Title="Académico" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="academico.aspx.cs" Inherits="SandrelenaWebApplication.Views.notas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div id="loading"></div>
        	<div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
        	<div class="text-center sidebar-heading">
            	<h4>Menu</h4>
            </div>
          
          <ul class="nav nav-sidebar">
            <li class="padding-left-sm"><h2>Notas</h2></li>
            <li class="clickable active" role="presentation"><a href="#periodo" aria-controls="periodo" role="tab" data-toggle="tab"><i class="fa fa-book fa-fw"></i> Periodo</a></li>
		 	<li class="clickable" role="presentation"><a href="#hist" aria-controls="hist" role="tab" data-toggle="tab"><i class="fa fa-calendar fa-fw"></i> Histórico</a></li>
            <li class="padding-left-sm"><h2>Asignatura</h2></li>
            <li class="clickable" role="presentation"><a href="#cambio" aria-controls="cambio" role="tab" data-toggle="tab"><i class="fa fa-exchange fa-fw"></i> Cambio</a></li>
		 	<li class="clickable" role="presentation"><a href="#retiro" aria-controls="retiro" role="tab" data-toggle="tab"><i class="fa fa-times fa-fw"></i> Retiro</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="container">
                    <div class="tab-content">
                    
                        <div role="tabpanel" class="tab-pane active" id="periodo">

                            <div class="row">
                                <div class="col-md-5">
                                    <h1 class="sandrelena-heading">Reporte de Notas</h1>
                                    <h1 class="sandrelena-sub-heading"><small>Por Periodo de Clase</small></h1>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:DropDownList ID="periodoSelect" runat="server" CssClass="customSelect">
                                        </asp:DropDownList>
                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <asp:GridView ID="periodoTable" runat="server" CssClass="table info-table">
                                            <Columns>
                                                
                                            </Columns>
                                        </asp:GridView>
                                    </div>

                                </div>

                            </div>


                        </div>


                        <div role="tabpanel" class="tab-pane" id="hist">

                            <div class="row">
                                <div class="col-md-8">
                                    <h1 class="sandrelena-heading">Reporte de Notas</h1>
                                    <h1 class="sandrelena-sub-heading"><small>Por Historial de Notas</small></h1>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <asp:GridView ID="historicoTable" runat="server" CssClass="table info-table">
                                            <Columns>
                                                
                                            </Columns>
                                        </asp:GridView>
                                    </div>

                                </div>

                            </div>


                        </div>


                         <div role="tabpanel" class="tab-pane" id="cambio">

                            <div class="row">
                                <div class="col-md-8">
                                    <h1 class="sandrelena-heading">Administración de Asignaturas</h1>
                                    <h1 class="sandrelena-sub-heading"><small>Cambio de clases</small></h1>
                                </div>
                            </div>


                        </div>

                        <div role="tabpanel" class="tab-pane" id="retiro">

                            <div class="row">
                                <div class="col-md-8">
                                    <h1 class="sandrelena-heading">Administración de Asignaturas</h1>
                                    <h1 class="sandrelena-sub-heading"><small>Retiro de clases</small></h1>
                                </div>
                            </div>


                        </div>


                    
                    </div>
            </div> 
        </div>
      </div>
        
    </div>

    <footer class="footer-sidebar-fix">
    <div class="container">
        <p>&copy; <%: DateTime.Now.Year %> - Sandrelena v0.1.0</p>
     </div>
    </footer>

    <script src="../Scripts/academico.js" type="text/javascript"></script>
</asp:Content>
