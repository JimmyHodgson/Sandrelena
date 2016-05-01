<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="clases.aspx.cs" Inherits="SandrelenaWebApplication.Views.clases" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        	<div class="container-fluid">
        <!-- InstanceBeginEditable name="bodyContent" -->
        <div id="loading"></div>
        	<div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
        	<div class="text-center sidebar-heading">
            	<h4>Menu</h4>
            </div>
          <ul class="nav nav-sidebar">
            <li class="clickable active" role="presentation"><a href="#general" aria-controls="general" role="tab" data-toggle="tab"><i class="fa fa-info-circle fa-fw"></i> General</a></li>
		 	<li class="clickable" role="presentation"><a href="#students" aria-controls="students" role="tab" data-toggle="tab"><i class="fa fa-users fa-fw"></i> Alumnos</a></li>
            <li class="clickable" role="presentation"><a href="#docs" aria-controls="docs" role="tab" data-toggle="tab"><i class="fa fa-book fa-fw"></i> Docs</a></li>
            <li class="clickable" role="presentation"><a href="#grade" aria-controls="grade" role="tab" data-toggle="tab"><i class="fa fa-sticky-note-o fa-fw"></i> Nota</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="container">
                    <div class="row">
                            <div class="col-md-5">
                                <h1 class="sandrelena-heading">Visor de Clases</h1>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <select id="class-select" class="margin-top-md">
                                        <option value=0>Opción 1</option>
                                        <option value=1>Opción 2</option>
                                        <option value=2>Opción 3</option>
                                    </select>





                                </div>
                                
                            </div>
                        </div>



                  <div class="tab-content">

                      <!-- Inicia el primer panel-->
                    <div role="tabpanel" class="tab-pane active" id="general">

                         <div class="row">
                             <div class="col-md-5">
                                 <h1 class="sandrelena-sub-heading"><small>Información General</small></h1>
                             </div>
                         </div>

                        <div class="row">
                            <!-- En esta fila sale el numero de grupo y el numero de creditos -->
                        </div>

                        <div class="row">
                            <div class="col-md-12">

                                <!-- Aquí la primera tabla con la info del profesor-->
                                <h1>Profesor</h1>
                                <asp:GridView ID="GridView1" runat="server"></asp:GridView>

                            </div>
                        </div>

                      <div class="row">
                          <!-- En esta fila va la info de los horarios-->
                      </div>

                        
                    </div>



                      <!-- comienza el otro panel -->
                    <div role="tabpanel" class="tab-pane" id="students">
                       <div class="row">
                             <div class="col-md-5">
                                 <h1 class="sandrelena-sub-heading"><small>Listado de estudiantes</small></h1>
                             </div>
                         </div>



                    </div>
                    <div role="tabpanel" class="tab-pane" id="docs">
                        <div class="row">
                             <div class="col-md-5">
                                 <h1 class="sandrelena-sub-heading"><small>Documentos de la Clase</small></h1>
                             </div>
                         </div>



                    </div>
                    <div role="tabpanel" class="tab-pane" id="grade">
                        <div class="row">
                             <div class="col-md-5">
                                 <h1 class="sandrelena-sub-heading"><small>Acumulado de Nota</small></h1>
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

    
    <script src="../Scripts/clases.js" type="text/javascript"></script>
</asp:Content>
