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
                    href="DashboardStudent"><i class="fa fa-fw fa-home"></i> <span> Inicio </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="DashboardStudent">Mis Solicitudes</a></li>
                        <li><a href="SolicitudAlumno">Nueva Solicitud</a></li>
                        
                    </ul>
                </li>

                <li class="submenu">
                    <a href="#"><i class="fa fa-fw fa-th"></i> <span> Alumnos </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="MatriculaAlumno">Matriculación</a></li>
                        <li><a href="star-rating.html">Mis Solicitudes</a></li>
                        <li><a href="range-sliders.html">Range Sliders</a></li>
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