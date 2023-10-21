<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new post</title>
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
        #userID{
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
        <form style="background-color: rgb(243, 239, 248);" method="post" enctype="multipart/form-data" action=${pageContext.request.contextPath}/home/add?id=${userID}>
            <div class="space-y-12">
                <div class="border-b border-gray-900/10 pb-12">
                    <b><p style="color: #000; font-size:30px; text-align:center; padding-top: 20px; padding-bottom:10px;" class="text-base font-semibold leading-7 text-gray-900">Add new room</p></b>
                    <p style="color: brown; text-align: center;">${error}</p>
                    <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                        <div class="col-span-full">
                            <label style="color: #000; font-size:15px;" for="title" class="block text-sm font-medium leading-6 text-gray-900">Title</label>
                            <div class="mt-2">
                                <input required id="title" name="title" rows="1" type="text" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>

                        <div class="col-span-full">
                            <label style="color: #000; font-size:15px;" for="streetaddress" class="block text-sm font-medium leading-6 text-gray-900">Address</label>
                            <div class="mt-2">
                                <input required type="text" name="streetaddress" id="streetaddress" autocomplete="streetaddress" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>

                        <div class="sm:col-span-3">
                            <label style="color: #000; font-size:15px;" for="city" class="block text-sm font-medium leading-6 text-gray-900">City</label>
                            <div class="mt-2">
                                <select id="city" name="city" autocomplete="city" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6">
                                    <option selected></option>
                                    <option value="New York">NewYork</option>
                                    <option value="Los Angeles">Los Angeles</option>
                                    <option value="Chicago">Chicago</option>
                                    <option value="San Francisco">San Francisco</option>
                                    <option value="Miami">Miami</option>
                                    <option value="Austin">Austin</option>
                                    <option value="Boston">Boston</option>
                                    <option value="Seattle">Seattle</option>
                                    <option value="New Orleans">New Orleans</option>
                                    <option value="Denver">Denver</option>
                                </select>
                            </div>
                        </div>

                        <div class="sm:col-span-2 sm:col-start-1">
                            <label style="color: #000; font-size:15px;" for="area" class="block text-sm font-medium leading-6 text-gray-900">Area</label>
                            <div class="mt-2">
                                <input required type="number" step="0.01" inputmode="decimal" name="area" id="area" autocomplete="address-level2" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>

                        <div class="sm:col-span-2">
                            <label style="color: #000; font-size:15px;" for="price" class="block text-sm font-medium leading-6 text-gray-900">Price</label>
                            <div class="mt-2">
                                <input required type="number" name="price" id="price" autocomplete="address-level2" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>

                        <div class="col-span-full">
                            <label style="color: #000; font-size:15px;" for="description" class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                            <div class="mt-2">
                                <textarea id="description" name="description" rows="4" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"></textarea>
                            </div>
                            <p class="mt-3 text-sm leading-6 text-gray-600">Write a few sentences about your room.</p>
                        </div>

                        <div class="col-span-full">
                            <label style="color: #000; font-size:15px;" class="block text-sm font-medium leading-6 text-gray-900">Photo</label>
                            Select File: <input type="file" name="file" id="file"><br>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-6 flex items-center justify-end gap-x-6" style="margin-bottom: 10px;">
                <button onclick="redirectDashboardUser()" type="button" class="text-sm font-semibold leading-6 text-gray-900" style="color: #000; font-size:15px;">Cancel</button>
                <button type="submit" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Save</button>
            </div>
        </form>
    </div>
    <script src="ButtonAvatar.js"></script>
    <script>
        function redirectDashboardUser() {
            window.location.href = "http://localhost:8080/HouseManage/home?username=${username}";
        }
    </script>
    <script>
        function redirectTrangchuu() {
            window.location.href = "index.jsp";
        }
    </script>
</body>
</html>
