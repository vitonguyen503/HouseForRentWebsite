<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/10/2023
  Time: 10:01 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Account Guest</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .form{
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            background-color: rgb(217, 227, 237);
            width: 45%;
            height: 65%;
        }
        .container{
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
<div class="container">
    <form class="form">
        <h3 style="color: brown; text-align: center">Create Account</h3>
        <p>${error}</p>
        <div class="mb-3">
            <label for="name" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>Name</b></label>
            <input type="text" class="form-control" id="name" name = "name">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>Email</b></label>
            <input type="email" class="form-control" id="email" name = "email">
        </div>
        <div class="mb-3">
            <label for="number" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>Number</b></label>
            <input type="number" class="form-control" id="number" name = "number">
        </div>
        <div class="mb-3">
            <label for="address" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>Address</b></label>
            <input type="text" class="form-control" id="address" name = "address">
        </div>
        <div class="mb-3">
            <label for="username" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>UserName</b></label>
            <input type="text" class="form-control" id="username" name = "username">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>Password</b></label>
            <input type="password" class="form-control" id="password" name = "password">
        </div>
        <div style="display: inline-block; display:flex; justify-content:center; align-items:center;">
            <button onclick = "redirectLoginGuest()" style="margin-right: 20px; width: 150px" type="button" class="btn btn-secondary">Create Account</button>
            <button onclick = "redirectCreateAccountGuest()" type="button" class="btn btn-success" style="width: 150px;">Cancel</button>
        </div>
    </form>
</div>
<script>
    function redirectLoginGuest() {
        window.location.href = "LoginGuest.jsp";
    }
</script>
<script>
    function redirectCreateAccountGuest() {
        window.location.href = "CreateAccountGuest.jsp";
    }
</script>
</body>
</html>
