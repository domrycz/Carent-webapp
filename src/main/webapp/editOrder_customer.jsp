<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CaRent - Edit order</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Orbitron">
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
        }
        #main_section h2 {
            color: white;
            text-align: center;
            text-shadow: 1px 1px 2px black;
        }
        #button {
            background-color: #b30000;
            width: 80px;
            border-radius: 8px;
            border: 1px #cc0000;
            font-family: 'Orbitron', sans-serif;
            font-size: 16px;
            font-weight: bold;
            color: black;
            padding-top: 7px;
            padding-bottom: 7px;
            text-shadow: 1px 1px 2px grey;
            -webkit-transition: background-color 2s;
            transition: background-color 2s;
        }
        #button:hover {
            background-color: #cc0000;
            border: 1px inset #cc0000;
        }
        .table-responsive {
            border: none;
        }
        td {
            color: white;
            text-shadow: 1px 1px black;
        }
        form {
            text-align: center;
        }
        p {
            color: black;
            font-weight: bold;
            text-shadow: 1px 1px grey;
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
            <ul class="nav navbar-nav">
                <l><a href="main_customer.jsp" title="user_profile">Your profile</a></l>
                <li><a href="cars_customer.jsp" title="cars">Cars</a></li>
                <li class="active"><a href="neworder_customer.jsp" title="new_order">New order</a></li>
                <li><a href="logout" title="logout">Log out</a></li>
            </ul>
        </div>
    </div>
</nav>
<section id="main_section">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-6 table-responsive" id="header_info">
                <h2>Order Info</h2><br>
                <table class="table">
                    <tr>
                        <th>Order id</th>
                        <td>${order.getOrderIdZeroFill()}</td>
                    </tr>
                    <tr>
                        <th>Car id</th>
                        <td>${order.getCar().getCarIdZeroFill()}</td>
                    </tr>
                    <tr>
                        <th>Car data</th>
                        <td>${order.getCar().getBrand()} ${order.getCar().getModel()}</td>
                    </tr>
                    <tr>
                        <th>Start of rent date</th>
                        <td>${order.getStartDate()}</td>
                    </tr>
                    <tr>
                        <th>End of rent date</th>
                        <td>${order.getEndDate()}</td>
                    </tr>
                </table>
                <br>
            </div>
            <div class="col-xs-12 col-sm-6">
                <h2>Enter new data</h2><br>
                <form action="EditOrder" method="post">
                    <fieldset>
                        <p style="font-size: 16px;">Order Id:</p><br>
                        <input type="text" name="orderId" value="${order.getOrderId()}" readonly><br><br>
                        <p style="font-size: 16px;">Choose the car:</p><br>
                        <c:forEach var="car" items="${sessionScope.carList}">
                            <c:if test="${car.getAvailable()}">
                                <input type="radio" name="carId" value="${car.getCarId()}">${car.getCarIdZeroFill()} - ${car.getBrand()} ${car.getModel()}<br>
                            </c:if>
                        </c:forEach>
                        <br>
                        <p style="font-size: 16px;">Rental period:</p><br>
                        From:<br>
                        <input type="date" name="start_date"><br><br>
                        To:<br>
                        <input type="date" name="end_date"><br><br>
                        <input type="submit" value="Change" id="button">
                    </fieldset>
                </form>
                <br>
            </div>
        </div>
    </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>