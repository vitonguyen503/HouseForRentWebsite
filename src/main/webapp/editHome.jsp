<%@ page import="com.example.housemanage.controller.EditRoomServlet" %>
<%@ page import="com.example.housemanage.model.Room" %>
<%@ page import="com.example.housemanage.model.reverse" %>
<%@ page import="java.util.List" %>
<%
    int roomid = Integer.parseInt(request.getAttribute("roomID").toString());
    EditRoomServlet editRoomServlet = new EditRoomServlet();
    Room room = editRoomServlet.getRoomData(roomid);
    List<reverse> reverses = editRoomServlet.TableReservation(roomid);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit room information</title>
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
        </div>
    </div>
</nav>

<div class="KhoiDuoi">
    <form style="background-color: rgb(243, 239, 248);" method="post" enctype="multipart/form-data" action=${pageContext.request.contextPath}/home/edit?username=${username}&roomid=<%=roomid%>>
        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <b><p style="color: #000; font-size:30px; text-align:center; padding-top: 20px; padding-bottom:10px;" class="text-base font-semibold leading-7 text-gray-900">Edit your post</p></b>

                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <div class="col-span-full">
                        <label style="color: #000; font-size:15px;" for="title" class="block text-sm font-medium leading-6 text-gray-900">Title</label>
                        <div class="mt-2">
                            <input id="title" name="title" rows="1" type="text" value="<%=room.getHeading()%>" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>

                    <div class="col-span-full">
                        <label style="color: #000; font-size:15px;" for="streetaddress" class="block text-sm font-medium leading-6 text-gray-900">Address</label>
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
                        Select File: <input type="file" name="file" id="file"><br>
                    </div>
                </div>
                <div class="mt-6 flex items-center justify-end gap-x-6" style="margin-bottom: 10px;">
                    <button onclick="redirectDashboardUser()" type="button" class="text-sm font-semibold leading-6 text-gray-900" style="color: #000; font-size:15px;">Cancel</button>
                    <button type="submit" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Save</button>
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
                        <% i++; }%>
                        </tbody>
                    </table>
                </div>
            </form>
            </body>
        </div>
    </form>
</div>
<script src="ButtonAvatar.js"></script>
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

    function redirectDashboardUser() {
        window.location.href = "http://localhost:8080/HouseManage/home?username=${username}";
    }
</script>
</body>
</html>
