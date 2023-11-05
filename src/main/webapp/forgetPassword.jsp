<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/10/2023
  Time: 10:00 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ResetPassword</title>
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
        <h3 style="color: brown; text-align: center">Reset Password</h3>
        <p>${error}</p>
        <div class="mb-3">
            <label for="username" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>Username</b></label>
            <input type="text" class="form-control" id="username" name = "username">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>Password</b></label>
            <input type="password" class="form-control" id="password" name = "password">
        </div>
        <div class="mb-3">
            <label for="newpassword" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>New Password</b></label>
            <input type="password" class="form-control" id="newpassword" name = "newpassword">
        </div>
        <div class="mb-3">
            <label for="confirmpassword" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>Confirm Password</b></label>
            <input type="password" class="form-control" id="confirmpassword">
        </div>
        <div style="display: inline-block; display:flex; justify-content:center; align-items:center;">
            <button onclick="redirectLogin()" style="margin-right: 20px; width: 100px" type="button" class="btn btn-secondary">OK</button>
            <button onclick="redirectResetPass()" type="button" class="btn btn-success" style="width: 100px;">Cancel</button>
        </div>

    </form>
</div>
<script>
    function redirectResetPass() {
        window.location.href = "forgetPassword.jsp";
    }
</script>
<script>
    function redirectLogin() {
        window.location.href = "/login";
    }
</script>
</body>
</html>
