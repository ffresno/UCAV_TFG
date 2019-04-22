<%-- 
    Document   : topBarNav.jsp
    Created on : 15-mar-2019, 16:08:37
    Author     : fernandofresno
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- top bar navigation -->
<div class="headerbar">

    <!-- LOGO -->
    <div class="headerbar-left">
        <a href="index.html" class="logo">
            <!--<img alt="Logo" src="assets/img/logo.png" /> -->
            <span>Sist. Doc. Online</span>
        </a>
    </div>

    <nav class="navbar-custom">

        <ul class="list-inline float-right mb-0">

            <li class="list-inline-item dropdown notif">
                <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <i class="fa fa-fw fa-question-circle"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-arrow dropdown-arrow-success dropdown-lg">
                    <!-- item-->
                    <div class="dropdown-item noti-title">
                        <h5><small>Help and Support</small></h5>
                    </div>

                    <!-- item-->
                    <a target="_blank" href="https://www.pikeadmin.com" class="dropdown-item notify-item">                                    
                        <p class="notify-details ml-0">
                            <b>Do you want custom development to integrate this theme?</b>
                            <span>Contact Us</span>
                        </p>
                    </a>

                    <!-- item-->
                    <a target="_blank" href="https://www.pikeadmin.com/pike-admin-pro" class="dropdown-item notify-item">                                    
                        <p class="notify-details ml-0">
                            <b>Do you want PHP version of the theme that save dozens of hours of work?</b>
                            <span>Try Pike Admin PRO</span>
                        </p>
                    </a>                               
                </div>
            </li>

            

     
            <li class="list-inline-item dropdown notif">
                <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <img src="assets/img/admin.png" alt="Profile image" class="avatar-rounded">
                </a>
                <div class="dropdown-menu dropdown-menu-right profile-dropdown">
                    <!-- item-->
                    <div class="dropdown-item noti-title">
                        <h5 class="text-overflow"><small>Hola, ${appUser.nombre} </small> </h5>
                    </div>

                    <!-- item-->
                    <a href="javascript:alert('No implementado');" class="dropdown-item notify-item">
                        <i class="fa fa-user"></i> <span>Perfil</span>
                    </a>

                    <!-- item-->
                    <a href="Logout" class="dropdown-item notify-item">
                        <i class="fa fa-power-off"></i> <span>Salir</span>
                    </a>

                </div>
            </li>

        </ul>

        <ul class="list-inline menu-left mb-0">
            <li class="float-left">
                <button class="button-menu-mobile open-left" title="Ocultar Menú">
                    <i class="fa fa-fw fa-bars"></i>
                </button>
            </li>                        
        </ul>

    </nav>

</div>
	<!-- End Navigation -->
