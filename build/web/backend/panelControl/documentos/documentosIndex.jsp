<%-- 
    Document   : documentosIndex
    Created on : 07-may-2019, 12:16:42
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
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DashBoard - Gestión de documentos a solicitar</title>
        <!-- INCLUDE CSS for this page -->
            
            <s:include value = "../../../includes/headerCss.jsp"/>
        <!-- END CSS for this page -->
    </head>
        <!-- top bar navigation -->
        <s:include value = "../../../includes/topBarNav.jsp"/>
        <!-- End Navigation -->

        <s:set var="opcionMenu" value="'config'"/>
        <s:set var="opcionSubMenu" value="'documentos'"/>
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
                                    
                                    <h1 class="main-title float-left">Documentos a solicitar</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item">Inicio</li>
                                        <li class="breadcrumb-item active">Documentos a solicitar</li>
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
                                        <span class="pull-right"><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_add_user"><i class="fa fa-plus" aria-hidden="true"></i> Añadir Documento</button></span>
                                        <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-labelledby="modal_add_user" aria-hidden="true" id="modal_add_user">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="InsertarDocumento" method="post" enctype="multipart/form-data">

                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Añadir Documento</h5>
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                        </div>

                                                        <div class="modal-body">                

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>Nombre (required)</label>
                                                                        <input class="form-control" name="nombre" type="text" required autofocus/>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Descripcion (required)</label>
                                                                        <input class="form-control" name="descripcion" type="text" required autofocus/>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>             

                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                                        </div>

                                                    </form>	

                                                </div>
                                            </div>
                                        </div> 
                                        <h3><i class="fa fa-folder"></i> Existen <s:property value ="listDocumentos.size()"/> Documentos</h3>								
                                    </div>
                                    <!-- end card-header -->	

                                    <div class="card-body">


                                        <div class="table-responsive">
                                            <table id="documentos" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width:10%">ID</th>
                                                        <th style="width:30%">Nombre</th>
                                                        <th style="width:40%">Descripción</th>
                                                        <th style="width:20%">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <s:iterator value="listDocumentos" var="documento" status="status">   
                                                    <tr>
                                                        <td>${status.count}</td>
                                                        <td>
                                                            <s:property value="nombre"/> 
                                                        </td>
                                                        <td>
                                                            <s:property value="descripcion"/> 
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_edit_${documento.idDocumento}"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                            <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="modal_edit_${documento.idDocumento}">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">

                                                                        <form action="ActualizarDocumento" method="post" enctype="multipart/form-data">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title">Editar Documento</h5>
                                                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                                            </div>

                                                                            <div class="modal-body">                

                                                                                <div class="row">
                                                                                    <div class="col-lg-12">
                                                                                        <div class="form-group">
                                                                                            <label>Nombre</label>
                                                                                            <input class="form-control" name="nombre" type="text" required value="${documento.nombre}" />
                                                                                        </div>
                                                                                    </div>
                                                                                        <div class="col-lg-12">
                                                                                        <div class="form-group">
                                                                                            <label>Descripción</label>
                                                                                            <input class="form-control" name="descripcion" type="text" required value="${documento.descripcion}" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>             

                                                                            <div class="modal-footer">
                                                                                <input type="hidden" name="idDocumento" value="${documento.idDocumento}" />
                                                                                <button type="submit" class="btn btn-primary">Guardar</button>
                                                                            </div>

                                                                        </form>	

                                                                    </div>
                                                                </div>
                                                            </div> 
                                                            <a href="javascript:deleteRecord('${documento.idDocumento}');" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                            
                                                        </td>
                                                    </tr>
                                                </s:iterator>
                                                   
                                                </tbody>
                                            </table>
                                        </div>	
                                        <!-- end table-responsive -->
                                        <script>
                                            function deleteRecord(id)
                                            {
                                                
                                                if (confirm('¿Estás seguro que quieres borrar el elemento?')) {
                                       
                                                    window.location.href = 'BorrarDocumento?idDocumento='+id;
                                                }
                                            }
                                        </script>

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

        <script>
        //DATATABLES for Solitudes
        // START CODE Individual column searching (text inputs) DATA TABLE 		
        $(document).ready(function() {
            
                $('#documentos').dataTable( {
                    "language": {
                        "sUrl": "assets/js/es/dataTablesSpanish.txt"
                    }
                } );
                
        } );
        // END CODE Individual column searching (text inputs) DATA TABLE 	 	
	</script>
    </html>