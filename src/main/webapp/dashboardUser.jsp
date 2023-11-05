<%@ page import="com.example.housemanage.model.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.housemanage.controller.UserHomepage" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home page</title>
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        .container{
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin-top: 18px;
            position: relative;
        }
        .KhoiDuoi{
            position: relative;
            height: auto;
            width: 82%;
            margin-left: 10%;
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
<%--                <div class="hidden sm:ml-6 sm:block" >--%>
<%--                    <div class="flex space-x-4" style="margin-top: 8px;">--%>
<%--                        <a href="dashboardUser.jsp" class="bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium" aria-current="page">Dashboard</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>

            <button style="width: 10%; margin-top: 3px; margin-right:1%;" onclick=addButton() id="addButton" class="btn btn-secondary">Add new post</button>
            <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
                <div style="margin-right: 1%; width:100px; height:30px" class="relative bg-gray-800 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
                    <p style="color: #fff;">Hi, ${user}</p>
                </div>

                <!-- Profile dropdown -->
                <div class="relative ml-3">
                    <div>
                        <button type="button" class="relative flex rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800" id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                            <span class="absolute -inset-1.5"></span>
                            <span class="sr-only">Open user menu</span>
                            <img class="h-8 w-8 rounded-full" src="avatar?username=${user}" alt="">
                        </button>
                    </div>

                    <div id="myForm" class="absolute right-0 z-10 mt-2 w-48 origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1">
                        <!-- Active: "bg-gray-100", Not Active: "" -->
                        <a href="${pageContext.request.contextPath}/home/changeInfo?username=${encodedUser}" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-0">Your Profile</a>
                        <a href="${pageContext.request.contextPath}/" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-2">Sign out</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
<div>
    <b><h3 style="color: #000000; text-align:center; padding:15px; margin-top: 80px;">All your posts</h3></b>
</div>
<div style="margin-top:10px; margin-left:10%;">
    <p style="color: #000;">Total posts: ${count}</p>
<%--    <p style="color: #000; padding-bottom:10px;">${error}</p>--%>
</div>

<main style="margin-left: 7%; margin-right:29%;">
    <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8" style="margin-top: 20px;">
        <!-- Your content -->
        <% List<Room> list_of_rooms = (List<Room>) request.getAttribute("list_of_room");%>
        <% for (Room room : list_of_rooms) { %>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <a href="/HouseManage/home/edit?username=${encodedUser}&roomid=<%=Base64.getEncoder().encodeToString(String.valueOf(room.getID()).getBytes())%>">
                        <img style="max-width: 100%;" src="getRoomImage?roomID=<%=room.getID()%>" alt="Room Image"></a>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card" style="border: 0;">
                    <b>
                        <a style="text-decoration: none; color:black;" href="/HouseManage/home/edit?username=${encodedUser}&roomid=<%=Base64.getEncoder().encodeToString(String.valueOf(room.getID()).getBytes())%>"><%= room.getHeading() %></a>
                    </b>
                    <div>
                        <p style="color: brown; display:inline-block;"><b><%= room.getPrice() %>$/month</b></p>
                        <p style="display: inline-block; margin-left: 4%;"><%= room.getArea() %>m2</p>
                        <p style="display: inline-block; margin-left: 4%;"><%= room.getAddress() %></p>
                    </div>
                    <p style="color: rgb(122, 121, 120); font-size: 12px;"><%= room.getDescription() %></p>

                </div>

            </div>
<%--            <div class="col-md-1">--%>
<%--                <a href="/HouseManage/home/edit?username=${encodedUser}&roomid=<%=Base64.getEncoder().encodeToString(String.valueOf(room.getID()).getBytes())%>">--%>
<%--                    <button type="submit" class="btn btn-primary" id="edit-button">Edit</button>--%>
<%--                </a>--%>
<%--            </div>--%>
            <div class="col-md-1">
                <a href="/HouseManage/home/delete?username=${encodedUser}&roomid=<%=Base64.getEncoder().encodeToString(String.valueOf(room.getID()).getBytes())%>">
                    <button type="submit" class="btn btn-danger" id="close-button"> X </button>
                </a>
            </div>
        </div>
        <div style="height: 12px;"></div>
        <hr>
        <div style="height: 12px;"></div>

        <% } %>
    </div>
</main>
<div style="height: 12px;"></div>
<hr color="#fff">
<div style="height: 12px;"></div>

<script src="ButtonAvatar.js"></script>

<script>
    function addButton() {
        window.location.href = "${pageContext.request.contextPath}/home/add?username=${encodedUser}&id=${userID}";
    }
</script>

</body>
</html>