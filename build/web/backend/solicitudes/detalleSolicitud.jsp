<%-- 
    Document   : detalleSolicitud
    Created on : 14-may-2019, 10:57:35
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
        
        <title>Detalle de solicitud del Alumno</title>
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
        
        <%
            /////////////////////////////////////////
            //          Access control
            /////////////////////////////////////////
            if (session.getAttribute("AccessLevel") == "admin") {
        %>
            <s:include value="../../includes/admin/leftNavAdmin.jsp"/>
        <%
        } else {
        %>
            <s:include value="../../includes/student/leftNavStudent.jsp"/>
        <%
            }
        %>
       
         
	<!-- End Sidebar -->


    <div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
            <div class="container-fluid">


                <div class="row">
                    <div class="col-xl-12">
                        <div class="breadcrumb-holder">
                            <h1 class="main-title float-left">Detalle solicitud</h1>
                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item">Inicio</li>
                                <li class="breadcrumb-item active">Detalle solicitud</li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            <!-- end row -->

            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="solicitud-tab" data-toggle="tab" href="#detalleSolicitud" role="tab" aria-controls="detalleSolicitud" aria-selected="true">Detalle</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="documentos-tab" data-toggle="tab" href="#documentos" role="tab" aria-controls="documentos" aria-selected="false">Documentación Aportada</a>
                </li>
              </ul>
              <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="detalleSolicitud" role="tabpanel" aria-labelledby="solicitud-tab">
                     <br>
                     
                    <s:iterator value="listSolicitudes" var="solicitud" status="status">
                        <p>
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
                       <p>
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
                                                    <input type="text" class="form-control" placeholder="Escribe tu nombre" 
                                                           name="nombre" data-parsley-trigger="change" data-parsley-length="[4, 50]" 
                                                           disabled value="<s:property value="nombre"/>"/>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label>Apellidos <span class="text-danger">*</span> </label>
                                                    <input type="text" class="form-control" placeholder="Escribe tus apellidos" 
                                                           name="apellidos" data-parsley-trigger="change" data-parsley-length="[5, 100]" 
                                                           disabled value="<s:property value="apellidos"/>"/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label>D.N.I <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" placeholder="D.N.I" name="dni" 
                                                           data-parsley-trigger="change" data-parsley-length="[1, 15]" 
                                                           disabled value="<s:property value="dni"/>"/>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label>Sexo <span class="text-danger">*</span></label>
                                                    <div>
                                                        Hombre: <input type="radio" name="sexohombre" value="true" 
                                                                    <s:if test="sexohombre==1">             
                                                                        checked
                                                                    </s:if>
                                                                >
                                                        Mujer: <input type="radio" name="sexohombre" value="false"

                                                                      <s:if test="sexohombre==0">             
                                                                        checked
                                                                    </s:if>
                                                                        disabled>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <label>Dirección <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="inputAddress" placeholder="Dirección" 
                                                       name="direccion" data-parsley-trigger="change" data-parsley-length="[1, 100]" 
                                                       disabled value="<s:property value="direccion"/>"/>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label>Ciudad <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="ciudad" 
                                                           data-parsley-trigger="change" data-parsley-length="[1, 100]" 
                                                           disabled value="<s:property value="ciudad"/>"/>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label>Provincia <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="provincia" 
                                                           data-parsley-trigger="change" data-parsley-length="[1, 100]" 
                                                           disabled value="<s:property value="provincias.nombre"/>"/>
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <label>C.Postal <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="codigoPostal" 
                                                           data-parsley-trigger="change" data-parsley-length="[1, 6]" 
                                                           disabled value="<s:property value="codigoPostal"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label>Pais <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="pais" data-parsley-trigger="change" 
                                                           data-parsley-length="[1, 50]" 
                                                           disabled value="<s:property value="pais"/>"/>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label>Nacionalidad <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="nacionalidad" 
                                                           data-parsley-trigger="change" data-parsley-length="[1, 100]" 
                                                           disabled value="<s:property value="nacionalidad"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label>Teléfono 1 <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="telefono1" 
                                                           data-parsley-trigger="change" data-parsley-length="[1, 12]" 
                                                           disabled value="<s:property value="telefono1"/>"/>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label>Teléfono 2</label>
                                                    <input type="text" class="form-control" name="telefono2" 
                                                           data-parsley-trigger="change" data-parsley-length="[1, 12]"
                                                           disabled value="<s:property value="telefono2"/>"/>
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
                                            <h3><i class="fa fa-check-square-o"></i> Usted hizo la solicitud en:</h3>
                                            Curso que seleccionó.
                                        </div>

                                        <div class="card-body">

                                            <fieldset class="form-group">
                                                <div class="row">
                                                    <div class="col-sm-10">
                                                        <div class="form-check">
                                                            <label class="form-check-label">
                                                                <s:iterator value="solicitudDetalles" var="detalle" status="status">
                                                                    <h5 class="uppercase"> <s:property value="curso.nombre"/></h5>

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
                                                <label>Nº de Expediente </label>
                                                <input type="text" class="form-control" id="expediente" placeholder="Nº Expediente" disabled>
                                            </div>
                                            <div class="form-group">
                                                <label>Estudios aportados <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="estudios" placeholder="Estudios" 
                                                       name="estudiosAportados" data-parsley-trigger="change" 
                                                       data-parsley-length="[1, 50]" 
                                                       disabled value="<s:property value="estudiosAportados"/>"/>
                                                <small class="form-text text-muted">Introduce el titulo que aportas para poder acceder a este título</small>
                                            </div>
                                            <div class="form-group">
                                                <label>Centro de procedencia </label>
                                                <input type="text" class="form-control" id="procedencia" 
                                                       placeholder="Centro de procedencia" name="centroProcedencia" 
                                                       data-parsley-trigger="change" data-parsley-length="[1, 100]"
                                                       disabled value="<s:property value="centroProcedencia"/>"/>
                                                <small class="form-text text-muted">Introduce el Centro de procedencia de los estudios aportados</small>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input" name="primeraVez" id="primeraVez" 
                                                           <s:if test="primeraVez==1">
                                                            checked
                                                           </s:if>
                                                           disabled>
                                                    ¿Se matricula por primera vez en este centro?
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input" name="repiteCurso" id="repiteCurso" 
                                                           <s:if test="repiteCurso==1">
                                                            checked
                                                           </s:if>
                                                           disabled>
                                                    ¿Repite el mismo curso?
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input" name="trasladoMatricula" id="trasladoMatricula" 
                                                           <s:if test="trasladoMatricula==1">
                                                            checked
                                                           </s:if>
                                                           disabled>
                                                    ¿Realiza traslado de matrícula?
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input" name="exentoSeguro" id="exentoSeguro" 
                                                            <s:if test="exentoSeguro==1">
                                                            checked
                                                           </s:if>
                                                           disabled>
                                                    ¿Está exento de Seguro Escolar? <em>Mayores de 18 años exentos</em>

                                                </label>
                                            </div>
                                            <p></p>
                                            </s:iterator>

                                        </div>							
                                    </div><!-- end card-->					
                                </div>


                            </div>

                        </form>


                        </s:iterator>
                    
                    
                    
                </div><!-- fin tab detalle -->
                
                
                
                
                <div class="tab-pane fade" id="documentos" role="tabpanel" aria-labelledby="documentos-tab">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">						
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h3><i class="fa fa-check-square-o"></i> Documentos adjuntos a la solicitud</h3>
                                    Documentos que ha adjuntado el estudiante a la solicitud
                                </div>

                                <div class="card-body">

                    
                                        <div class="table-responsive">
                                            <table id="documentosTable" class="table table-bordered table-hover display">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>DESCRIPCION</th>
                                                        <th>DOCUMENTO APORTADO</th>
                                                    </tr>
                                                </thead>									
                                                <tbody>
                                                    <s:iterator value="listSolicitudes" var="solicitud" status="status">
                                                        <s:iterator value="solicitudDocumentoses" var="documentos" status="status">
                                                            <tr style="text-transform: uppercase;">
                                                                <td>${status.count}</td>
                                                                <td>
                                                                    <s:property value="documentos.nombre"/>
                                                                </td>
                                                                 <td>
                                                                     <a href="<s:property value="rutaDocumento"/>" target="_blank">
                                                                     <i class="fa fa-eye" aria-hidden="true"></i> Ver documento
                                                                     </a>

                                                                </td>
                                                             </tr>
                                                        </s:iterator>
                                                    </s:iterator>
                                                </tbody>
                                            </table>
                                        </div>
                        </div></div></div></div>
                </div> <!-- fin tab documentos -->
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
<s:include value="../../includes/js.jsp"/>
<script src="assets/js/parsley.min.js"></script>
<script src="assets/js/es/es.js"></script>
<!-- END Java Script for this page -->
<!-- BEGIN Java Script for this page -->
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

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

        $('#documentosTable').dataTable( {
                    "language": {
                        "sUrl": "assets/js/es/dataTablesSpanish.txt"
                    }
                } );
    });
    // END CODE Individual column searching (text inputs) DATA TABLE 	 	
</script>

</body>
</html>
