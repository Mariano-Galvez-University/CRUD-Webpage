<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioClientes.aspx.cs" Inherits="Presentacion.FormularioClientes" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/estilos.css">
    <title>Home</title>
</head>

<body>
    <section class="contenedor">
        <header id="sitio-header">
    
            <section id="logotipo">
                <img src="img/Logo Pupuseria Excelente.png" alt="Logotipo">
            </section>
    
            <section id="titulo">
                <h1>Pupusería Excelente</h1>
                <p>Antojitos y más...</p>
            </section>
    
            <section id="usuario">
                <img src="img/Usuario.jpeg" alt="Fotografia Usuario">
                <p>José Furlán</p>
            </section>
    
        </header>
    
        <nav id="navegacion-principal">
                <a href="#">Home</a>
                <a href="#">Clientes</a>
                <a href="#">Proveedores</a>
                <a href="#">Ventas</a>
                <a href="#">Compras</a>
        </nav>
    
    
    
        <section id="main">
            <aside>
                <img src="img/Banner.jpg" alt="Publicidad">
            </aside>
        
            <section id="formulario">
                <form runat="server">
                    <legend>Formulario de Clientes</legend>
        
                    <label for="TxtNit">Nit:</label>
                    <asp:TextBox ID="TxtNit" runat="server" placeholder="Ingrese su nit"/>
        
                    <label for="TxtNombres">Nombres:</label>
                    <asp:TextBox ID="TxtNombres" runat="server" placeholder="Ingrese los nombres"/>
        
                    <label for="TxtApellidos">Apellidos:</label>
                    <asp:TextBox ID="TxtApellidos" runat="server" placeholder="Ingrese los apellidos"/>
        
                    <label for="TxtDireccion">Dirección:</label>
                    <asp:TextBox ID="TxtDireccion" runat="server" placeholder="Ingrese la dirección"/>
        
                    <label for="TxtTelefono">Telefóno:</label>
                    <asp:TextBox ID="TxtTelefono" runat="server" placeholder="Ingrese número telefónico"/>
        
                    <label for="TxtEmail">Email:</label>
                    <asp:TextBox ID="TxtEmail" runat="server" placeholder="Ingrese el correo electrónico"/>
        
                   
                    <section id="selects">

                        <label for="sexo">Sexo:</label>
                        <asp:DropDownList ID="SelectSexo" runat="server" Width="40%">
                             <asp:ListItem Selected="True">--Seleccionar--</asp:ListItem>
                             <asp:ListItem Value="M">Masculino</asp:ListItem>
                             <asp:ListItem Value="F">Femenino</asp:ListItem>
                        </asp:DropDownList>                       
                        
            
                        <label for="frecuente">Cliente Frecuente:</label>
                        <asp:DropDownList ID="SelectFrecuente" runat="server" Width="40%">
                             <asp:ListItem Selected="True">--Seleccionar--</asp:ListItem>
                             <asp:ListItem Value="1">Sí</asp:ListItem>
                             <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:DropDownList> 

                    </section>

                    
                    <div class="form-row d-flex justify-content-end">

                        <asp:Button ID="btnGuardar" Text="Guardar" CssClass="form-group btn btn-primary col-md-3 ml-md-2 btn-lg" runat="server" OnClick="btnGuardar_Click"/>
                        <asp:Button ID="btnCancelar" Text="Cancelar" CssClass="form-group btn btn-danger col-md-3 btn-lg" runat="server" OnClick="btnCancelar_Click"/>

                    </div>

                    <asp:Panel runat="server" CssClass="alert alert-success d-none" ID="AlertaExito">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <p ID="MensajeExito" class="alert-heading text-center" runat="server">Operacion realizada con exitosamente!</p>
                    </asp:Panel>

                    <asp:Panel runat="server" CssClass="alert alert-danger d-none" ID="AlertaError">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <p ID="MensajeError" class="alert-heading text-center" runat="server">Operacion fallida!</p>
                    </asp:Panel>

                    <asp:Repeater ID="RepeaterClientes" runat="server">
                        <HeaderTemplate>
                            <table class="table table-responsive-md table-striped table-borderless">
                                <thead class="thead-light">
                                    <tr>
                                        <th class="text-center" scope="col">Nit</th>
                                        <th class="text-center" scope="col">Nombres</th>
                                        <th class="text-center" scope="col">Dirección</th>
                                        <th class="text-center" scope="col">Telefóno</th>
                                        <th class="text-center" scope="col">Email</th>
                                        <th class="text-center" scope="col">Sexo</th>
                                        <th class="text-center" scope="col">Cliente Frecuente</th>
                                        <th class="text-center" colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="text-center"><%# Eval("TxtNit")%></td>
                                <td class="text-center"><%# Eval("TxtNombres")%></td>
                                <td class="text-center"><%# Eval("TxtDireccion")%></td>
                                <td class="text-center"><%# Eval("TxtTelefono")%></td>
                                <td class="text-center"><%# Eval("TxtEmail") %></td>
                                <td class="text-center"><%# Eval("TxtSexo")%></td>
                                <td class="text-center"><%# Eval("EsClienteFrecuente")%></td>
                                <td class="text-center"><asp:LinkButton ID="btnEditar" ClientIDMode="AutoID" Text="Editar" runat="server" CssClass="badge badge-primary" CommandArgument='<%# Eval("IdCliente") %>' OnCommand="btnEditar_Command"/></td>
                                <td class="text-center"><asp:LinkButton ID="btnEliminar" ClientIDMode="AutoID" Text="Eliminar" runat="server" CssClass="badge badge-danger" CommandArgument='<%# Eval("IdCliente") %>' OnCommand="btnEliminar_Command"/></td>
                                
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                   

                    
                </form>   
                
            </section>
        </section>
    </section>

    <footer>

        <section id="info">
            <p>Dirección: Calle Principal, Melchor de Mencos, Petén</p>
            <p>Tel: +502 41189196</p>
        </section>

        <section class="copyright">
            <p>Pupusería Excelente - Todos los Derechos Reservados &copy;</p>
        </section>

    </footer>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>  

</body>

</html>
