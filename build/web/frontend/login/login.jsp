<%-- 
    Document   : login
    Created on : 14-mar-2019, 9:13:48
    Author     : fernandofresno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<!--  Plantilla obtenida de https://www.pikeadmin.com/login/ -->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
         <title>Index - TFG - Fernando del Fresno García</title>

        <!-- Core CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">

        <!-- Mi CSS -->
        <link href="assets/css/login.css" rel="stylesheet">
    </head>

<body>

<div class="login-menu">
      <div class="container">
        <nav class="nav">
          <a class="nav-link active" href="#">Login</a>
        </nav>
          
      </div>
</div>

<div class="container h-100">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="card">
            <h4 class="card-header">Acceso - Plafatorma de gestión de Matrículas</h4>
            <div class="card-body">
                <!--<form data-toggle="validator" role="form" method="post" action="login">-->
                <form action="CheckLogin" method="POST">
                    <s:if test="showMsg()">
                        <div class="alert alert-danger" style="text-aling:center;">
                            <p><s:property value="msg" /></p>
                        </div>
                    </s:if>
                    <div class="row">	
                        
                        <div class="col-md-12">    
                            <div class="form-group">
                                <label>Email</label>
                                <div class="input-group">
                                  <s:textfield escapeHtml="false" name="email" cssClass="form-control" required="" data-error="Introduce el email"/>

                                </div>								
                                <div class="help-block with-errors text-danger"></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">								
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Contraseña</label>
                                <div class="input-group">
                                        <s:password name="password"  data-minlength="6" cssClass="form-control" data-error="Introduce la contraseña" required=""/>
                                </div>	
                                <div class="help-block with-errors text-danger"></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <input type="hidden" name="redirect" value="">
                            <input type="submit" class="btn btn-primary btn-lg btn-block" value="Login" name="submit">
                        </div>
                    </div>
               </form>

                <div class="clear"></div>
                <div class="clear"></div>
                <div class="alert alert-warning" sytle="width:50%;" role="alert">
                    Si todavía no tienes cuenta, <a href="RegistroUsuario" class="alert-link">registrate aquí!</a>. 
                </div>            
        </div>	
                                  
    </div>
                                
    </div>
         
    <!-- Footer -->
<!-- Footer -->
<footer class="page-footer font-small blue">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">
      © 2019 Trabajo realizado por 
    <a href="mailto:fernandofresno@gmail.com"> Fernando del Fresno García</a> (Pasarela adaptación al Grado - UCAV)
    <br> Trabajo final para Desarrollo de Aplicaciones Web I y II
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->
</div>
</body>
</html>