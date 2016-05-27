<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="objetos.aspx.cs" Inherits="SandrelenaWebApplication.Views.admin.facultades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <div class="text-center sidebar-heading">
                    <h4>Menu</h4>
                </div>

                <ul class="nav nav-sidebar">
                    <li class="clickable active" ><a href="#facultades" aria-controls="facultades" role="tab" data-toggle="tab"><i class="fa fa-university fa-fw"></i> Facultades</a>
                    </li>
                    <li class="clickable"><a href="#carreras" aria-controls="carreras" role="tab" data-toggle="tab"><i class="fa fa-graduation-cap fa-fw"></i> Carreras</a>
                    </li>
                    <li class="clickable"><a href="#aulas" aria-controls="aulas" role="tab" data-toggle="tab"><i class="fa fa-book fa-fw"></i> Aulas</a></li>
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
                            <div class="col-md-6">
                                <div class="btn-group" role="group">
                                    <button id="facultades_agr"  class="btn btn-defaul" data-toggle="modal" data-target="#frm_agr_fac" data-backdrop="static" data-keyboard="false"><i class="fa fa-plus fa-fw"></i> Agregar</button>
                                    <button id="facultades_mod"  class="btn btn-defaul" data-toggle="modal" data-target="#frm_mod_fac" data-backdrop="static" data-keyboard="false"><i class="fa fa-pencil-square-o fa-fw"></i> Modificar</button>
                                    <asp:LinkButton ID="facultades_del" runat="server" cssClass="btn btn-defaul"><i class="fa fa-times fa-fw"></i> Eliminar</asp:LinkButton>
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
                                <h1 class="sandrelena-sub-heading"><small>Listado de carreras</small></h1>
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
                            <div class="col-md-6">
                                <div class="btn-group" role="group">
                                   <button id="carreras_agr"  class="btn btn-defaul" data-toggle="modal" data-target="#frm_agr_car" data-backdrop="static" data-keyboard="false"><i class="fa fa-plus fa-fw"></i> Agregar</button>
                                    <button id="carreras_mod"  class="btn btn-defaul" data-toggle="modal" data-target="#frm_mod_car" data-backdrop="static" data-keyboard="false"><i class="fa fa-pencil-square-o fa-fw"></i> Modificar</button>
                                    <asp:LinkButton runat="server" ID="carreras_del"  cssClass="btn btn-defaul"><i class="fa fa-times fa-fw"></i> Eliminar</asp:LinkButton>
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

                    <div role="tabpanel" class="tab-pane" id="aulas">
                        <div class="row">
                            <div class="col-md-6">
                                <h1 class="sandrelena-heading">Administración</h1>
                                <h1 class="sandrelena-sub-heading"><small>Listado de aulas</small></h1>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                        <div class="input-group-addon"><i class="fa fa-search"></i></div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="btn-group" role="group">
                                    <button id="aulas_agr"  class="btn btn-defaul" data-toggle="modal" data-target="#frm_agr_aul" data-backdrop="static" data-keyboard="false"><i class="fa fa-plus fa-fw"></i> Agregar</button>
                                    <button id="aulas_mod"  class="btn btn-defaul" data-toggle="modal" data-target="#frm_mod_aul" data-backdrop="static" data-keyboard="false"><i class="fa fa-pencil-square-o fa-fw"></i> Modificar</button>
                                    <asp:LinkButton ID="aulas_del" runat="server" cssClass="btn btn-defaul"><i class="fa fa-times fa-fw"></i> Eliminar</asp:LinkButton>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <asp:GridView ID="aulas_grid" runat="server" CssClass="table list-table"  BorderWidth="0"></asp:GridView>
                        </div>

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

    <!-- add fac -->
    <div class="modal fade" tabindex="-1" role="dialog" id="frm_agr_fac">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
                    <h4 class="modal-title"><i class="fa fa-plus fa-fw"></i> Agregar Facultad</h4>
                </div>
                <div class="modal-body">
                    
                    <div class="form-group">
                        <label>Nombre</label>
                        <asp:TextBox runat="server" ID="nom_agr_fac" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="Button6" runat="server" Text="Aceptar" CssClass="btn btn-primary"  />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- add aula-->
    <div class="modal fade" tabindex="-1" role="dialog" id="frm_agr_aul">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
                    <h4 class="modal-title"><i class="fa fa-plus fa-fw"></i> Agregar Aula</h4>
                </div>
                <div class="modal-body">
                    
                    <div class="form-group">
                        <label>Código</label>
                        <asp:TextBox runat="server" ID="nom_aula" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="Button5" runat="server" Text="Aceptar" CssClass="btn btn-primary" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


     <!-- add car-->
    <div class="modal fade" tabindex="-1" role="dialog" id="frm_agr_car">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
                    <h4 class="modal-title"><i class="fa fa-plus fa-fw"></i> Agregar Carrera</h4>
                </div>
                <div class="modal-body">
                    
                    <div class="form-group">
                        <label>Nombre</label>
                        <asp:TextBox runat="server" ID="nom_car" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-primary" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->






    <!-- mod fac -->
    <div class="modal fade" tabindex="-1" role="dialog" id="frm_mod_fac">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
                    <h4 class="modal-title"><i class="fa fa-plus fa-fw"></i> Modificar Facultad</h4>
                </div>
                <div class="modal-body">
                    
                    <div class="form-group">
                        <label>Nombre</label>
                        <asp:TextBox runat="server" ID="mod_fac" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="Button2" runat="server" Text="Aceptar" CssClass="btn btn-primary" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- mod aula-->
    <div class="modal fade" tabindex="-1" role="dialog" id="frm_mod_aul">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
                    <h4 class="modal-title"><i class="fa fa-plus fa-fw"></i> Modificar Aula</h4>
                </div>
                <div class="modal-body">
                    
                    <div class="form-group">
                        <label>Código</label>
                        <asp:TextBox runat="server" ID="mod_aul" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="Button3" runat="server" Text="Aceptar" CssClass="btn btn-primary" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


     <!-- mod car-->
    <div class="modal fade" tabindex="-1" role="dialog" id="frm_mod_car">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
                    <h4 class="modal-title"><i class="fa fa-plus fa-fw"></i> Modificar Carrera</h4>
                </div>
                <div class="modal-body">
                    
                    <div class="form-group">
                        <label>Nombre</label>
                        <asp:TextBox runat="server" ID="mod_car" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <<asp:Button ID="Button4" runat="server" Text="Aceptar" CssClass="btn btn-primary" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


    <script src="../../Scripts/facultades.js"></script>
</asp:Content>
