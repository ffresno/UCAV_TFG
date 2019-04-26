<%-- 
    Document   : form-alumno
    Created on : 18-mar-2019, 12:04:57
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

        <title>Registro de matrícula del Alumno</title>
        <!-- INCLUDE CSS for this page -->
        <s:include value = "../../includes/headerCss.jsp"/>
        <!-- END CSS for this page -->
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
				
</head>

<body class="adminbody">

<div id="main">

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
                            <h1 class="main-title float-left">Nueva solicitud</h1>
                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item">Inicio</li>
                                <li class="breadcrumb-item active">Nueva solicitud</li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            <!-- end row -->

            <!--
			<div class="alert alert-success" role="alert">
					  <h4 class="alert-heading">Solicitud</h4>
					  <p>Completa los datos de la matrícula para empezar a introducir los documentos.
                                          </p>
			</div>
            -->

            <form action="GuardarSolicitud" method="post" enctype="multipart/form-data" id="solicitud">
                <div class="row">

                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">						
                        <div class="card mb-3">
                            <div class="card-header">
                                <h3><i class="fa fa-check-square-o"></i> Datos Personales</h3>
                                Completa tus datos personales para que podamos recoger correctamente tu solicitud
                            </div>

                            <div class="card-body">


                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label>Nombre <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" placeholder="Escribe tu nombre" name="nombre" data-parsley-trigger="change" data-parsley-length="[4, 50]" required/>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label>Apellidos <span class="text-danger">*</span> </label>
                                        <input type="text" class="form-control" placeholder="Escribe tus apellidos" name="apellidos" data-parsley-trigger="change" data-parsley-length="[5, 100]" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label>D.N.I <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" placeholder="D.N.I" name="dni" data-parsley-trigger="change" data-parsley-length="[1, 15]" required/>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label>Sexo <span class="text-danger">*</span></label>
                                        <div>
                                            Hombre: <input type="radio" name="sexohombre" value="true" checked>
                                            Mujer: <input type="radio" name="sexohombre" value="false">
                                        </div>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label>Dirección <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="inputAddress" placeholder="Dirección" name="direccion" data-parsley-trigger="change" data-parsley-length="[1, 100]" required/>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Ciudad <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="ciudad" data-parsley-trigger="change" data-parsley-length="[1, 100]" required/>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Provincia <span class="text-danger">*</span></label>
                                        <select id="inputState" class="form-control" required name="idProvincia">
                                            <option value="">Elige...</option>
                                            <s:iterator value="listProvincias" var="provincia" status="status">
                                                <option value="<s:property value="idProvincia"/>"><s:property value="nombre"/></option>
                                            </s:iterator>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label>C.Postal <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="codigoPostal" data-parsley-trigger="change" data-parsley-length="[1, 6]" required/>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Pais <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="pais" data-parsley-trigger="change" data-parsley-length="[1, 50]" required/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Nacionalidad <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="nacionalidad" data-parsley-trigger="change" data-parsley-length="[1, 100]" required/>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Teléfono 1 <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="telefono1" data-parsley-trigger="change" data-parsley-length="[1, 12]" required/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Teléfono 2</label>
                                        <input type="text" class="form-control" name="telefono2" data-parsley-trigger="change" data-parsley-length="[1, 12]"/>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label>Email</label>
                                        <input type="email" class="form-control" id="email" placeholder="Email" value="${appUser.email} " disabled>
                                    </div>
                                </div>
                            </div>		


                        </div><!-- end card-->					
                    </div>



                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">						
                        <div class="card mb-3">
                            <div class="card-header">
                                <h3><i class="fa fa-check-square-o"></i> Cursos disponibles</h3>
                                Seleccione el curso al que se desea matricular.
                            </div>

                            <div class="card-body">

                                <fieldset class="form-group">
                                    <div class="row">
                                        <div class="col-sm-10">
                                            <s:iterator value="listCursos" var="curso" status="status">
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input class="form-check-input" type="radio" name="idCurso" value="<s:property value="idCurso"/>" required><s:property value="nombre"/>
                                                    </label>
                                                </div>
                                            </s:iterator>
                                        </div>
                                    </div>
                                </fieldset>
                                <div class="form-group row">
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" disabled checked> Modalidad e-Learning
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Nº de Expediente </label>
                                    <input type="text" class="form-control" id="expediente" placeholder="Nº Expediente" disabled>
                                </div>
                                <div class="form-group">
                                    <label>Estudios aportados <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="estudios" placeholder="Estudios" name="estudiosAportados" data-parsley-trigger="change" data-parsley-length="[1, 50]" required/>
                                    <small class="form-text text-muted">Introduce el titulo que aportas para poder acceder a este título</small>
                                </div>
                                <div class="form-group">
                                    <label>Centro de procedencia <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="procedencia" placeholder="Centro de procedencia" name="centroProcedencia" data-parsley-trigger="change" data-parsley-length="[1, 100]"/>
                                    <small class="form-text text-muted">Introduce el Centro de procedencia de los estudios aportados</small>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" name="primeraVez" id="primeraVez" value="false" onchange="javascript:setValueToCheckBox('primeraVez')">
                                        ¿Se matricula por primera vez en este centro?
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" name="repiteCurso" id="repiteCurso" value="false" onchange="javascript:setValueToCheckBox('repiteCurso')">
                                        ¿Repite el mismo curso?
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" name="trasladoMatricula" id="trasladoMatricula" value="false" onchange="javascript:setValueToCheckBox('trasladoMatricula')">
                                        ¿Realiza traslado de matrícula?
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" name="exentoSeguro" id="exentoSeguro" value="false" onchange="javascript:setValueToCheckBox('exentoSeguro')">
                                        ¿Está exento de Seguro Escolar? <em>Mayores de 18 años exentos</em>

                                    </label>
                                </div>
                                <p></p>

                                <div class="form-group row">
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-primary">Enviar Solicitud</button>
                                    </div>
                                </div>

                            </div>							
                        </div><!-- end card-->					
                    </div>


                </div>

            </form>





            </div>
			<!-- END container-fluid -->

		</div>
		<!-- END content -->

    </div>
	<!-- END content-page -->
    
	<s:include value="../../includes/footer.jsp"/>

</div>
<!-- END main -->



<!-- BEGIN Java Script for this page -->
<s:include value="../../includes/js.jsp"/>
<script src="assets/js/parsley.min.js"></script>
<script src="assets/js/es/es.js"></script>
<!-- END Java Script for this page -->


<script>
    
  
    function setValueToCheckBox(name)  
    {  
        var checkbox = document.getElementById(name); 
        if (checkbox.checked) {
            checkbox.value = true;
          } else {
            checkbox.value = false;
          }
    }  


    // START CODE Individual column searching (text inputs) DATA TABLE 		
    $(document).ready(function () {
        // Setup - add a text input to each footer cell
        // DataTable
        $('#solicitud').parsley();


    });
    // END CODE Individual column searching (text inputs) DATA TABLE 	 	
</script>

</body>
</html>
