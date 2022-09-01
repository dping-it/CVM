<%@ page import="it.dping.cloudvendingmachines.model.VendingMachine" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cloud Vending Machines</title>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="Vending Machines" name="keywords">
    <meta content="Snack" name="description">

    <!-- Favicon -->
    <link href="public/img/favicon.ico" rel="icon">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Oswald:wght@500;600;700&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">


    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="public/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="public/css/style.css">
    <link rel="stylesheet" href="public/css/machine.css">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%VendingMachine vendingMachine = (VendingMachine) request.getSession().getAttribute("machine");%>

<%--NODE OF SELECTION INTERFACE FOR CLIENT TYPE--%>
<%if(vendingMachine!=null){%>
    <jsp:include page="WEB-INF/view/refil-machine-component/refil-machine.jsp" />
<%} else {%>
    <jsp:include page="WEB-INF/view/not-found-component/not-found.jsp" />
<%}%>



</body>
<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="public/lib/easing/easing.min.js"></script>
<script src="public/lib/waypoints/waypoints.min.js"></script>
<script src="public/lib/counterup/counterup.min.js"></script>
<script src="public/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="public/js/main.js"></script>
</html>
