<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CaRent - Admin main page</title>
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
        }
        #main_section h2 {
            color: white;
            text-align: center;
            text-shadow: 1px 1px 2px black;
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
        #new_object_form {
            width: 70%;
            text-align: center;
            margin-left: 15%;
            font-weight: bold;
        }
        input {
            background-color: #ffcccc;
            margin: 5px 0;
        }
        table {
            width: 90%;
            font-size: 16px;
        }
        table, tr, td, th{
            border: 3px solid white;
            text-align: center;
        }
        th, td {
            padding: 3px 7px;
        }
        td {
            font-size: 14px;
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
            </button>
            <a class="navbar-brand" href="#" id="navbar-brand"><img src="img/logo_final.jpg" class="img-rounded" alt="logo_menu" id="logo_menu"></a>
        </div>
        <div class="collapse navbar-collapse navbar-right" id="navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="main_admin.jsp" title="user_profile">Admin profile</a></li>
                <li><a href="users_admin.jsp" title="users">Users</a></li>
                <li class="active"><a href="#" title="cars">Cars</a></li>
                <li><a href="orders_admin.jsp" title="new_order">Orders</a></li>
                <li><a href="logout" title="logout">Log out</a></li>
            </ul>
        </div>
    </div>
</nav>
<section id="main_section">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-5">
                <table style="width: 100%">
                    <caption><h2>Add new Car</h2></caption>
                </table>
                <form action="CarToDb" method="post" id="new_object_form">
                    <fieldset>
                        Brand:<br>
                        <input type="text" name="brand" maxlength="20" required><br>
                        Model:<br>
                        <input type="text" name="model" maxlength="20" required><br>
                        Production Year:<br>
                        <input type="number" name="yearProd" placeholder="YYYY" min="2000" max="2018" required><br>
                        Engine:<br>
                        <input type="text" name="engine" placeholder="1.0 PB 50KM" maxlength="20" required><br>
                        Segment:<br>
                        <input type="text" name="segment" placeholder="A" maxlength="1" required><br>
                        <br>
                        <input class="button" type="submit" value="Add Car">
                        <br>
                    </fieldset>
                </form>
            </div>
            <div class="col-xs-12 col-sm-7">
                <table>
                    <caption><h2>Cars</h2></caption>
                    <tr style="font-size: 18px">
                        <th style="width: 8%">id</th>
                        <th style="width: 18%">Brand</th>
                        <th style="width: 18%">Model</th>
                        <th style="width: 23%">Engine</th>
                        <th colspan="2">Options</th>
                    </tr>
                    <tr style="height: 45px">
                        <td>045</td>
                        <td>Test</td>
                        <td>Test</td>
                        <td>Test Test</td>
                        <td><button type="button" class="button" style="font-size: 12px">Details</button></td>
                        <td><button type="button" class="button" style="font-size: 12px">Remove</button></td>
                    </tr>
                    <c:forEach var="car" items="${sessionScope.carList}">
                    <tr style="height: 45px">
                        <!-- if's are used to put 0's before number -->
                        <td><c:if test="${car.carId < 10}">00${car.carId}</c:if>
                            <c:if test="${car.carId > 9 && car.carId < 100}">0${car.carId}</c:if></td>
                        <td>${car.brand}</td>
                        <td>${car.model}</td>
                        <td>${car.engine}</td>
                        <td><button class="button" style="font-size: 12px">Details</button></td>
                        <td><button class="button" style="font-size: 12px">Remove</button></td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>