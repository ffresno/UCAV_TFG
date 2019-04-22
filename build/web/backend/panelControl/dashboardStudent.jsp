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
    <title>DashBoard - Esdudiantes</title>
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
                    <!-- end row -->
                    <div class="row">
                        <h1>Usuario: <s:property value="username"/> <br>
                            Contraseña:<s:property value="password"/> 
                        <br>
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
                        </h1>
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
                                                    <th>Nombre y Apellidos</th>
                                                    <th>email</th>
                                                    <th>Nº Autorización</th>
                                                    <th>Curso Escolar</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>									
                                            <tbody>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>test@email.com</td>
                                                    <td>1111111</td>
                                                    <td>2018/2019</td>
                                                    <td>Pendiente</td>
                                                    <td>Aceptar | Borrar</td>
                                                </tr>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>test@email.com</td>
                                                    <td>1111111</td>
                                                    <td>2018/2019</td>
                                                    <td>Pendiente</td>
                                                    <td>Aceptar | Borrar</td>
                                                </tr>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>test@email.com</td>
                                                    <td>1111111</td>
                                                    <td>2018/2019</td>
                                                    <td>Pendiente</td>
                                                    <td>Aceptar | Borrar</td>
                                                </tr><tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>test@email.com</td>
                                                    <td>1111111</td>
                                                    <td>2018/2019</td>
                                                    <td>Pendiente</td>
                                                    <td>Aceptar | Borrar</td>
                                                </tr>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>test@email.com</td>
                                                    <td>1111111</td>
                                                    <td>2018/2019</td>
                                                    <td>Pendiente</td>
                                                    <td>Aceptar | Borrar</td>
                                                </tr>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>test@email.com</td>
                                                    <td>1111111</td>
                                                    <td>2018/2019</td>
                                                    <td>Pendiente</td>
                                                    <td>Aceptar | Borrar</td>
                                                </tr>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>test@email.com</td>
                                                    <td>1111111</td>
                                                    <td>2018/2019</td>
                                                    <td>Pendiente</td>
                                                    <td>Aceptar | Borrar</td>
                                                </tr>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>test@email.com</td>
                                                    <td>1111111</td>
                                                    <td>2018/2019</td>
                                                    <td>Pendiente</td>
                                                    <td>Aceptar | Borrar</td>
                                                </tr>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>test@email.com</td>
                                                    <td>1111111</td>
                                                    <td>2018/2019</td>
                                                    <td>Pendiente</td>
                                                    <td>Aceptar | Borrar</td>
                                                </tr>
                                                
                                                
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