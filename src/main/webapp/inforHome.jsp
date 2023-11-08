<%@ page import="com.example.housemanage.controller.InforRoomServlet" %>
<%@ page import="com.example.housemanage.controller.DBConnection" %>
<%@ page import="com.example.housemanage.model.Room" %>
<%@ page import="com.example.housemanage.model.User" %>
<%
    int roomid = Integer.parseInt(request.getParameter("roomid"));
    InforRoomServlet inforRoomServlet = new InforRoomServlet();
    Room room = inforRoomServlet.roomInfor(roomid);
    User user = inforRoomServlet.userInfor(roomid);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Description</title>
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        form .bg-white shadow{
            position: fixed;
        }
        #local{
            padding-top: 10px;
            padding-bottom: 10px;
            margin-top: 20px;
            margin-bottom: 10px;
            margin-left: 10%;
            display: inline-block;
        }

        #area{
            padding-top: 10px;
            padding-bottom: 10px;
            margin-top: 20px;
            margin-bottom: 10px;
            margin-left: 3%;
            display: inline-block;
        }
        #price{
            padding-top: 10px;
            padding-bottom: 10px;
            margin-top: 20px;
            margin-bottom: 10px;
            margin-left: 3%;
            display: inline-block;
        }
        .inputsearch{
            padding-top: 10px;
            padding-bottom: 10px;
            margin-top: 20px;
            margin-bottom: 10px;
            margin-left: 3%;
            display: inline-block;
            padding-left:6px;
        }
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu mờ */
            display: none;
            z-index: 1;
        }
        .form-container {
            position: fixed;
            top: 50%;
            left: 50%;
            /*right: 20%;*/
            width: 40%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: none;
            z-index: 2;
        }
        .container2 {
            position: relative;
            width: 40%;
            margin-left: 30%;
            margin-right: 30%;;
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
                            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                            <a href="http://localhost:8080/HouseManage" class="bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium" aria-current="page">Dashboard</a>
                            <a href="aboutWebsite.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">About</a>
                        </div>
                    </div>
                </div>

                <button style="width: 13%; margin-top: 3px;" onclick="redirectLogin()" type="button" class="btn btn-secondary">Add new room</button>
            </div>
        </div>
    </nav>

    <form class="bg-white shadow" style="position: fixed; width:100%; top:60px; z-index: 1;" method="post" action="roomSearch.jsp">
        <select name="local" style="width: 15%;" id="local" class="block w-full px-4 py-2 text-base text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            <option selected>Address</option>
            <option value="NewYork">NewYork</option>
            <option value="Los Angeles">Los Angeles</option>
            <option value="Chicago">Chicago</option>
            <option value="San Francisco">San Francisco</option>
            <option value="Miami">Miami</option>
            <option value="Austin">Austin</option>
            <option value="Boston">Boston</option>
            <option value="Seattle">Seattle</option>
            <option value="New Ocean">New Ocean</option>
            <option value="Denver">Denver</option>
        </select>

        <select name="area" style="width: 15%;" id="area" class="block w-full px-4 py-2 text-base text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            <option selected>Area</option>
            <option>10-70</option>
            <option>70-200</option>
            <option>200-300</option>
            <option>400-600</option>
            <option>800-1000</option>
            <option>>1000</option>
        </select>

        <select name="price" style="width: 15%;" id="price" class="block w-full px-4 py-2 text-base text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            <option selected>Price</option>
            <option>100-250</option>
            <option>250-500</option>
            <option>500-700</option>
            <option>700-900</option>
            <option>900-1200</option>
            <option>>1200</option>
        </select>

        <input name="inputsearch" class="inputsearch border border-gray-300 rounded-lg bg-gray-50" type="search" style="width: 20%; ">
        <button style="display: inline-block; margin-left:3%; margin-top:-5px" type="submit" class="btn btn-secondary">Search</button>
    </form>

    <!-- description -->
    <div style="margin-top:150px;">
        <div class="px-4 sm:px-0">
            <p class="text-base font-semibold leading-7 text-gray-900" style="font-size: 20px; text-align:center">Detailed Information</p>
        </div>

        <!-- Slide img -->
        <div class="container2">
            <img src="getRoomImage?roomID=<%=roomid%>" style="width:100%">
        </div>

        <div class="container" style="position: relative;">
            <img src="./img/anhnguoi.webp" alt="" style="position: absolute; width:275px">
            <div class="mt-6 border-t border-gray-100" style="margin-left: 17%; width: 100%; background-color:aliceblue; border-radius: 25px; display:inline-block">
                <dl class="divide-y divide-gray-100">
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                        <dt class="text-sm font-medium leading-6 text-gray-900">Address</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0"><%=room.getAddress()%></dd>
                    </div>
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                        <dt class="text-sm font-medium leading-6 text-gray-900">Area</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0"><%=room.getArea()%> m2</dd>
                    </div>
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                        <dt class="text-sm font-medium leading-6 text-gray-900">Price</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0"><%=room.getPrice()%>$/month</dd>
                    </div>
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                        <dt class="text-sm font-medium leading-6 text-gray-900">Description</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0"><%=room.getDescription()%></dd>
                    </div>
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                        <dt class="text-sm font-medium leading-6 text-gray-900">Owner's Information</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                            <ul>
                                <li><dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0"><%=user.getUsername()%></dd></li>
                                <li><dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0"><%=user.getEmail()%></dd></li>
                                <li><dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0"><%=user.getNumber()%></dd></li>
                            </ul>
                        </dd>
                    </div>
                </dl>


                <div style="display: flex; justify-content:center; margin-bottom:15px;">
                    <button id="showFormLink" type="button" class="btn btn-warning">Leave a note</button>
                </div>
                <div class="overlay" id="overlay"></div>
                <div class="form-container" id="formContainer">
                    <form style="background-color: rgb(243, 239, 248); padding:20px; max-height:75vh; width:100%; overflow-y: auto;" method="post" action="${pageContext.request.contextPath}/inforHome?roomid=<%=roomid%>">
                        <div class="space-y-12">
                            <div class="border-b border-gray-900/10 pb-12">
                                <h2 class="text-base font-semibold leading-7 text-gray-900">Leave a note</h2>

                                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                                    <div class="sm:col-span-full">
                                        <label for="sendername" class="block text-sm font-medium leading-6 text-gray-900">Your Name</label>
                                        <div class="mt-2">
                                            <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                                <input required style="height: 30px; padding-left: 7px;" type="text" name="sendername" id="sendername" autocomplete="sendername" class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 focus:ring-0 sm:text-sm sm:leading-6">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="sm:col-span-full">
                                        <label for="sendernumber" class="block text-sm font-medium leading-6 text-gray-900">Your Number</label>
                                        <div class="mt-2">
                                            <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                                <input required style="height: 30px; padding-left: 7px;" type="number" name="sendernumber" id="sendernumber" autocomplete="sendernumber" class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 focus:ring-0 sm:text-sm sm:leading-6">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-span-full">
                                        <label for="sendernote" class="block text-sm font-medium leading-6 text-gray-900">Note</label>
                                        <div class="mt-2">
                                            <textarea style="padding-left: 7px;" id="sendernote" name="sendernote" rows="4" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"></textarea>
                                        </div>
                                        <p class="mt-3 text-sm leading-6 text-gray-600">Say something to the owner!</p>
                                    </div>
                                </div>
                                <button style="margin-top: 20px; margin-left:75%" type="submit" class="btn btn-secondary">Send</button>
                            </div>
                        </div>
                    </form>
                </div>

                <script>
                    document.getElementById('showFormLink').addEventListener('click', function (e) {
                        e.preventDefault();
                        document.getElementById('overlay').style.display = 'block';
                        document.getElementById('formContainer').style.display = 'block';
                    });

                    document.getElementById('overlay').addEventListener('click', function () {
                        document.getElementById('overlay').style.display = 'none';
                        document.getElementById('formContainer').style.display = 'none';
                    });

                </script>
            </div>
        </div>
    </div>
    <script src="ButtonAvatar.js"></script>
    <script type="text/javascript" async
            src="https://cdn.jsdelivr.net/npm/mathjax@2/es5/tex-chtml.js">
    </script>
    <script>
        function redirectLogin() {
            window.location.href = "/HouseManage/login";
        }
    </script>
</body>
</html>
