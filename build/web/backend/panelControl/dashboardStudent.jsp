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
                    <!--
                    <h1>devuelve:<s:property value="intReturnValue"/></h1>-->
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
                    
                    <!-- end row 
                    <div class="row">
                          opcion menu = <s:property value="opcionMenu"/>
                          /
                          opcion Submenu = <s:property value="opcionSubMenu"/> 
                          <br>
                            <s:if test="opcionMenu==inicio">
                                La opcion es inicio
                            </s:if>
                    </div>-->
                    
                    
                    
                           
                    
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
                                                             <s:elseif test="solicitudEstados.idEstado==4">
                                                                <span class="badge badge-success"><s:property value="solicitudEstados.nombre"/></span>
                                                             </s:elseif>
                                                        </td>
                                                        <td align="center">     
                                                            <!-- Si el estado es aceptada --> 
                                                           
                                                            <a href="javascript:editarSolicitud(<s:property value="idSolicitud"/>);" class="btn btn-primary btn-sm">
                                                                <i class="fa fa-pencil" aria-hidden="true"></i>
                                                            </a>
                                                            <s:if test="solicitudEstados.idEstado==3">
                                                                <a href="IncluirDocumentos" class="btn btn-primary btn-sm" data-toggle="modal" 
                                                                   data-id="<s:property value="idSolicitud"/>" 
                                                                   data-target="#avisoSubidaArchivosModal" id="openModalUpload" title="Subir documentos" >
                                                                    <i class="fa fa-cloud-upload" aria-hidden="true"></i>
                                                                </a>
                                                             </s:if>
                                                             <s:elseif test="solicitudEstados.idEstado<3">
                                                                <a href="javascript:deleteRecord(<s:property value="idSolicitud"/>);" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete">
                                                                 <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                                </a>
                                                             </s:elseif>
                                                            
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
                    <div class="modal fade" id="avisoSubidaArchivosModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <form action="UploadDocumentos" method="POST" enctype="multipart/form-data">
                         <div class="modal-dialog" role="document">
                             <div class="modal-content">
                               <div class="modal-header">
                                     <h5 class="modal-title" id="exampleModalLabel">Adjuntar documentación</h5>
                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                       <span aria-hidden="true">&times;</span>
                                     </button>
                               </div>
                               <div class="modal-body">
                                 <p>Al ser aceptada su solicitud para realizar el curso, puede entregar los documentos en las fechas
                                     y plazos establecidos para formalizar su solicitud. Prepare los documentos en formato electrónico y
                                     pulse sobre Aceptar para comenzar a subir los documentos.</p>
                                     <form action="UploadDocumentos" method="POST" enctype="multipart/form-data">
                                             <s:iterator value="listDocumentos" var="documento" status="status">
                                             <!-- inlcuir la carga de archivos -->
                                                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">                     
                                                     <div class="card mb-3">
                                                         <div class="card-header">
                                                             <h6><i class="fa fa-file"></i> DOCUMENTO ${status.count}: <s:property value="nombre"/></h6>
                                                             <s:property value="descripcion"/>
                                                         </div>

                                                         <div class="card-body">
                                                             <!--<input type="file" name="fileUpload" id="fileUpload${status.count}" >-->
                                                             <input type="file" name="fileUpload" value="" id="fileUpload"/>
                                                             <!--<s:file label="File 1" name="fileUpload" size="40" />-->
                                                         </div>                                                      
                                                     </div><!-- end card-->                  
                                                 </div>
                                             </s:iterator>
                                             <input type="hidden" id="idSolicitud" name="idSolicitud">


                                 </div>

                                 <div class="modal-footer">
                                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                     <button class="btn btn-primary" type="submit">
                                         Adjuntar documentación
                                     </button>
                                 </div>
                             </div>
                         </div>
                     </form>
                     </div>


                </div>
                <!-- END container-fluid -->

            </div>
            <!-- END content -->

        </div>
	<!-- END content-page -->
    
        <s:include value="../../includes/footer.jsp"/>

</div>


<!-- Modal -->

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
                
                $(document).on("click", "#openModalUpload", function () {
                    var idSolicitud = $(this).data('id');
                    $(".modal-body #idSolicitud").val( idSolicitud );
               });
               
               <s:iterator value="listDocumentos" var="documento" status="status">
                    $('#fileUpload${status.count}').filer({
                    limit: <s:property value ="listDocumentos.size()"/>,
                    maxSize: 5,
                    extensions: ['jpg', 'jpeg', 'png', 'gif', 'pdf'],
                    changeInput: true,
                    showThumbs: true,
                    addMore: true
                    });
                 
            </s:iterator>
                
                
        } );
        function deleteRecord(id)
        {
            if (confirm('¿Estás seguro que quieres borrar el elemento?')) {
                alert("Sin implementar");
                //window.location.href = 'BorrarSolicitud?idSolicitud='+id;
            }
        }
       
        function editarSolicitud(id) {
            window.location.href = "EditarSolicitud?idSolicitud="+id;
        }
        // END CODE Individual column searching (text inputs) DATA TABLE 	 	
	</script>	
<!-- END Java Script for this page -->

</body>
</html>
