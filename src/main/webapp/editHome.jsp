<%@ page import="com.example.housemanage.controller.EditRoomServlet" %>
<%@ page import="com.example.housemanage.model.Room" %>
<%@ page import="com.example.housemanage.model.user" %>
<%@ page import="com.example.housemanage.model.reverse" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    int roomid = Integer.parseInt(request.getParameter("roomid"));
    EditRoomServlet editRoomServlet = new EditRoomServlet();
    Room room = editRoomServlet.roomInfor(roomid);
    List<reverse> reverses = editRoomServlet.TableReservation(roomid);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa bài đăng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .KhoiDuoi{
            position: relative;
            height: auto;
            margin-right: 20%;
            margin-left: 20%;
            margin-top: 80px;
        }
        #roomID{
            padding-left: 20px;
            height:30px;

        }
        #title{
            padding-left: 15px;
            height:60px;
            padding-top: 2px;
        }
        #streetaddress{
            padding-left: 15px;
            height:30px;
        }
        #city{
            height:30px;
            padding-left: 15px;
        }
        #area{
            padding-left: 15px;
            height:30px;
        }
        #price{
            padding-left: 15px;
            height:30px;
        }
        #description{
            padding-left: 15px;
            height: 200px;
            padding-top: 3px;
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
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: none;
            z-index: 2;
        }
        form{
            padding: 20px;
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
                        <a href="dashboardUser.jsp" class="bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium" aria-current="page">Dashboard</a>
                    </div>
                </div>
            </div>

            <button style="width: 7%; margin-top: 3px; margin-right:1%; "  onclick="redirectAdd()" type="button" class="btn btn-secondary">Add</button>
            <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
                <div style="margin-right: 1%; width:70px; height:30px" class="relative bg-gray-800 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
                    <p style="color: #fff;">Hi, User</p>
                </div>

                <!-- Profile dropdown -->
                <div class="relative ml-3">
                    <div>
                        <button  type="button" class="relative flex rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800" id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                            <span class="absolute -inset-1.5"></span>
                            <span class="sr-only">Open user menu</span>
                            <img class="h-8 w-8 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
                        </button>
                    </div>

                    <div id="myForm" class="absolute right-0 z-10 mt-2 w-48 origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1">
                        <!-- Active: "bg-gray-100", Not Active: "" -->
                        <a href="changeInforUser.jsp" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-0">Your Profile</a>
                        <a href="index.jsp" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-2">Sign out</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>

<div class="KhoiDuoi">
    <form style="background-color: rgb(243, 239, 248);" method="post" action="${pageContext.request.contextPath}/editroom">
        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <b><p style="color: #000; font-size:30px; text-align:center; padding-top: 20px; padding-bottom:10px;" class="text-base font-semibold leading-7 text-gray-900">Edit your post</p></b>

                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <div class="sm:col-span-4">
                        <label style="color: #000; font-size:15px;" for="roomID" class="block text-sm font-medium leading-6 text-gray-900">RoomID</label>
                        <div class="mt-2">
                            <input value="<%=room.getID()%>" type="text" name="roomID" id="roomID" autocomplete="roomID" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>

                    <div class="col-span-full">
                        <label style="color: #000; font-size:15px;" for="title" class="block text-sm font-medium leading-6 text-gray-900">Title</label>
                        <div class="mt-2">
                            <textarea id="title" name="title" rows="3" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"><%=room.getHeading()%></textarea>
                        </div>
                    </div>

                    <div class="col-span-full">
                        <label style="color: #000; font-size:15px;" for="streetaddress" class="block text-sm font-medium leading-6 text-gray-900">Street Address</label>
                        <div class="mt-2">
                            <input value="<%=room.getAddress()%>" type="text" name="streetaddress" id="streetaddress" autocomplete="streetaddress" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>

                    <div class="sm:col-span-3">
                        <label style="color: #000; font-size:15px;" for="city" class="block text-sm font-medium leading-6 text-gray-900">City</label>
                        <div class="mt-2">
                            <input value="<%=room.getCity()%>" type="text" name="city" id="city" autocomplete="city" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>

                    <div class="sm:col-span-2 sm:col-start-1">
                        <label style="color: #000; font-size:15px;" for="area" class="block text-sm font-medium leading-6 text-gray-900">Area</label>
                        <div class="mt-2">
                            <input value="<%=room.getArea()%>" type="number" step="0.01" inputmode="decimal" name="area" id="area" autocomplete="address-level2" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>

                    <div class="sm:col-span-2">
                        <label style="color: #000; font-size:15px;" for="price" class="block text-sm font-medium leading-6 text-gray-900">Price</label>
                        <div class="mt-2">
                            <input value="<%=room.getPrice()%>" type="number" name="price" id="price" autocomplete="address-level2" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>

                    <div class="col-span-full">
                        <label style="color: #000; font-size:15px;" for="description" class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                        <div class="mt-2">
                            <textarea id="description" name="description" rows="4" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"><%=room.getDescription()%></textarea>
                        </div>
                    </div>

                    <div class="col-span-full">
                        <label style="color: #000; font-size:15px;" class="block text-sm font-medium leading-6 text-gray-900">Photo</label>
                        <div class="mt-2 flex justify-center rounded-lg border border-dashed border-gray-900/25 px-6 py-10">
                            <div class="text-center">
                                <svg class="mx-auto h-12 w-12 text-gray-300" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M1.5 6a2.25 2.25 0 012.25-2.25h16.5A2.25 2.25 0 0122.5 6v12a2.25 2.25 0 01-2.25 2.25H3.75A2.25 2.25 0 011.5 18V6zM3 16.06V18c0 .414.336.75.75.75h16.5A.75.75 0 0021 18v-1.94l-2.69-2.689a1.5 1.5 0 00-2.12 0l-.88.879.97.97a.75.75 0 11-1.06 1.06l-5.16-5.159a1.5 1.5 0 00-2.12 0L3 16.061zm10.125-7.81a1.125 1.125 0 112.25 0 1.125 1.125 0 01-2.25 0z" clip-rule="evenodd"></path>
                                </svg>
                                <div class="mt-4 flex text-sm leading-6 text-gray-600">
                                    <label for="file-upload" class="relative cursor-pointer rounded-md bg-white font-semibold text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500">
                                        <span style="font-size:15px;">Upload a file</span>
                                        <input id="file-upload" name="file-upload" type="file" class="sr-only">
                                    </label>
                                    <p style="font-size:15px;" class="pl-1">or drag and drop</p>
                                </div>
                                <p style="color: #000; font-size:15px;" class="text-xs leading-5 text-gray-600">PNG, JPG, GIF up to 10MB</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <p><a href="#" id="showFormLink">Reservation: <%=reverses.size()%></a></p>
        <div class="overlay" id="overlay"></div>
        <div class="form-container" id="formContainer">
            <body>
            <form style="padding:20px; width:100%;">
                <b><h1 style="text-align: center; padding:10px;">INFORMATION GUEST</h1></b>
                <div class="container-table" style="max-height: 300px; overflow:auto;">
                    <table class="table table-hover table-bordered" style="background-color: rgb(243, 239, 248);">
                        <thead>
                            <tr>
                                <th style="width: 40px; text-align:center; height:50px">STT</th>
                                <th style="width: 150px; text-align:center">Sender Name</th>
                                <th style="width: 150px; text-align:center">Sender Number</th>
                                <th style="text-align:center">Sender Note</th>
                            </tr>
                        </thead>
                        <tbody >
                        <% int i = 1;
                            for(reverse reverse1 : reverses){ %>
                            <tr>
                                <th style="text-align: center;"><%=i%></th>
                                <td style="text-align: center;"><%=reverse1.getSenderName()%></td>
                                <td style="text-align: center;"><%=reverse1.getSenderNumber()%></td>
                                <td style="padding: 10px;"><%=reverse1.getSenderNote()%></td>
                            </tr>
                        <%i++; }%>
                        </tbody>
                    </table>
                </div>

            </form>
            </body>
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

        <div class="mt-6 flex items-center justify-end gap-x-6" style="margin-bottom: 10px;">
            <button onclick="redirectEditbaidang()" type="button" class="text-sm font-semibold leading-6 text-gray-900" style="color: #000; font-size:15px;">Cancel</button>
            <button type="submit" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Save</button>
        </div>
    </form>
</div>
<script src="ButtonAvatar.js"></script>
<script>
    function redirectAdd() {
        window.location.href = "addHome.jsp";
    }
</script>
<script>
    function redirectEditbaidang() {
        window.location.href = "";
    }
</script>
<script>
    function redirectTrangchuu() {
        window.location.href = "index.jsp";
    }
</script>
</body>
</html>
