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
                    href="DashboardStudent"><i class="fa fa-fw fa-home"></i> <span> Inicio </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="DashboardStudent">Mis Solicitudes</a></li>
                        <li><a href="NuevaSolicitud">Nueva Solicitud</a></li>
                        
                    </ul>
                </li>

            <div class="clearfix"></div>

        </div>

        <div class="clearfix"></div>

    </div>

</div>