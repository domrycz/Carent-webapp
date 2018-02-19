<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CaRent (admin) - Car Info</title>
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
        .table-responsive {
            border: none;
        }
        .button {
            background-color: #b30000;
            border-radius: 8px;
            border: 1px solid #b30000;
            font-family: 'Orbitron', sans-serif;
            font-size: 18px;
            font-weight: bold;
            color: black;
            padding-top: 2px;
            padding-bottom: 2px;
            text-shadow: 1px 1px 2px grey;
            -webkit-transition: background-color 2s;
            transition: background-color 2s;
        }
        .button:hover {
            background-color: #cc0000;
            border: 1px inset #990000;
        }
        td {
            color: white;
            text-shadow: 1px 1px black;
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
                <li><a href="#" title="user_profile">Admin profile</a></li>
                <li><a href="users_admin.jsp" title="users">Users</a></li>
                <li class="active"><a href="cars_admin.jsp" title="cars">Cars</a></li>
                <li><a href="orders_admin.jsp" title="new_order">Orders</a></li>
                <li><a href="logout" title="logout">Log out</a></li>
            </ul>
        </div>
    </div>
</nav>
<section id="main_section">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-6 table-responsive" id="header_info">
                <h2>Car Info</h2><br>
                <table class="table">
                    <tr>
                        <th>Car id</th>
                        <td>${car.getCarIdZeroFill()}</td>
                    </tr>
                    <tr>
                        <th>Brand</th>
                        <td>${car.getBrand()}</td>
                    </tr>
                    <tr>
                        <th>Model</th>
                        <td>${car.getModel()}</td>
                    </tr>
                    <tr>
                        <th>Production year</th>
                        <td>${car.getYearProd()}</td>
                    </tr>
                    <tr>
                        <th>Engine</th>
                        <td>${car.getEngine()}</td>
                    </tr>
                    <tr>
                        <th>Segment</th>
                        <td>${car.getSegment()}</td>
                    </tr>
                    <tr>
                        <th>Availability</th>
                        <td>${car.getAvailable()}</td>
                    </tr>
                </table>
                <br>
                <a href="RemoveFromDb?carId=${car.getCarId()}"><button type="button" class="button">Remove car</button></a>
            </div>
            <div class="col-xs-12 col-sm-6">
                <h2>Notes</h2><br>
                <p>You can't delete a car if it is included in orders!</p>
                <br>
                <!-- <p>Try not to change car's data when it is included in orders!</p> -->
            </div>
        </div>
    </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>