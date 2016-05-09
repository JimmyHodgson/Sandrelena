<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="usuarios.aspx.cs" Inherits="SandrelenaWebApplication.Views.admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <div class="text-center sidebar-heading">
                    <h4>Menu</h4>
                </div>

                <ul class="nav nav-sidebar">
                    <li class="clickable" data-toggle="modal" data-target="#frm_agr" data-backdrop="static" data-keyboard="false"><a><i class="fa fa-user-plus fa-fw"></i> Agregar</a></li>
                    <li class="clickable" data-toggle="modal" data-target="#frm_mod" data-backdrop="static" data-keyboard="false"><a><i class="fa fa-pencil-square-o fa-fw"></i> Editar</a></li>
                    <li class="clickable"><a><i class="fa fa-user-times fa-fw"></i> Eliminar</a></li>
                </ul>
            </div>

            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div class="row">
                    <div class="col-md-6">
                        <h1 class="sandrelena-heading">Administración</h1>
                        <h1 class="sandrelena-sub-heading"><small>Listado de Usuarios</small></h1>
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
                    <asp:GridView ID="user_table" runat="server" CssClass="table list-table"></asp:GridView>
                </div>

            </div>

        </div>
    </div>

    <footer class="">
    <div class="container">
        <p>&copy; <%: DateTime.Now.Year %> - Sandrelena v0.1.0</p>
     </div>
    </footer>

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
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_agr_nombres"> Nombres: </label>
                                <asp:TextBox ID="frm_agr_nombres" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_agr_apellidos"> Apellidos: </label>
                                <asp:TextBox ID="frm_agr_apellidos" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_agr_username"> Usuario: </label>
                                <asp:TextBox ID="frm_agr_username" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_agr_rol"> Rol: </label>
                                <asp:DropDownList ID="frm_agr_rol" runat="server" Visible="true" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_agr_password"> Contraseña: </label>
                                <asp:TextBox ID="frm_agr_password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_agr_nacimiento"> Fecha de Nacimiento: </label>
                                <asp:TextBox ID="frm_agr_nacimiento" runat="server" CssClass="form-control datepicker"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    

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
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_mod_nombres"> Nombres: </label>
                                <asp:TextBox ID="frm_mod_nombres" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_mod_apellidos"> Apellidos: </label>
                                <asp:TextBox ID="frm_mod_apellidos" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_mod_username"> Usuario: </label>
                                <asp:TextBox ID="frm_mod_username" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_mod_rol"> Rol: </label>
                                <asp:DropDownList ID="frm_mod_rol" runat="server" Visible="true" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_mod_password"> Contraseña: </label>
                                <asp:TextBox ID="frm_mod_password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="frm_mod_nacimiento"> Fecha de Nacimiento: </label>
                                <asp:TextBox ID="frm_mod_nacimiento" runat="server" CssClass="form-control datepicker"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    

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


    <script src="../../Scripts/usuarios.js"></script>
</asp:Content>
