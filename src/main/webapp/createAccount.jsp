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
    <title>Create Account</title>
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body{
            display: flex;
            justify-content: center;
            align-items: center;
            /*min-height: 100vh;*/
            margin-top: 70px;
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
<nav class="bg-gray-800" style="width: 100%; position:fixed; top:0 ; z-index:1;">
    <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
        <div class="relative flex h-16 items-center justify-between">
            <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
                <!-- Mobile menu button-->
                <button type="button" class="relative inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
                    <span class="absolute -inset-0.5"></span>
                    <span class="sr-only">Open main menu</span>
                    <svg class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"></path>
                    </svg>
                    <svg class="hidden h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>
            <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">
                <div class="flex flex-shrink-0 items-center">
                    <img style="height: 55px; padding:0;" class="h-8 w-auto" src="img/logo.jpg" alt="Your Company">
                </div>
                <div class="hidden sm:ml-6 sm:block" >
                    <div class="flex space-x-4" style="margin-top: 8px;">
                        <a href="dashboardGuest.jsp" class="bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium" aria-current="page">Dashboard</a>
                        <a href="aboutWebsite.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">About</a>
                    </div>
                </div>
            </div>
            <button style="width: 13%; margin-top: 3px;" onclick="redirectLogin()" type="button" class="btn btn-secondary">+ Update new post</button>
        </div>
    </div>
</nav>

<div class="container">
    <form class="form">
        <h3 style="color: brown; text-align: center">Create Account</h3>
        <p>${error}</p>
        <div class="mb-3">
            <label for="username" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>UserName</b></label>
            <input type="text" class="form-control" id="username" name = "username">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"><b>Password</b></label>
            <input type="password" class="form-control" id="password" name = "password">
        </div>
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
        <div style="display: inline-block; display:flex; justify-content:center; align-items:center;">
            <button onclick = "redirectLogin()" style="margin-right: 20px; width: 150px" type="button" class="btn btn-secondary">Create Account</button>
            <button onclick = "redirectCreateAccount()" type="button" class="btn btn-success" style="width: 150px;">Cancel</button>
        </div>
    </form>
</div>
<script>
    function redirectLogin() {
        window.location.href = "login.jsp";
    }
</script>
<script>
    function redirectCreateAccount() {
        window.location.href = "createAccount.jsp";
    }
</script>
</body>
</html>
