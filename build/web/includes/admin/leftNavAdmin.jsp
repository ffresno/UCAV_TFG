<%-- 
    Document   : leftNavAdmin
    Created on : 10-abr-2019, 10:54:35
    Author     : fernandofresno
--%>

<%-- 
    Document   : leftNav.jsp
    Created on : 15-mar-2019, 16:10:21
    Author     : fernandofresno
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="left main-sidebar">

    <div class="sidebar-inner leftscroll">

        <div id="sidebar-menu">
              
            <ul>

                <li class="submenu">
                    <a 
                        <s:if test="opcionMenu==inicio">
                            class="active"
                        </s:if>
                    href="DashboardAdmin"><i class="fa fa-fw fa-home"></i> <span> Inicio </span> </a>
                </li>

                <li class="submenu">
                    <a 
                        <s:if test="opcionMenu==config">
                            class="active"
                        </s:if>
                        href="#"><i class="fa fa-fw fa-tv"></i> <span> Configuración </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="GestionUsuarios">Usuarios</a></li>
                        <li><a 
                                <s:if test="opcionSubMenu==cursos">
                                    class="active"
                                </s:if>
                                href="GestionCursos">Cursos</a></li>
                        <li><a href="GestionProvincias">Provincias (hibernate) </a></li>
                        <li><a href="GestionEstados">Estados Solicitud (hibernate)</a></li>
                        <li><a href="GestionDocumentos">Documentos a solicitar (hibernate)</a></li>
                        <li><a href="javascript:alert('No implementado');">Asignaturas</a></li>
                    </ul>
                </li>
                

            <div class="clearfix"></div>

        </div>

        <div class="clearfix"></div>

    </div>

</div>
