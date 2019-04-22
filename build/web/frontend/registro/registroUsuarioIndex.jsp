<%-- 
    Document   : registroUsuarioIndex
    Created on : 26-mar-2019, 12:12:45
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
                            <p>Registro completado correctamente.</p>
                        </div>


                        <div class="row">

                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10">						
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <h3><i class="fa fa-hand-pointer-o"></i> Registro de alumno</h3>
                                        Mediante este formulario podrás registrarte en el sistema de matrícula online. 
                                        Primero deberás registrarte en el sistema con el número de autorización suministrado 
                                        y esperar a que tu registro sea aceptado o rechazado. 
                                        Te informaremos por email de cualquier cambio, por lo que tu email es muy importante que sea el correcto.
                                    </div>

                                    <div class="card-body">

                                        <form action="RegistroAction" method="POST" id="registro" data-parsley-validate novalidate>
                                            <div class="form-group">
                                                <label for="nombre">Nombre <span class="text-danger">*</span></label>
                                                <input type="text" name="nombre" data-parsley-trigger="change" required="" placeholder="Introduce el nombre" class="form-control" id="nombre" >
                                                <ul class="parsley-errors-list filled">
                                                    <li>
                                                    <s:fielderror fieldName="nombre"/>
                                                    </li>
                                                </ul>
                                           
                                            </div>
                                            <div class="form-group">
                                                <label for="apellidos">Apellidos <span class="text-danger">*</span></label>
                                                <input name="apellidos" data-parsley-trigger="change" required="" placeholder="Introduce tus apellidos" class="form-control" id="apellidos" data-parsley-length="[5, 100]"/>
                                                <ul class="parsley-errors-list filled">
                                                    <li>
                                                    <s:fielderror fieldName="apellidos"/>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="form-group">
                                                <label for="emailAddress">Email <span class="text-danger">*</span></label>
                                                <input name="email" data-parsley-trigger="change" type="email" required="" placeholder="Enter email" class="form-control" id="email" data-parsley-length="[5, 100]" style="text-transform: lowercase"/>
                                                <ul class="parsley-errors-list filled">
                                                    <li>
                                                    <s:fielderror fieldName="email"/>
                                                    </li>
                                                </ul>
  
                                            </div>

                                            <div class="form-group">
                                                <label for="password">Password <span class="text-danger">*</span></label>
                                                <input name="password" type="password" placeholder="Password" required="" class="form-control" id="password" data-parsley-length="[4, 15]"/>
                                                 <ul class="parsley-errors-list filled">
                                                    <li>
                                                    <s:fielderror fieldName="password"/>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="form-group">
                                                <label for="passWord2">Confirma Password <span class="text-danger">*</span></label>
                                                <input name="pass2" type="password" data-parsley-equalto="#password" required="" placeholder="Confirma la contraseña" class="form-control" id="pass2" data-parsley-length="[4, 15]"/>
                                                <ul class="parsley-errors-list filled">
                                                    <li>
                                                    <s:fielderror fieldName="pass2"/>
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="form-group text-right m-b-0">
                                                <button class="btn btn-primary" type="submit">
                                                    Enviar
                                                </button>
                                                <a role="button" class="btn btn-secondary m-l-5" href="Login">Volver</a>
                                              
                                            </div>

                                        </form>

                                    </div>														
                                </div><!-- end card-->					
                            </div>
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


        <!-- BEGIN Java Script for this page -->
        <script src="assets/js/parsley.min.js"></script>
        <script src="assets/js/es/es.js"></script>
        
        <script type="text/javascript">
                $('#registro').parsley();
                $('#nombre').addClass('form-control');
                $('#apellidos').addClass('form-control');
                $('#email').addClass('form-control');
                $('#password').addClass('form-control');
                $('#pass2').addClass('form-control');
        </script>
        <!-- END Java Script for this page -->

    </body>
</html>