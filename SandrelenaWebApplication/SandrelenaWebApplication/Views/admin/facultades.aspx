<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="facultades.aspx.cs" Inherits="SandrelenaWebApplication.Views.admin.facultades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <div class="text-center sidebar-heading">
                    <h4>Menu</h4>
                </div>

                <ul class="nav nav-sidebar">
                    <li class="clickable active" ><a href="#facultades" aria-controls="facultades" role="tab" data-toggle="tab"><i class="fa fa-university fa-fw"></i> Facultades</a>

                        <ul class="nav nav-pills nav-stacked">
                            <li class="menu-subitem"><a href="#"><i class="fa fa-plus fa-fw"></i> Agregar</a></li>
                            <li class="menu-subitem"><a href="#"><i class="fa fa-pencil-square-o fa-fw"></i> Editar</a></li>
                            <li class="menu-subitem"><a href="#"><i class="fa fa-times fa-fw"></i> Eliminar</a></li>
                        </ul>
                    </li>
                    <li class="clickable"><a href="#carreras" aria-controls="carreras" role="tab" data-toggle="tab"><i class="fa fa-graduation-cap fa-fw"></i> Carreras</a>

                        <ul class="nav nav-pills nav-stacked">
                            <li class="menu-subitem"><a href="#"><i class="fa fa-plus fa-fw"></i> Agregar</a></li>
                            <li class="menu-subitem"><a href="#"><i class="fa fa-pencil-square-o fa-fw"></i> Editar</a></li>
                            <li class="menu-subitem"><a href="#"><i class="fa fa-times fa-fw"></i> Eliminar</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                



                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="facultades">
                        <div class="row">
                            <div class="col-md-6">
                                <h1 class="sandrelena-heading">Administración</h1>
                                <h1 class="sandrelena-sub-heading"><small>Listado de Facultades</small></h1>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="search_box" runat="server" CssClass="form-control"></asp:TextBox>
                                        <div class="input-group-addon"><i class="fa fa-search"></i></div>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <asp:GridView ID="faculty_table" runat="server" CssClass="table list-table" BorderWidth="0" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="nombre_facultad" HeaderText="Nombre de la Facultad"  />
                                    <asp:CheckBoxField DataField="isActive" HeaderText="Estado" />
                                </Columns>
                            </asp:GridView>
                        </div>


                    </div>
                    <div role="tabpanel" class="tab-pane" id="carreras">

                                <div class="row">
                                    <div class="col-md-6">
                                        <h1 class="sandrelena-heading">Administración</h1>
                                        <h1 class="sandrelena-sub-heading"><small>Listado de Facultades</small></h1>
                                    </div>
                                     <div class="col-md-3">
                                        <asp:DropDownList ID="ddlFacultades" runat="server" CssClass="customSelect" OnSelectedIndexChanged="ddlFacultades_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                        


                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="search_carreras" runat="server" CssClass="form-control"></asp:TextBox>
                                        <div class="input-group-addon"><i class="fa fa-search"></i></div>

                                    </div>
                                </div>
                            </div>

                        </div>

                        <asp:UpdatePanel ID="UpdatePanelCarreras" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <asp:GridView ID="carreras_table" runat="server" CssClass="table list-table"  BorderWidth="0" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="nombre_carrera" HeaderText="Nombre de la Carrera" />
                                            <asp:CheckBoxField DataField="isActive" HeaderText="Estado" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlFacultades" EventName="SelectedIndexChanged" />
                            </Triggers>   
                        </asp:UpdatePanel>

                    </div>
                </div>

                <div class="row">
                    <footer class="footer-fixed">
                        <div class="container">
                            <p>&copy; <%: DateTime.Now.Year %> - Sandrelena v0.1.0</p>
                        </div>
                    </footer>

                </div>



            </div>

        </div>
    </div>

   

    <!-- Modales -->

    <!-- add user -->
    <div class="modal fade" tabindex="-1" role="dialog" id="frm_agr">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
                    <h4 class="modal-title"><i class="fa fa-user-plus fa-fw"></i> Agregar Usuario</h4>
                </div>
                <div class="modal-body">
                    
  

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Agregar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


    <!-- mod user -->
    <div class="modal fade" tabindex="-1" role="dialog" id="frm_mod">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
                    <h4 class="modal-title"><i class="fa fa-pencil-square-o fa-fw"></i> Modificar Usuario</h4>
                </div>
                <div class="modal-body">
                    
                    

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Aceptar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


    <script src="../../Scripts/facultades.js"></script>
</asp:Content>
