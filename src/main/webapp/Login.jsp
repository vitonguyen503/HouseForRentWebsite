<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 06/10/2023
  Time: 9:57 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login for Nguoi dang bai</title>
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
            width: 55%;
            height: 53vh;
        }
        .container{
            margin-left: 30%;
        }
    </style>
</head>
<body>
    <div class="container">
        <form class="form">
            <h3 style="color: coral; text-align: center">Login Page</h3>
            <p>${error}</p>
            <div class="mb-3">
                <label for="username" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>UserName</b></label>
                <input type="text" class="form-control" id="username" name = "username">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>Password</b></label>
                <input type="password" class="form-control" id="password" name = "password">
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-label" id="checkform">
                <label class="form-check-label" for="checkform">Check me out</label>
                <a style="color:brown; margin-left: 40%" href="ResetAccount.jsp">ResetPassword</a>
            </div>
            <div>
                <button onclick = "redirectTrangchu()" style="margin-right: 30px; margin-left: 92px; width: 100px" type="button" class="btn btn-secondary">LogIn</button>
                <button onclick = "redirectCreateAccount()" type="button" class="btn btn-success" style="width: 100px;">SignUp</button>
            </div>
        </form>
    </div>
    <script>
        function redirectTrangchu() {
            window.location.href = "Trangchu.jsp";
        }
    </script>
    <script>
        function redirectCreateAccount() {
            window.location.href = "CreateAccount.jsp";
        }
    </script>
</body>
</html>
