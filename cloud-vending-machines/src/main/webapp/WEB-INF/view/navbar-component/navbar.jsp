<%--
  Created by IntelliJ IDEA.
  User: dplab
  Date: 21/07/2022
  Time: 08:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg bg-dark navbar-dark shadow-sm py-3 py-lg-0 px-3 px-lg-0">
    <a href="#" class="navbar-brand d-block d-lg-none">
        <h1 class="m-0 text-uppercase text-white"><i class="fa fa-coffee fs-1 text-primary me-3"></i>CVM<i class="fas fa-cookie fs-1 text-primary m-3"></i></h1>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto mx-lg-auto py-0">
            <a href="#" class="nav-item nav-link active">Home</a>
            <a href="#" class="nav-item nav-link" data-bs-toggle="modal" data-bs-target="#myModalReg">Signup</a>
            <a href="#" class="nav-item nav-link" data-bs-toggle="modal" data-bs-target="#myModal">Login</a>
            <a href="#" class="nav-item nav-link" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop">Mappa Macchinette</a>
            <a href="#" class="nav-item nav-link" data-bs-toggle="modal" data-bs-target="#myModalProduct">Prodotti</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Area Tecnica</a>
                <div class="dropdown-menu m-0">
                    <a href="#" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#myModal">Amministratore</a>
                    <a href="#" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#myModal">Tecnico</a>
                </div>
            </div>
            <a href="contact.html" class="nav-item nav-link" data-bs-toggle="modal" data-bs-target="#myModalContact">Contatti</a>
        </div>
    </div>
</nav>
<!-- Navbar End -->

<%--Modal Login--%>
<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
<jsp:include page="../login-componet/login.jsp" />
        </div>
    </div>
</div>

<%--Modal Signup--%>
<!-- The Modal -->
<div class="modal" id="myModalReg">
    <div class="modal-dialog">
        <div class="modal-content">
            <jsp:include page="../signup-component/signup.jsp" />
        </div>
    </div>
</div>

<%--Modal Signup--%>
<!-- The Modal -->
<div class="offcanvas offcanvas-top h-75" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
    <jsp:include page="../machine-map-component/machine-map.jsp" />
</div>

<%--Modal Signup--%>
<!-- The Modal -->
<div class="modal" id="myModalContact">
    <div class="modal-dialog">
        <div class="modal-content">
            <jsp:include page="../contact-component/contact.jsp" />
        </div>
    </div>
</div>

<%--Modal Signup--%>
<!-- The Modal -->
<div class="modal" id="myModalProduct">
    <div class="modal-dialog modal-xl">
        <div class="modal-content ">
            <jsp:include page="../product-component/product.jsp" />
        </div>
    </div>
</div>
