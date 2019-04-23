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
                        <h1><s:property value="opcionMenu"/></h1>
                        <h1><s:property value="opcionSubMenu"/></h1>
            <ul>

                <li class="submenu">
                    <a 
                        <s:if test="opcionMenu==inicio">
                            class="active"
                        </s:if>
                    href="DashboardAdmin"><i class="fa fa-fw fa-home"></i> <span> Inicio </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="DashboardAdmin">Registros</a></li>
                        <li><a href="tables-datatable.html">Matrículas</a></li>
                    </ul>
                </li>

                <li class="submenu">
                    <a href="#"><i class="fa fa-fw fa-tv"></i> <span> Configuración </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="GestionCursos">Cursos</a></li>
                        <li><a href="CRUDAsignaturas">Asignaturas</a></li>
                        <li><a href="GestionUsuarios">Usuarios</a></li>
                        <li><a href="GestionProvincias">Provincias (hibernate) </a></li>
                        <li><a href="tree-view.html">Tree View</a></li>
                        <li><a href="sweetalert.html">SweetAlert</a></li>
                        <li><a href="calendar.html">Calendar</a></li>
                        <li><a href="gmaps.html">GMaps</a></li>
                        <li><a href="counter-up.html">Counter-Up</a></li>
                    </ul>
                </li>
                

            <div class="clearfix"></div>

        </div>

        <div class="clearfix"></div>

    </div>

</div>
