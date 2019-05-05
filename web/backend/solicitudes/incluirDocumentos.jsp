<%-- 
    Document   : subirDocumentos
    Created on : 03-may-2019, 17:21:09
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
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subir documentos - Solicitudes</title>
    <!-- INCLUDE CSS for this page -->
    <s:include value = "../../includes/headerCss.jsp"/>
    <!-- END CSS for this page -->
</head>

<body class="adminbody">
		
<div id="main">

        <s:set var="opcionMenu" value="'inicio'"/>
        
    
	<!-- top bar navigation -->
	 <s:include value = "../../includes/topBarNav.jsp"/>
	<!-- End Navigation -->
	
        
	<!-- Left Sidebar -->
        <s:include value="../../includes/student/leftNavStudent.jsp"/>
	<!-- End Sidebar -->


        <div class="content-page">

            <!-- Start content -->
            <div class="content">

                <div class="container-fluid">

                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-holder">
                                <h1 class="main-title float-left">Subir documentos - Solicitudes</h1>
                                <ol class="breadcrumb float-right">
                                    <li class="breadcrumb-item active">Inicio</li>
                                </ol>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    
                        <s:if test="intReturnValue">
                            <div class="row">
                            <s:if test="intReturnValue>0">
                                <div class="col-xl-12 alert alert-success" role="alert">
                                <h4 class="alert-heading">Correcto!</h4>
                                <p><s:property value="msg" /></p>
                                 </div>
                            </s:if>
                            <s:else>
                                <div class="col-xl-12 alert alert-danger" role="alert">
                                <h4 class="alert-heading">Aviso!</h4>
                                <p><s:property value="msg" /></p>
                                 </div>
                            </s:else>
                            </div>
                        </s:if>
                    
                    <!-- end row -->
                    <div class="row">
                          opcion menu = <s:property value="opcionMenu"/>
                          /
                          opcion Submenu = <s:property value="opcionSubMenu"/> 
                          <br>
                            <s:if test="opcionMenu==inicio">
                                La opcion es inicio
                            </s:if>
                    </div>
                    
                    
                    
                           
                    
                    <!-- Registros pendientes -->
                    <div class="row">
                        
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">						
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h3><i class="fa fa-table"></i> Incluir documentación</h3>
                                    Para poder formalizar la matrícula debes adjuntar los documentos que te solicitamos
                                    en formato electrónico. Estos son los documentos que debes adjuntar:
                                    <ol>
                                        <li>1 - xxxxxx</li>
                                        <li>2 - xxxxxx</li>
                                        <li>3 - xxxxxx</li>

                                    </ol>

                                </div>
                                <br>
                                <!-- inlcuir la carga de archivos -->
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">						
                                    <div class="card mb-3">
                                            <div class="card-header">
                                                    <h3><i class="fa fa-file"></i> Example 1</h3>
                                                     Maximum 3 files, all files together must have maximal 3MB and the extensions must be matched in the array ['jpg', 'png', 'gif'].
                                            </div>

                                            <div class="card-body">

                                                    <input type="file" name="files[]" id="filer_example1" multiple="multiple">

                                            </div>														
                                    </div><!-- end card-->					
                                </div>
                                
                                <!-- inlcuir la carga de archivos -->
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">						
                                    <div class="card mb-3">
                                            <div class="card-header">
                                                    <h3><i class="fa fa-file"></i> Example 2</h3>
                                                     Maximum 3 files, all files together must have maximal 3MB and the extensions must be matched in the array ['jpg', 'png', 'gif'].
                                            </div>

                                            <div class="card-body">

                                                    <input type="file" name="files[]" id="filer_example2" multiple="multiple">

                                            </div>														
                                    </div><!-- end card-->					
                                </div>
                                
                                <!-- inlcuir la carga de archivos -->
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">						
                                    <div class="card mb-3">
                                            <div class="card-header">
                                                    <h3><i class="fa fa-file"></i> Example 3</h3>
                                                     Maximum 3 files, all files together must have maximal 3MB and the extensions must be matched in the array ['jpg', 'png', 'gif'].
                                            </div>

                                            <div class="card-body">

                                                    <input type="file" name="files[]" id="filer_example3" multiple="multiple">

                                            </div>														
                                    </div><!-- end card-->					
                                </div>
                                
                                
                            </div><!-- end card-->					
                        </div>

                    </div>			
                    <!-- End Registros pendientes -->

                </div>
                <!-- END container-fluid -->

            </div>
            <!-- END content -->

        </div>
	<!-- END content-page -->
    
        <s:include value="../../includes/footer.jsp"/>

</div>
<!-- Modal -->
<div class="modal fade" id="avisoSubidaArchivosModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Entrega de documentación</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
          </div>
          <div class="modal-body">
                <p>Después de ser aceptada su solicitud para realizar el curso, prepare los documentos necesarios para formalizar su solicitud y pulse sobre Aceptar para comenzar a subir los documentos.
                    </p>
          </div>
          <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Aceptar</button>
          </div>
        </div>
  </div>
</div>
<!-- END main -->
<s:include value="../../includes/js.jsp"/>


<!-- BEGIN Java Script for this page -->
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
        <!-- BEGIN Java Script for this page -->
        
	<script>
        //DATATABLES for Solitudes
        // START CODE Individual column searching (text inputs) DATA TABLE 		
        $(document).ready(function() {
            
		 $('#solicitudes').dataTable( {
                    "language": {
                        "sUrl": "assets/js/es/dataTablesSpanish.txt"
                    }
                } );
                
                //Example 2
                $('#filer_example1').filer({
                    limit: 3,
                    maxSize: 3,
                    extensions: ['jpg', 'jpeg', 'png', 'gif', 'pdf'],
                    changeInput: true,
                    showThumbs: true,
                    addMore: true
                });
                $('#filer_example2').filer({
                    limit: 3,
                    maxSize: 3,
                    extensions: ['jpg', 'jpeg', 'png', 'gif', 'pdf'],
                    changeInput: true,
                    showThumbs: true,
                    addMore: true
                });
                $('#filer_example3').filer({
                    limit: 3,
                    maxSize: 3,
                    extensions: ['jpg', 'jpeg', 'png', 'gif', 'pdf'],
                    changeInput: true,
                    showThumbs: true,
                    addMore: true
                });
        } );
       
        // END CODE Individual column searching (text inputs) DATA TABLE 	 	
	</script>	
<!-- END Java Script for this page -->

</body>
</html>