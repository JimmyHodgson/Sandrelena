﻿<%@ Page Title="Matrícula" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="matricula.aspx.cs" Inherits="SandrelenaWebApplication.Views.matricula" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div id="loading"></div>
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div class="container">

                    <div role="tabpanel" class="tab-pane active" id="periodo">

                        <div class="row">
                            <div class="col-md-5">
                                <h1 class="sandrelena-heading">Matrícula de Asignaturas</h1>
                                <h1 class="sandrelena-sub-heading"><small>Horarios de Clase</small></h1>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <asp:DropDownList ID="carrera_select" runat="server" CssClass="customSelect">
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>
                        <div class="row padding-bottom-md">
                            <div class="col-md-12">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table info-table" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" />
                                        <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" />
                                        <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" />
                                        <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" />
                                        <asp:BoundField DataField="Discontinued" HeaderText="Discontinued" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>

    </div>

    <footer class="">
        <div class="container">
            <p>&copy; <%: DateTime.Now.Year %> - Sandrelena v0.1.0</p>
        </div>
    </footer>

    <script src="../Scripts/matricula.js" type="text/javascript"></script>
</asp:Content>
