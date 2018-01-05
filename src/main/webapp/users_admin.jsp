<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CaRent (admin) - Users options</title>
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
        #new_object_form {
            width: 70%;
            text-align: center;
            margin-left: 15%;
            font-weight: bold;
        }
        .button {
            background-color: #b30000;
            border-radius: 8px;
            border: 1px solid #b30000;
            font-family: 'Orbitron', sans-serif;
            font-size: 18px;
            font-weight: bold;
            color: black;
            padding-top: 5px;
            padding-bottom: 5px;
            text-shadow: 1px 1px 2px grey;
            -webkit-transition: background-color 2s;
            transition: background-color 2s;
        }
        .button:hover {
            background-color: #cc0000;
            border: 1px inset #990000;
        }
        input {
            background-color: #ffcccc;
            margin: 5px 0;
        }
        .table-responsive {
            border: none;
        }
        table {
            width: 100%;
            font-size: 16px;
        }
        table, tr, td, th{
            border: 3px solid white;
            text-align: center;
        }
        th, td {
            padding: 3px 7px;
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
                <li><a href="main_admin.jsp" title="user_profile">Admin profile</a></li>
                <li class="active"><a href="#" title="users">Users</a></li>
                <li><a href="cars_admin.jsp" title="cars">Cars</a></li>
                <li><a href="orders_admin.jsp" title="new_order">Orders</a></li>
                <li><a href="logout" title="logout">Log out</a></li>
            </ul>
        </div>
    </div>
</nav>
<section id="main_section">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-6">
                <h2>New Customer</h2>
                <br><br>
                <form action="CustomerToDb" method="post" id="new_object_form">
                    <fieldset>
                        <legend>Add new Customer</legend>
                        First Name:<br>
                        <input type="text" name="firstname" maxlength="30" required><br>
                        Last Name:<br>
                        <input type="text" name="lastname" maxlength="40" required><br>
                        Release of driver license (yyyy-mm-dd):<br>
                        <input type="text" name="driverLicDate" maxlength="10" pattern="((19\d{2}|201\d|200\d)-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))" placeholder="yyyy-mm-dd" required><br>
                        ID number:<br>
                        <input type="text" name="idNumber" maxlength="20" required><br>
                        Password:<br>
                        <input type="password" name="password" maxlength="20" required><br>
                        Email:<br>
                        <input type="email" name="email" placeholder="example@example.com" maxlength="40" required><br>
                        <br>
                        <input class="button" type="submit" value="Add Customer">
                        <br>
                    </fieldset>
                </form>
                <br><br>
            </div>
            <div class="col-xs-12 col-sm-6">
                <h2>Customers</h2>
                <br><br><br>
                <div class="table-responsive">
                <table class="table">
                    <tr style="font-size: 18px">
                        <th style="width: 10%">id</th>
                        <th style="width: 20%">First Name</th>
                        <th style="width: 30%">Last Name</th>
                        <th colspan="2">Options</th>
                    </tr>
                    <c:forEach var="customer" items="${sessionScope.customerList}">
                        <tr style="height: 43px">
                            <td>${customer.getCustomerIdZeroFill()}</td>
                            <td>${customer.firstname}</td>
                            <td>${customer.lastname}</td>
                            <td><a href="ObjectInfo?customerId=${customer.getCustomerId()}"><button class="button" style="font-size: 12px">View details</button></a></td>
                            <td><a href="RemoveFromDb?customerId=${customer.getCustomerId()}"><button class="button" style="font-size: 12px">Remove</button></a></td>
                        </tr>
                    </c:forEach>
                </table>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
