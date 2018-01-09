<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Carent - Cars</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Orbitron">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Fredoka+One">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <style>
        body { background-color: #b30000; }
        .navbar {
            background-color: #990000;
            font-family: 'Orbitron', sans-serif;
            min-height: 62px;
            border: none;
        }
        .navbar-brand img {
            height: 50px;
            width: auto;
            display: inline-block;
            position: absolute; top: 5px;
        }
        .navbar-nav li {
            min-height: 62px;
            padding-bottom: 5px;
        }
        .navbar-nav a {
            min-height: 62px;
            font-size: 17px;
            z-index: 1;
        }
        .navbar-inverse .navbar-nav .active a {
            background-color: #990000;
        }
        .navbar-inverse .navbar-nav .active a:hover {
            background-color: #990000;
        }
        #main_section {
            font-family: 'Orbitron', sans-serif;
            color: black;
        }
        #main_section h1 {
            font-weight: bold;
            color: white;
            text-align: center;
        }
        .table-responsive {
            height: auto;
            padding: 15px;
            border: none;
        }
        .is_available {
            font-family: 'Fredoka One', cursive;
            color: black;
            text-shadow: 1px 1px #999999;
        }
        .not_available {
            font-family: 'Fredoka One', cursive;
            color: #999999;
            text-shadow: 1px 1px black;
        }
        .table th, .table td {
            padding: 5px;
        }
        td {
            color: white;
            text-shadow: 2px 1px black;
        }
        .car_name {
            float: left;
            margin-right: 25px;
            text-shadow: 1px 1px grey;
        }
        img {
            height: 80px;
            width: auto;
            float: left
        }
        .order_button {
            width: 100px;
            background-color: #b30000;
            border-radius: 8px;
            border: 1px #cc0000;
            font-family: 'Orbitron', sans-serif;
            font-size: 14px;
            font-weight: bold;
            color: black;
            padding-top: 7px;
            padding-bottom: 7px;
            text-shadow: 1px 1px 2px grey;
            -webkit-transition: background-color 2s;
            transition: background-color 2s;
        }
        .order_button:hover {
            background-color: #cc0000;
            border: 1px inset #cc0000;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#" id="navbar-brand"><img src="img/logo_final.jpg" class="img-rounded" alt="logo_menu" id="logo_menu"></a>
        </div>
        <div class="collapse navbar-collapse navbar-right" id="navbar-collapse-1">
            <p class="navbar-text">Hello ${sessionScope.activeUser.getFirstname()} </p>
            <ul class="nav navbar-nav">
                <li><a href="main_customer.jsp" title="user_profile">Your profile</a></li>
                <li class="active"><a href="cars_customer.jsp" title="cars">Cars</a></li>
                <li><a href="neworder_customer.jsp" title="new_order">New order</a></li>
                <li><a href="logout" title="logout">Log out</a></li>
            </ul>
        </div>
    </div>
</nav>
<section id="main_section">
    <div class="container-fluid">
        <c:forEach var="car" items="${sessionScope.carList}">
            <div class="col-xs-12 col-sm-6 table-responsive">
                <h3 class="car_name">${car.getBrand()} ${car.getModel()} </h3>
                <img src="img/${car.getModel()}.png" alt="car_photo">
                <table class="table">
                    <tr>
                        <th>Segment: </th>
                        <td>${car.getSegment()}</td>
                        <td rowspan="2" style="text-align: center; padding-top: 17px;">
                            <c:if test="${car.getAvailable()}">
                                <h4 class="is_available">AVAILABLE</h4>
                            </c:if>
                            <c:if test="${!car.getAvailable()}">
                                <h4 class="not_available">OCCUPIED</h4>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>Year: </th>
                        <td>${car.getYearProd()}</td>
                    </tr>
                    <tr>
                        <th>Engine: </th>
                        <td>${car.getEngine()}</td>
                        <td rowspan="2" style="text-align: center; padding-top: 20px;"><a href="neworder_customer.jsp"><button class="order_button" type="button">Order now!</button></a></td>
                    </tr>
                    <tr>
                        <th>Car number: </th>
                        <td>${car.getCarIdZeroFill()}</td>
                    </tr>
                </table>
            </div>
        </c:forEach>
    </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>