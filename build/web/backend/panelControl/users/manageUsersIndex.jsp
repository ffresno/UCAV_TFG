<%-- 
    Document   : dashboard.jsp
    Created on : 14-mar-2019, 9:23:11
    Author     : fernandofresno
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    /////////////////////////////////////////
    //          Access control
    /////////////////////////////////////////
    
    if (session.getAttribute("appUser") == null ) {
        session.invalidate(); 
        response.sendRedirect("Login");
    } 
    if (session.getAttribute("AccessLevel") != "admin") {
        session.invalidate(); 
        response.sendRedirect("Login");
    } 
%>


<s:set var="opcionMenu" value="%{'config'}"/>
<s:set var="opcionSubMenu" value="%{'usuarios'}"/>
    
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DashBoard - Gestión de Usuarios</title>
        <!-- INCLUDE CSS for this page -->
        <s:include value = "../../../includes/headerCss.jsp"/>
        
        <style>
		.parsley-error {
			border-color: #ff5d48 !important;
		}
		.parsley-errors-list.filled {
			display: block;
		}
		.parsley-errors-list {
			display: none;
			margin: 0;
			padding: 0;
		}
		.parsley-errors-list > li {
			font-size: 12px;
			list-style: none;
			color: #ff5d48;
			margin-top: 5px;
		}
		.form-section {
			padding-left: 15px;
			border-left: 2px solid #FF851B;
			display: none;
		}
		.form-section.current {
			display: inherit;
		}
        </style>
        <!-- END CSS for this page -->
    </head>
        <!-- top bar navigation -->
        <s:include value = "../../../includes/topBarNav.jsp"/>
        <!-- End Navigation -->


        <!-- Left Sidebar -->
        <s:include value="../../../includes/admin/leftNavAdmin.jsp"/>
        <!-- End Sidebar -->

            <div class="content-page">

                <!-- Start content -->
                <div class="content">

                    <div class="container-fluid">

                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-holder">
                                    <h1 class="main-title float-left">Gestión de Usuarios</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item">Inicio</li>
                                        <li class="breadcrumb-item active">Usuarios</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->
                        
                         
                        <s:if test="intReturnValue">
                            <s:if test="intReturnValue>0">
                                <div class="alert alert-success" role="alert">
                                <h4 class="alert-heading">Correcto!</h4>
                                <p><s:property value="msg" /></p>
                            </s:if>
                            <s:else>
                                <div class="alert alert-danger" role="alert">
                                <h4 class="alert-heading">Aviso!</h4>
                                <p><s:property value="msg" /></p>
                            </s:else>
                        </s:if>

                                </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">						
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <span class="pull-right"><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_add_user"><i class="fa fa-user-plus" aria-hidden="true"></i> Añadir usuario</button></span>
                                        <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-labelledby="modal_add_user" aria-hidden="true" id="modal_add_user">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="NuevoUsuario" method="post" enctype="multipart/form-data" id="nuevoUsuario">

                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Añadir usuarios</h5>
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                        </div>

                                                        <div class="modal-body">                

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>Nombre (obligatorio)</label>
                                                                        <input class="form-control" name="nombre" type="text" required data-parsley-trigger="change" data-parsley-length="[4, 100]"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>Apellidos (obligatorio)</label>
                                                                        <input class="form-control" name="apellidos" type="text" required data-parsley-trigger="change" data-parsley-length="[4, 100]"/>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Email (obligatorio)</label>
                                                                        <input class="form-control" name="email" type="text" required data-parsley-trigger="change" data-parsley-length="[4, 100]"/>

                                                                    </div>
                                                                </div>  

                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Password (obligatorio)</label>
                                                                        <input class="form-control" name="password" type="password" required data-parsley-trigger="change" data-parsley-length="[4, 15]"/>

                                                                    </div>
                                                                </div>  
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Role</label>
                                                                        <select name="role" class="form-control" required>
                                                                            <option value="" disabled>- Selecciona -</option>
                                                                                <option value="1">Administrador</option>
                                                                                <option value="2">Alumno</option>
                                                                        </select>
                                                                    </div>
                                                                </div>					               

                                                                				
                                                            </div>

                                                        </div>             

                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Añadir usuario</button>
                                                        </div>

                                                    </form>	

                                                </div>
                                            </div>
                                        </div> 
                                        <h3><i class="fa fa-user"></i> Existen <s:property value ="listUsuarios.size()"/> usuarios</h3>								
                                    </div>
                                    <!-- end card-header -->	

                                    <div class="card-body">


                                        <div class="table-responsive">
                                            <table id="usuarios" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width:3%">ID</th>
                                                        <th style="width:30%">APELLIDOS, NOMBRE</th>
                                                        <th style="width:20%">EMAIL</th>
                                                        <th style="width:10%">ALTA</th>
                                                        <th style="width:10%">ACCIONES</th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <s:iterator value="listUsuarios" var="usuario" status="status">   
                                                        <tr>
                                                            <td>${status.count}</td>
                                                            <td>
                                                                 <s:property value="apellidos"/>, <s:property value="nombre"/>
                                                                 <br>
                                                                 <s:if test="role.idRole==1">
                                                                    <span class="badge badge-primary">Administrador</span>
                                                                 </s:if>
                                                                 <s:else>
                                                                    <span class="badge badge-success">Alumno</span>
                                                                 </s:else>
                                                            </td>
                                                            <td>
                                                                <s:property value="email"/>
                                                            </td>
                                                            <td>
                                                                <s:property value="createTime"/>
                                                            </td>
                                                            <td>
                                                            <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_edit_user_${usuario.idUser}"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                            <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="modal_edit_user_${usuario.idUser}">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">

                                                                        <form action="ActualizarUsuario" method="post" enctype="multipart/form-data" id="actualizarUsuarioForm${usuario.idUser}">


                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title">Editar Usuario</h5>
                                                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                                            </div>

                                                                            <div class="modal-body">                

                                                                                <div class="row">
                                                                                    <div class="col-lg-12">
                                                                                        <div class="form-group">
                                                                                            <label>Nombre (obligatorio)</label>
                                                                                            <input class="form-control" name="nombre" type="text" required value="<s:property value="nombre"/>" data-parsley-trigger="change" data-parsley-length="[4, 100]"/>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-lg-12">
                                                                                        <div class="form-group">
                                                                                            <label>Apellidos (obligatorio)</label>
                                                                                            <input class="form-control" name="apellidos" type="text" required value="<s:property value="apellidos"/>" data-parsley-trigger="change" data-parsley-length="[4, 100]"/>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-lg-12">
                                                                                        <div class="form-group">
                                                                                            <label>Email (obligatorio)</label>
                                                                                            <input class="form-control" name="email" type="email" required value="<s:property value="email"/>" data-parsley-trigger="change" data-parsley-length="[4, 100]"/>
                                                                                        </div>
                                                                                    </div>  

                                                                                    
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-lg-6">
                                                                                        <div class="form-group">
                                                                                            <label>Password (obligatorio)</label>
                                                                                            <input class="form-control" name="password" type="password" value="<s:property value="password"/>" data-parsley-trigger="change" data-parsley-length="[4, 15]"/>
                                                                                        </div>
                                                                                    </div>  
                                                                                    	
                                                                                </div>
                                                                                        
                                                                                <div class="row">
                                                                                    <div class="col-lg-6">
                                                                                        <div class="form-group">
                                                                                            <label>Role</label>
                                                                                            <select class="form-control" disabled> 
                                                                                                <s:if test="role.idRole==1">
                                                                                                    <option selected>Administrador</option>
                                                                                                 </s:if>
                                                                                                 <s:else>
                                                                                                     <option selected>Alumno</option>
                                                                                                 </s:else>
                                                                                            </select>
                                                                                            
                                                                                        </div>
                                                                                    </div>  
                                                                                    	
                                                                                </div>


                                                                                </div>
                                                                                     

                                                                            <div class="modal-footer">
                                                                                <input type="hidden" name="idUsuario" value="${usuario.idUser}" />
                                                                                <button type="submit" class="btn btn-primary">Actualizar</button>
                                                                            </div>

                                                                        </form>	

                                                                    </div>
                                                                </div>
                                                            </div> 
                                                            <a href="javascript:deleteRecord(${usuario.idUser});" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                           
                                                        </td>
                                                        </tr>
                                                    </s:iterator>
                                                   
                                                </tbody>
                                            </table>
                                        </div>	
                                        <!-- end table-responsive -->


                                    </div>	
                                    <!-- end card-body -->								

                                </div>
                                <!-- end card -->					

                            </div>
                            <!-- end col -->	

                        </div>
                        <!-- end row -->			



                    </div>
                    <!-- END container-fluid -->

                </div>
                <!-- END content -->
            </div>
            <!-- END content-page -->
            <!-- footer -->
            <s:include value="../../../includes/footer.jsp"/>
            <!-- end footer -->
        <!-- END main -->
        <s:include value="../../../includes/js.jsp"/>
        <!-- BEGIN Java Script for this page -->
        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
        
        <!-- BEGIN Java Script for this page -->
        <script src="assets/js/parsley.min.js"></script>
        <script src="assets/js/es/es.js"></script>
        
        <script>
            function deleteRecord(id) {
                if (confirm('¿Estas seguro de querer borrar el elemento?')) {
                    window.location.href = 'BorrarUsuario?idUsuario='+id;
                }
            }
            //DATATABLES for Solitudes
            // START CODE Individual column searching (text inputs) DATA TABLE 		
            $(document).ready(function () {
                // Setup - add a text input to each footer cell
                // DataTable
                $('#usuarios').dataTable( {
                    "language": {
                        "sUrl": "assets/js/es/dataTablesSpanish.txt"
                    }
                } );
                //form to validate to update
                <s:iterator value="listUsuarios" var="usuario" status="status">
                    $('#actualizarUsuarioForm${usuario.idUser}').parsley();
                </s:iterator>
                $('#nombre').addClass('form-control');
                $('#apellidos').addClass('form-control');
                $('#email').addClass('form-control');
                $('#password').addClass('form-control');
                
                $('#nuevoUsuario').parsley();
                
            });
            // END CODE Individual column searching (text inputs) DATA TABLE 	 	
        </script>	
        <!-- END Java Script for this page -->

        
    </html>