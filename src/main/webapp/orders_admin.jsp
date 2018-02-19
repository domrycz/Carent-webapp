<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CaRent (admin) - Orders</title>
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
        .table-responsive {
            border: none;
        }
        table {
            font-size: 15px;
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
                <li><a href="cars_admin.jsp" title="cars">Cars</a></li>
                <li class="active"><a href="#" title="new_order">Orders</a></li>
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
                    <caption><h2>Add new Order</h2></caption>
                </table>
                <form action="OrderToDb" method="post" id="new_object_form">
                    <fieldset>
                        Customer id:<br>
                        <input type="number" name="customerId" maxlength="4" required><br>
                        Car id:<br>
                        <input type="number" name="carId" maxlength="3" required><br>
                        Start of rental:<br>
                        <input type="date" name="startDate" placeholder="yyyy-mm-dd" required><br>
                        End of rental:<br>
                        <input type="date" name="endDate" placeholder="yyyy-mm-dd" required><br>
                        <br>
                        <input class="button" type="submit" value="Add Order">
                        <br><br>
                    </fieldset>
                </form>
            </div>
            <div class="col-xs-12 col-sm-7 table-responsive">
                <table class="table">
                    <caption><h2>Orders</h2></caption>
                    <tr style="font-size: 18px">
                        <th style="width: 15%">id</th>
                        <th style="width: 25%">Customer</th>
                        <th style="width: 20%">Car id</th>
                        <th colspan="2">Options</th>
                    </tr>
                    <c:forEach var="orders" items="${sessionScope.ordersList}">
                        <tr style="height: 35px">
                            <td>${orders.getOrderIdZeroFill()}</td>
                            <td>${orders.getCustomer().getFirstname().charAt(0)}. ${orders.getCustomer().getLastname()}</td>
                            <td>${orders.getCar().getCarIdZeroFill()}</td>
                            <td><a href="ObjectInfo?orderId=${orders.getOrderId()}&admin=true"><button class="button" type="button" style="font-size: 12px">Details</button></a></td>
                            <td><a href="RemoveFromDb?orderId=${orders.getOrderId()}"><button class="button" type="button" style="font-size: 12px">Remove</button></a></td>
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
