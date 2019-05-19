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
                    <a class="active" href="DashboardStudent"><i class="fa fa-fw fa-home"></i> <span> Inicio </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                         
                            <s:if test="opcionSubMenu==MisSolicitudes">
                                  <li class="active"><a href="DashboardStudent">Mis Solicitudes</a></li>
                                  <li><a href="NuevaSolicitud">Nueva Solicitud</a></li>
                            </s:if>
                            <s:else>
                                <li><a href="DashboardStudent">Mis Solicitudes</a></li>
                                <li class="active"><a href="NuevaSolicitud">Nueva Solicitud</a></li>
                            </s:else>
                    </ul>
                </li>

            <div class="clearfix"></div>

        </div>

        <div class="clearfix"></div>

    </div>

</div>