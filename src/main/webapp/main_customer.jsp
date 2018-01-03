<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Carent - Your main page</title>
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
        .button {
            background-color: #b30000;
            border-radius: 8px;
            border: 1px solid #b30000;
            font-family: 'Orbitron', sans-serif;
            font-size: 14px;
            width: 100px;
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
        #main_section {
            font-family: 'Orbitron', sans-serif;
            color: black;
        }
        #main_section h1 {
            color: white;
            text-align: center;
            text-shadow: 1px 1px 2px black;
        }
        #profile_table {
            margin-left: 20px;
        }
        .order_table {
            border: 1px solid white;
        }
        td, th {
            padding: 7px 7px 7px 10px;
        }
        td {
            color: white;
            text-shadow: 2px 1px black;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#navbar_1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#" id="navbar-brand"><img src="img/logo_final.jpg" class="img-rounded" alt="logo_menu" id="logo_menu"></a>
        </div>
        <div class="collapse navbar-collapse navbar-right" id="navbar_1">
            <p class="navbar-text">Hello ${sessionScope.activeUser.getFirstname()} </p>
            <ul class="nav navbar-nav">
                <li class="active"><a href="main_customer.jsp" title="user_profile">Your profile</a></li>
                <li><a href="cars_customer.jsp" title="cars">Cars</a></li>
                <li><a href="neworder_customer.jsp" title="new_order">New order</a></li>
                <li><a href="logout" title="logout">Log out</a></li>
            </ul>
        </div>
    </div>
</nav>
<section id="main_section">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-6">
                <h1>Profile</h1>
                <br><br>
                <table id="profile_table">
                    <tr>
                        <th>Client number: </th>
                        <td>${sessionScope.customerId}</td>
                    </tr>
                    <tr>
                        <th>First name: </th>
                        <td>${sessionScope.activeUser.getFirstname()}</td>
                    </tr>
                    <tr>
                        <th>Last name: </th>
                        <td>${sessionScope.activeUser.getLastname()}</td>
                    </tr>
                    <tr>
                        <th>Driver licence release date: </th>
                        <td>${sessionScope.activeUser.getDriverLicDate()}</td>
                    </tr>
                    <tr>
                        <th>ID number: </th>
                        <td>${sessionScope.activeUser.getIdNumber()}</td>
                    </tr>
                    <tr>
                        <th>Email: </th>
                        <td>${sessionScope.activeUser.getEmail()}</td>
                    </tr>
                </table>
            </div>
            <div class="col-xs-12 col-sm-6">
                <h1>Orders</h1>
                <br>
                <div class="table-responsive">
                    <c:forEach var="orders" items="${sessionScope.customersOrders}">
                    <table class="order_table table">
                        <tr>
                            <th>Order no.: </th>
                            <td>${orders.getOrderIdZeroFill()}</td>
                            <th>From: </th>
                            <td>${orders.getStartDate()}</td>
                        </tr>
                        <tr>
                            <th>Car: </th>
                            <td>${orders.getCar().getBrand()} ${orders.getCar().getModel()}</td>
                            <th>To: </th>
                            <td>${orders.getEndDate()}</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center"><button type="button" class="button">Edit</button></td>
                            <td colspan="2" style="text-align: center"><a href="RemoveFromDb?userOrderId=${orders.getOrderId()}"><button type="button" class="button">Delete</button></a></td>
                        </tr>
                        <br><br>
                    </table>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
