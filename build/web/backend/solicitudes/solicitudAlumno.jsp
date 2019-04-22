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

            
			<div class="alert alert-success" role="alert">
					  <h4 class="alert-heading">Solicitud</h4>
					  <p>Completa los datos de la matrícula para empezar a introducir los documentos.
                                          </p>
			</div>

			
			<div class="row">
			
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">						
						<div class="card mb-3">
							<div class="card-header">
								<h3><i class="fa fa-check-square-o"></i> Datos Personales</h3>
								Completa tus datos personales para que podamos recoger correctamente tu solicitud
							</div>
								
							<div class="card-body">
								
			<form>
                                                                    <div class="row">
                                                                        <div class="col-md-6 mb-3">
                                                                          <label for="validationServer01">Nombre <span class="text-danger">*</span></label>
                                                                          <input type="text" class="form-control" id="validationServer01" placeholder="Escribe tu nombre" required>
                                                                        </div>
                                                                        <div class="col-md-6 mb-3">
                                                                          <label for="validationServer02">Apellidos <span class="text-danger">*</span> </label>
                                                                          <input type="text" class="form-control" id="validationServer02" placeholder="Escribe tus apellidos" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-6 mb-3">
                                                                          <label for="validationServer01">D.N.I <span class="text-danger">*</span></label>
                                                                          <input type="text" class="form-control" id="validationServer01" placeholder="D.N.I" required>
                                                                        </div>
                                                                        <div class="col-md-6 mb-3">
                                                                          <label>Sexo <span class="text-danger">*</span></label>
                                                                          <div>
                                                                            Hombre: <input type="radio" name="sexo" value="hombre" checked>
                                                                            Mujer: <input type="radio" name="sexo" value="mujer">
                                                                          </div>
                                                                        </div>
										 
                                                                    </div>
                            <div class="form-group">
									<label for="inputAddress">Dirección <span class="text-danger">*</span></label>
									<input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
								  </div>
								  <div class="form-row">
									<div class="form-group col-md-6">
									  <label for="inputCity">Ciudad <span class="text-danger">*</span></label>
									  <input type="text" class="form-control" id="inputCity">
									</div>
									<div class="form-group col-md-4">
									  <label for="inputState">Provincia <span class="text-danger">*</span></label>
									  <select id="inputState" class="form-control">
										<option selected>Elige...</option>
										<option>...</option>
									  </select>
									</div>
									<div class="form-group col-md-2">
									  <label for="inputZip">C.Postal <span class="text-danger">*</span></label>
									  <input type="text" class="form-control" id="inputZip">
									</div>
								  </div>
                                                                    <div class="form-row">
                                                                                <div class="form-group col-md-6">
                                                                                  <label for="inputCity">Pais <span class="text-danger">*</span></label>
                                                                                  <input type="text" class="form-control" id="Pais">
                                                                                </div>
                                                                                <div class="form-group col-md-6">
                                                                                  <label for="inputCity">Nacionalidad <span class="text-danger">*</span></label>
                                                                                  <input type="text" class="form-control" id="Nacionalidad">
                                                                                </div>
                                                                          </div>
                                                                  <div class="form-row">
                                                                                <div class="form-group col-md-6">
                                                                                    <label for="inputCity">Teléfono 1 <span class="text-danger">*</span></label>
                                                                                  <input type="text" class="form-control" id="telefono1">
                                                                                </div>
                                                                                <div class="form-group col-md-6">
                                                                                  <label for="inputCity">Teléfono 2</label>
                                                                                  <input type="text" class="form-control" id="telefono2">
                                                                                </div>
                                                                          </div>
                                                                  <div class="form-row">
                                                                      <div class="form-group col-md-12">
                                                                            <label for="inputCity">Email</label>
                                                                            <input type="email" class="form-control" id="email" placeholder="Email">
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
										<div class="form-check">
										  <label class="form-check-label">
											<input class="form-check-input" type="radio" name="cursos" id="gridRadios1" value="option1" checked>
											Ciclo formativo 1
										  </label>
										</div>
										<div class="form-check">
										  <label class="form-check-label">
											<input class="form-check-input" type="radio" name="cursos" id="gridRadios2" value="option2">
											Ciclo formativo 2
										  </label>
										</div>
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
									<label>Nº de Expediente <span class="text-danger">*</span></label>
									<input type="text" class="form-control" id="expediente" placeholder="Nº Expediente" required>
									<small id="numberlHelp" class="form-text text-muted">xxxxxxxxxxxxx </small>
								  </div>
                                                                    <div class="form-group">
									<label for="exampleInputEmail1">Estudios aportados <span class="text-danger">*</span></label>
									<input type="text" class="form-control" id="estudios" placeholder="Estudios" required>
									<small id="numberlHelp" class="form-text text-muted">Introduce el titulo que aportas para poder acceder a este título</small>
								  </div>
								  <div class="form-group">
									<label for="exampleInputEmail1">Centro de procedencia <span class="text-danger">*</span></label>
									<input type="text" class="form-control" id="procedencia" placeholder="Centro de procedencia" required>
									<small id="numberlHelp" class="form-text text-muted">Introduce el Centro de procedencia de los estudios aportados</small>
								  </div>
								  <div class="form-check">
									<label class="form-check-label">
									  <input type="checkbox" class="form-check-input" name="primeravez">
									  ¿Se matricula por primera vez en este centro?
									</label>
								  </div>
                                                                    <div class="form-check">
									<label class="form-check-label">
									  <input type="checkbox" class="form-check-input" name="repite">
									  ¿Repite el mismo curso?
									</label>
								  </div>
                                                                    <div class="form-check">
									<label class="form-check-label">
									  <input type="checkbox" class="form-check-input" name="traslado">
									  ¿Realiza traslado de matrícula?
									</label>
								  </div>
                                                                    <div class="form-check">
									<label class="form-check-label">
									  <input type="checkbox" class="form-check-input" name="exento">
                                                                          ¿Está exento de Seguro Escolar? <em>Mayores de 18 años exentos</em>
                                    
									</label>
								  </div>
                                                                    <p></p>
								 
								  <div class="form-group row">
									<div class="col-sm-10">
									  <button type="submit" class="btn btn-primary">Enviar Solicitud</button>
									</div>
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
    
	<s:include value="../../includes/footer.jsp"/>

</div>
<!-- END main -->



<!-- BEGIN Java Script for this page -->
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/plugins/switchery/switchery.min.js"></script>
<s:include value="../../includes/js.jsp"/>
<!-- END Java Script for this page -->

</body>
</html>
