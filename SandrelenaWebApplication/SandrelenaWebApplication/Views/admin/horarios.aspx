<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="horarios.aspx.cs" Inherits="SandrelenaWebApplication.Views.admin.horarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <div class="text-center sidebar-heading">
                    <h4>Menu</h4>
                </div>

                <ul class="nav nav-sidebar">
                    <li class="clickable" data-toggle="modal" data-target="#frm_agr" data-backdrop="static" data-keyboard="false"><a><i class="fa fa-book fa-fw"></i> Agregar</a></li>
                    <li class="clickable" data-toggle="modal" data-target="#frm_mod" data-backdrop="static" data-keyboard="false"><a><i class="fa fa-pencil-square-o fa-fw"></i> Editar</a></li>
                    <li class="clickable"><a><i class="fa fa-times fa-fw"></i> Eliminar</a></li>
                </ul>
            </div>

            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div class="row">
                    <div class="col-md-6">
                        <h1 class="sandrelena-heading">Administración</h1>
                        <h1 class="sandrelena-sub-heading"><small>Listado de horarios</small></h1>
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
                <div class="row footer-padding">
                    <asp:GridView ID="horarios_table" runat="server" CssClass="table list-table" AutoGenerateColumns="false"  BorderWidth="0">
                        
                    </asp:GridView>
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

    <!--mod agr -->

    <div class="modal fade" tabindex="-1" role="dialog" id="frm_agr">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
                    <h4 class="modal-title"><i class="fa fa-book fa-fw"></i> Crear Horario</h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Asignatura</label>
                                <asp:DropDownList ID="asignaturas" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Profesor</label>
                                <asp:DropDownList ID="profesor" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Aula</label>
                                <asp:DropDownList ID="aula" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Día</label>
                                <asp:DropDownList ID="dias_agr" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>


                    
                </div>
                <div class="modal-footer">
                    <button id="btnCancelar" Class="btn btn-default" data-dismiss="modal" >Cancelar</button>
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary"/>
                </div>
            </div>
        </div>
    </div>


    <!--mod mod -->

    <div class="modal fade" tabindex="-1" role="dialog" id="frm_mod">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
                    <h4 class="modal-title"><i class="fa fa-book fa-fw"></i> Editar Horario</h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Asignatura</label>
                                <asp:DropDownList ID="asig_mod" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Profesor</label>
                                <asp:DropDownList ID="prof_mod" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Aula</label>
                                <asp:DropDownList ID="aulas_mod" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Día</label>
                                <asp:DropDownList ID="dias_mod" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>


                   

                    
                </div>
                <div class="modal-footer">
                    <button  Class="btn btn-default" data-dismiss="modal" >Cancelar</button>
                    <asp:Button ID="modificar" runat="server" Text="Aceptar" CssClass="btn btn-primary"/>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="../../Scripts/horarios.js"></script>
</asp:Content>
