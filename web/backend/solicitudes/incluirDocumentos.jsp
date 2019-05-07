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
                                 
                                    

                                </div>
                                <br>
                                <form action="UploadDocumentos" method="POST" enctype="multipart/form-data">
                                    <s:iterator value="listDocumentos" var="documento" status="status">
                                    <!-- inlcuir la carga de archivos -->
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">						
                                            <div class="card mb-3">
                                                    <div class="card-header">
                                                            <h3><i class="fa fa-file"></i> DOCUMENTO ${status.count}: <s:property value="nombre"/></h3>
                                                            <s:property value="descripcion"/>.
                                                    </div>

                                                    <div class="card-body">

                                                            <input type="file" name="ficheros[]" id="filer_ficheros${status.count}" multiple="multiple">
                                                    </div>														
                                            </div><!-- end card-->					
                                        </div>
                                    </s:iterator>
                                    <div class="form-group text-left m-b-0">
                                        <button class="btn btn-primary" type="submit">
                                            Adjuntar documentación
                                        </button>
                                        <a href="javascript:history.back();" class="btn btn-secondary m-l-5">
                                            Cancelar
                                        </a>
                                    </div>
                                </form>
                                
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
                
                
                 <s:iterator value="listDocumentos" var="documento" status="status">
                    $('#filer_ficheros${status.count}').filer({
                    limit: 3,
                    maxSize: 3,
                    extensions: ['jpg', 'jpeg', 'png', 'gif', 'pdf'],
                    changeInput: true,
                    showThumbs: true,
                    addMore: true
                    });
                 
            </s:iterator>
        } );
       
        // END CODE Individual column searching (text inputs) DATA TABLE 	 	
	</script>	
<!-- END Java Script for this page -->

</body>
</html>