<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>CaRent</title>
    <link  rel="stylesheet" href="https://fonts.googleapis.com/css?family=Orbitron">

    <style>
        body { background-color: #990000; }
        #buttons {
            margin: auto;
            width: 300px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);}
        button {
            background-color: #990000;
            width: 100%;
            border-radius: 8px;
            border: 1px solid #990000;
            font-family: 'Orbitron', sans-serif;
            font-size: 20px;
            font-weight: bold;
            color: black;
            padding-top: 7px;
            padding-bottom: 7px;
            text-shadow: 1px 1px 2px grey;
            -webkit-transition: background-color 2s;
            transition: background-color 2s;
        }
        button:hover {
            background-color: #cc0000;
            border: 1px inset #990000;
        }
    </style>
</head>
<body>
<div id="buttons">
    <img src="img/logo_final.jpg" alt="logo_final">
    <br><br>
    <a href="log_in_user.html"><button type="button">I'm a client</button></a>
    <br><br>
    <a href="log_in_admin.html"><button type="button">I'm an employee</button></a>
</div>
</body>
</html>