<%-- 
    Document   : registroUsuarioSuccess.jsp
    Created on : 09-abr-2019, 16:17:20
    Author     : fernandofresno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Registro del Alumno</title>
        <!-- INCLUDE CSS for this page -->
        <s:include value = "../../includes/headerCss.jsp"/>
        
        <!-- Mi CSS -->
        <link href="assets/css/login.css" rel="stylesheet">

    </head>
    
    

    <body class="adminbody">

        <div id="main">
            
            <div class="login-menu">
                <div class="container">
                  <nav class="nav">
                    <a class="nav-link active" href="Login">Inicio</a>
                  </nav>
                </div>
            </div>

            <div class="content-page">

                <!-- Start content -->
                <div class="content">

                    <div class="container-fluid">


                        <div class="row">
                            <div class="col-xl-10">
                                <div class="breadcrumb-holder">
                                    <h1 class="main-title float-left">Registro de Usuario</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item"><a href="Login">Inicio</a></li>
                                        <li class="breadcrumb-item active">Registro de Usuario</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        
                        <div class="alert alert-success col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10" role="alert">
                            <h4 class="alert-heading">Correcto!</h4>
                            <p><s:property value="msg"/>. Recibirá un correo indicándole los datos de acceso en el email registrado.</p>
                        </div>

                    </div>
                    <!-- END container-fluid -->

                </div>
                <!-- END content -->

            </div>
            <!-- END content-page -->

        </div>
        <!-- END main -->

        <!-- END main -->
        <s:include value="../../includes/js.jsp"/>

    </body>
</html>
