<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Carent - New order</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Orbitron">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <style>
        body { background-color: #b30000; }
        .navbar {
            background-color: #990000;
            font-family: 'Orbitron', sans-serif;
            height: 62px;
            border: none;
        }
        .navbar-brand img {
            height: 50px;
            width: auto;
            display: inline-block;
            position: absolute; top: 5px;
        }
        .navbar-nav li {
            padding-bottom: 5px;
        }
        .navbar-nav a {
            height: 62px;
            font-size: 17px;
        }
        .navbar-inverse .navbar-nav .active a {
            background-color: #990000;
        }
        .navbar-inverse .navbar-nav .active a:hover {
            background-color: #990000;
        }
        #main_section {
            font-family: 'Orbitron', sans-serif;
            height: auto;
            color: black;
        }
        #main_section h2 {
            font-family: 'Orbitron', sans-serif;
            color: white;
            text-shadow: 1px 1px 2px black;
            text-align: center;
            padding: 0;
        }
        form {
            text-align: center;
            text-shadow: 1px 1px 2px grey;
        }
        input, select {
            padding: 3px;
            margin: 6px 0;
        }
        .content {
            padding: 0 5%;
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
        th {
            padding: 3px;
            text-shadow: 1px 1px 2px grey;
        }
        td {
            color: white;
            padding: 3px;
            text-shadow: 2px 1px black;
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
            <div class="col-xs-12 col-sm-6 content">
                <h2>New Order</h2><br><br>
                <form action="NewOrder" method="post">
                    <fieldset>
                        Choose the car:<br><br>
                            <c:forEach var="car" items="${sessionScope.carList}">
                                <c:if test="${car.getAvailable()}">
                                    <input type="radio" name="car" value="${car.getCarId()}">${car.getCarIdZeroFill()} - ${car.getBrand()} ${car.getModel()}<br>
                                </c:if>
                            </c:forEach>
                        <br><br>
                        <p style="font-size: 18px;">Rental period:</p><br>
                        From:<br>
                        <input type="date" maxlength="10" placeholder="yyyy-mm-dd" name="start_date"><br><br>
                        To:<br>
                        <input type="date" maxlength="10" placeholder="yyyy-mm-dd" name="end_date"><br><br>
                        <input type="submit" value="Create" id="button">
                    </fieldset>
                </form>
            </div>
            <div class="col-xs-12 col-sm-6 content">
                <h2>Available cars</h2><br><br>
                <table>
                <c:forEach var="car" items="${sessionScope.carList}">
                    <c:if test="${car.getAvailable()}">
                <table>
                    <tr>
                        <th colspan="2" style="font-size: 20px; padding-bottom: 7px">${car.getBrand()} ${car.getModel()}</th>
                    </tr>
                    <tr>
                        <th width="170px">Segment: </th>
                        <td>${car.getSegment()}</td>
                    </tr>
                    <tr>
                        <th>Year: </th>
                        <td>${car.getYearProd()}</td>
                    </tr>
                    <tr>
                        <th>Engine: </th>
                        <td>${car.getEngine()}</td>
                    </tr>
                    <tr>
                        <th>Car number: </th>
                        <td>${car.getCarIdZeroFill()}</td>
                    </tr>
                </table>
                    <br><br>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>