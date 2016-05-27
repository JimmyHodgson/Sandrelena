<%@ Page Title="Asignaturas" Language="C#" MasterPageFile="~/SiteAdmin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="asignaturas.aspx.cs" Inherits="SandrelenaWebApplication.Views.admin.asignaturas" %>
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
                        <h1 class="sandrelena-sub-heading"><small>Listado de Asignaturas</small></h1>
                    </div>
                </div>

                <asp:UpdatePanel ID="UpdatePanelBuscar" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="search_box" runat="server" CssClass="form-control" OnTextChanged="search_box_TextChanged"></asp:TextBox>
                                        <div class="input-group-addon"><i class="fa fa-search"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>

                    </Triggers>
                </asp:UpdatePanel>
                

                <asp:UpdatePanel ID="UpdatePanelAsignaturas" runat="server">
                    <ContentTemplate>
                        <div class="row footer-padding">
                            <asp:GridView ID="asignatura_table" runat="server" CssClass="table list-table"
                                AutoGenerateColumns="false"  BorderWidth="0" OnRowDataBound="asignatura_table_RowDataBound"
                                DataKeyNames="id_asignatura" OnSelectedIndexChanged="asignatura_table_SelectedIndexChanged" >
                                <Columns>
                                    <asp:BoundField DataField="id_asignatura" Visible="false"/>
                                    <asp:BoundField DataField="nombre_asignatura" HeaderText="Nombre" />
                                    <asp:BoundField DataField="codigo_asignatura" HeaderText="Código" />
                                    <asp:BoundField DataField="creditos" HeaderText="Creditos" />
                                    <asp:CheckBoxField DataField="isActive" HeaderText="Estado" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="asignatura_table" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="search_box" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                

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
    <div class="modal fade" tabindex="-1" role="dialog" id="frm_agr">
        <div class="modal-dialog  modal-sm ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
                    <h4 class="modal-title"><i class="fa fa-book fa-fw"></i> Agregar Asignatura</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="frm_agr_cod">Código</label>
                        <asp:TextBox ID="frm_agr_cod" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="frm_agr_nom">Nombre</label>
                        <asp:TextBox ID="frm_agr_nom" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="frm_agr_cre">Créditos</label>
                        <asp:TextBox ID="frm_agr_cre" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-default" data-dismiss="modal" />
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                </div>
            </div>
        </div>
    </div>

    <script src="../../Scripts/asignaturas.js"></script>
</asp:Content>
