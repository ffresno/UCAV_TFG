<%-- 
    Document   : dashboardStudent.jsp
    Created on : 07-abr-2019, 11:25:45
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
    <title>DashBoard - Estudiantes</title>
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
                                <h1 class="main-title float-left">Mis solicitudes</h1>
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
                                    <h3><i class="fa fa-table"></i> Mis solicitudes</h3>
                                    Puedes ver las solicitudes realizadas y el estado de ellas.
                                </div>

                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="solicitudes" class="table table-bordered table-hover display">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>NOMBRE Y APELLIDOS</th>
                                                    <th>CURSO SOLICITADO</th>
                                                    <th>CURSO ESCOLAR</th>
                                                    <th>ESTADO</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>									
                                            <tbody>
                                                <s:iterator value="listSolicitudes" var="solicitud" status="status">
                                                    <tr style="text-transform: uppercase;">
                                                        <td>${status.count}</td>
                                                        <td>
                                                            <s:property value="apellidos"/>, <s:property value="nombre"/>
                                                            <br>(<s:property value="provincias.nombre"/>)
                                                        </td>
                                                        <s:iterator value="solicitudDetalles" var="detalle" status="status">
                                                            <td>
                                                                <b><s:property value="curso.nombre"/></b>
                                                            </td>
                                                        </s:iterator>
                                                        <td>2018/2019</td>
                                                        <td>
                                                            
                                                            <s:if test="solicitudEstados.idEstado==1">
                                                                <span class="badge badge-primary"><s:property value="solicitudEstados.nombre"/></span>
                                                            </s:if>
                                                            <s:elseif test="solicitudEstados.idEstado==2">
                                                                <span class="badge badge-danger"><s:property value="solicitudEstados.nombre"/></span>
                                                            </s:elseif>
                                                            <s:elseif test="solicitudEstados.idEstado==3">
                                                                <span class="badge badge-success"><s:property value="solicitudEstados.nombre"/></span>
                                                             </s:elseif>
                                                        </td>
                                                        <td align="center">     
                                                            
                                                            <s:if test="solicitudEstados.idEstado==3">
                                                                <a href="IncluirDocumentos" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#avisoSubidaArchivosModal" title="Subir documentos">
                                                                    <i class="fa fa-cloud-upload" aria-hidden="true"></i>
                                                                </a>
                                                             </s:if>
                                                            <a href="javascript:deleteRecord();" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete">
                                                                <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </s:iterator>
                                            </tbody>
                                        </table>
                                    </div>

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
                <p>Al ser aceptada su solicitud para realizar el curso, puede entregar los documentos en las fechas
                    y plazos establecidos para formalizar su solicitud. Prepare los documentos en formato electrónico y
                    pulse sobre Aceptar para comenzar a subir los documentos.
                    </p>
          </div>
          <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <a class="btn btn-primary" href="IncluirDocumentos" class="btn btn-primary">Aceptar</a>
          </div>
        </div>
  </div>
</div>
<!-- END main -->
<s:include value="../../includes/js.jsp"/>


<!-- BEGIN Java Script for this page -->
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
       
	<script>
        //DATATABLES for Solitudes
        // START CODE Individual column searching (text inputs) DATA TABLE 		
        $(document).ready(function() {
            
		 $('#solicitudes').dataTable( {
                    "language": {
                        "sUrl": "assets/js/es/dataTablesSpanish.txt"
                    }
                } );
                
                
        } );
       
        // END CODE Individual column searching (text inputs) DATA TABLE 	 	
	</script>	
<!-- END Java Script for this page -->

</body>
</html>
