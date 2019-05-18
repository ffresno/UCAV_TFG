<%-- 
    Document   : dashboardAdmin.jsp
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

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DashBoard - </title>
    <!-- INCLUDE CSS for this page -->
    <s:include value = "../../includes/headerCss.jsp"/>
    <!-- END CSS for this page -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">


</head>

<body class="adminbody">
		
<div id="main">

        <s:set var="opcionMenu" value="'inicio'"/>
        
    
	<!-- top bar navigation -->
	 <s:include value = "../../includes/topBarNav.jsp"/>
	<!-- End top bar Navigation -->
	
        
	<!-- Left Sidebar -->
        <s:include value="../../includes/admin/leftNavAdmin.jsp"/>
	<!-- End Sidebar -->


        <div class="content-page">

            <!-- Start content -->
            <div class="content">

                <div class="container-fluid">

                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-holder">
                                <h1 class="main-title float-left">Panel de control</h1>
                                <ol class="breadcrumb float-right">
                                    <li class="breadcrumb-item active">Inicio</li>
                                </ol>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <!-- end row 
                    <div class="row">
                        
                          opcion menu = <s:property value="opcionMenu"/>
                                <br>
                          opcion Submenu = <s:property value="opcionSubMenu"/> 
                          <br>
                            <s:if test="opcionMenu==inicio">
                                La opcion es inicio
                            </s:if>
                            
                            
                        <s:set var="varUrl" value="%{'http://www.mkyong.com'}" />
                        <br>
                        <s:property value="varUrl" />
                    </div>
                   
                        <h1><s:property value="intReturnValue"/></h1>-->
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
                    
                           
                    <!-- MAtriculas -->
                      <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">						
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h3><i class="fa fa-table"></i> Últimas matrículas</h3>
                                    En el siguiente listdo aparecen las ultimas matriculas realizadas en el sistema.
                                </div>

                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="solicitudes" class="table table-bordered table-hover display">
                                            <thead>
                                                <tr>
                                                    <th style="width:5%">#</th>
                                                    <th>Apellidos, Nombre</th>
                                                    <th>Localidad</th>
                                                    <th>Curso</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>										
                                            <tbody>
                                                <s:iterator value="listSolicitudes" var="solicitud" status="status">
                                                    <tr style="text-transform: uppercase;">
                                                        <td>${status.count}</td>
                                                        <td>
                                                            
                                                            <a href="javascript:editarSolicitud(<s:property value="idSolicitud"/>);" class="btn btn-primary btn-sm" data-placement="top" data-toggle="tooltip" data-title="Ver Solicitud">
                                                                 <i class="fas fa-eye"></i> <s:property value="apellidos"/>, <s:property value="nombre"/>
                                                                </a>
                                                            <br>(<s:property value="provincias.nombre"/>)
                                                        </td>
                                                        <td>
                                                            <s:property value="ciudad"/><br>
                                                            (<s:property value="provincias.nombre"/>)
                                                        </td>
                                                        <s:iterator value="solicitudDetalles" var="detalle" status="status">
                                                            <td>
                                                                <b><s:property value="curso.nombre"/></b>
                                                            </td>
                                                        </s:iterator>
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
                                                            <!-- PENDIENTE -->
                                                            <s:if test="solicitudEstados.idEstado==1">
                                                               
                                                                <a href="javascript:aceptarSolicitud(<s:property value="idSolicitud"/>);" class="btn btn-success btn-sm" data-placement="top" data-toggle="tooltip" data-title="Aceptar Solicitud">
                                                                <i class="fas fa-clipboard-check"></i>
                                                                </a>
                                                                <a href="#" class="btn btn-danger btn-sm" data-toggle="modal" data-id="<s:property value="idSolicitud"/>" 
                                                                   data-target="#modal_introducir_motivo" id="openModalDenegar" title="Anular Solicitud" >
                                                                    <i class="fas fa-times"></i>
                                                                </a>
                                                            </s:if>
                                                            <!-- denegada -->
                                                            <s:elseif test="solicitudEstados.idEstado==2">
                                                                 <a href="javascript:aceptarSolicitud();" class="btn btn-success btn-sm" data-placement="top" data-toggle="tooltip" data-title="Aceptar Solicitud">
                                                                <i class="fas fa-clipboard-check"></i>
                                                                </a>
                                                            </s:elseif>
                                                            <!-- aceptada -->
                                                            <s:elseif test="solicitudEstados.idEstado==3">
                                                                 <a href="#" class="btn btn-danger btn-sm" data-toggle="modal" data-id="<s:property value="idSolicitud"/>" 
                                                                   data-target="#modal_introducir_motivo" id="openModalDenegar" title="Anular Solicitud" >
                                                                    <i class="fas fa-times"></i>
                                                                </a>
                                                             </s:elseif>
                                                             <!-- validada -->
                                                             <s:elseif test="solicitudEstados.idEstado==4">
                                                                ver botones
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
                    <!-- end matriculas -->

                </div>
                <!-- END container-fluid -->

            </div>
            <!-- END content -->

        </div>
	<!-- END content-page -->
    
        <s:include value="../../includes/footer.jsp"/>
 
<div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-labelledby="modal_introducir_motivo" aria-hidden="true" id="modal_introducir_motivo">
	<div class="modal-dialog">
	    <div class="modal-content">
	        <form action="DenegarSolicitud" method="post" enctype="multipart/form-data">

	            <div class="modal-header">
	                <h5 class="modal-title">Añadir motivo de denegación</h5>
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
	            </div>

	            <div class="modal-body">                

	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="form-group">
	                            <label>Motivo <span class="text-danger">*</span></label>
	                            <textarea class="form-control" name="motivo" required placeholder="Introduce con detalles el motivo de la denegación" autofocus/></textarea>
	                        </div>
	                    </div>
	                </div>

	            </div>             

	            <div class="modal-footer">
                        <input type="hidden" id="idSolicitud" name="idSolicitud">
	                <button type="submit" class="btn btn-primary">Guardar</button>
	            </div>

	        </form>	

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
        
        $(document).on("click", "#openModalDenegar", function () {
                var idSolicitud = $(this).data('id');
                $(".modal-body #idSolicitud").val( idSolicitud );
                // As pointed out in comments, 
                // it is unnecessary to have to manually call the modal.
                // $('#addBookDialog').modal('show');
           });
        
        function aceptarSolicitud (id)
        {
            if (confirm('¿Estás seguro que quieres aceptar la solicitud?')) {
                window.location.href = 'AceptarSolicitud?idSolicitud='+id;
            }
        }
        function denegarSolicitud(id) {
            if (confirm("¿Estás seguro que quieres denegar la solicitud?")) {
                window.location.href = 'DenegarSolicitud?idSolicitud='+id;
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