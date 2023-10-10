<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 07/10/2023
  Time: 9:50 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Add them phong tro</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
        <style>
            header{
                top:0;
                left: 0;
                right: 0;
                height: 50px;
                width: 100%;
                position:fixed;
                z-index:1;
                background-color:rgb(217, 217, 245);
                display:inline-block;
            }
            body{
                background-color: #b99c9c;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                margin-top: 49px;
                position: relative;
            }
            .KhoiTrai{
                background-color: rgb(217, 217, 245);
                position: fixed;
                height: 100vh;
                width: 12%;
            }
            .KhoiPhai{
                position: relative;
                height: auto;
                width: 70%;
                margin-left: 20%;
            }
        </style>
    </head>
    <body>
        <header>
            <div><img style="width:50px; height: 50px; display:inline-block" src="./img/Xanh dương nhạt và Trắng Hình vẽ một nét Đơn giản Phòng tập Biểu trưng Phòng tập.png" alt=""> <p style="display: inline-block; color:#b99c9c; margin-left:10px">Homelyyyyyyy</p></div>
        </header>
        <body>
            <div class="KhoiTrai">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <div class="card" style="width: 9.4rem; height:200px; background-color:rgb(68, 68, 81);">
                            <img style="width: 100%; height: 110px" src="./img/anh1.jpg" class="card-img-top" alt="...">
                            <div class="card-body" style="margin-left: -3px; background-color:rgb(217, 217, 245);">
                                <h6 style = "text-align:center; margin-top: -5px; color:#b99c9c;">Nguyen The Vu</h6>
                                <p style="font-size: 13px; margin-top:3px; color:#b99c9c;">0966344956</p>
                                <p style="font-size: 13px; margin-top:0; color:#b99c9c;">Ha Noi</p>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item" style="display: flex; justify-content:center">
                        <button style="width: 90%; margin-top: 50px; border:0;" onclick="redirectChangeInf()" type="button" class="btn btn-outline-secondary">ChangeInfor</button>
                    </li>
                    <li class="nav-item" style="display: flex; justify-content:center">
                        <button style="width: 90%; margin-top: 20px; border:0;" onclick="" type="button" class="btn btn-outline-secondary">Back</button>
                    </li>
                    <li class="nav-item" style="display: flex; justify-content:center">
                        <button style="width: 90%; margin-top: 20px; border:0;" onclick="redirectLogout()" type="button" class="btn btn-outline-secondary">Logout</button>
                    </li>
                </ul>
            </div>

            <div class="KhoiPhai">
                <div class="space-y-12">
                    <div class="border-b border-gray-900/10 pb-12">
                        <p style="color: #f3b4b4; font-size:30px; text-align:center; padding-top: 20px; padding-bottom:10px;" class="text-base font-semibold leading-7 text-gray-900">Thêm phòng trọ mới</p>

                        <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                            <div class="sm:col-span-4">
                                <label style="color: #fff; font-size:15px;" for="roomid" class="block text-sm font-medium leading-6 text-gray-900">RoomID (Auto increment)</label>
                                <div class="mt-2">
                                    <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                        <input type="text" name="roomid" id="roomid" autocomplete="roomid" class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" placeholder="ID">
                                    </div>
                                </div>
                            </div>

                            <div class="col-span-full">
                                <label style="color: #fff; font-size:15px;" for="title" class="block text-sm font-medium leading-6 text-gray-900">Title</label>
                                <div class="mt-2">
                                    <textarea id="title" name="title" rows="3" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"></textarea>
                                </div>
                                <!-- <p class="mt-3 text-sm leading-6 text-gray-600">Write a few sentences about yourself.</p> -->
                            </div>

                            <div class="col-span-full">
                                <label style="color: #fff; font-size:15px;" for="streetaddress" class="block text-sm font-medium leading-6 text-gray-900">Street Address</label>
                                <div class="mt-2">
                                    <input type="text" name="streetaddress" id="streetaddress" autocomplete="streetaddress" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                </div>
                            </div>

                            <div class="sm:col-span-3">
                                <label style="color: #fff; font-size:15px;" for="city" class="block text-sm font-medium leading-6 text-gray-900">City</label>
                                <div class="mt-2">
                                    <select id="city" name="city" autocomplete="city" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6">
                                        <option>Ha Noi</option>
                                        <option>Ho Chi Minh</option>
                                        <option>Da Nang</option>
                                        <option>Hai Phong</option>
                                        <option>Nam Dinh</option>
                                    </select>
                                </div>
                            </div>

                            <div class="sm:col-span-2 sm:col-start-1">
                                <label style="color: #fff; font-size:15px;" for="area" class="block text-sm font-medium leading-6 text-gray-900">Area</label>
                                <div class="mt-2">
                                    <input type="number" step="0.01" inputmode="decimal" name="area" id="area" autocomplete="address-level2" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                </div>
                            </div>

                            <div class="sm:col-span-2">
                                <label style="color: #fff; font-size:15px;" for="price" class="block text-sm font-medium leading-6 text-gray-900">Price</label>
                                <div class="mt-2">
                                    <input type="number" name="price" id="price" autocomplete="address-level2" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                </div>
                            </div>

                            <div class="col-span-full">
                                <label style="color: #fff; font-size:15px;" for="description" class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                                <div class="mt-2">
                                    <textarea id="description" name="description" rows="4" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"></textarea>
                                </div>
                                <p class="mt-3 text-sm leading-6 text-gray-600">Write a few sentences about phong tro.</p>
                            </div>

                            <div class="col-span-full">
                                <label style="color: #fff; font-size:15px;" class="block text-sm font-medium leading-6 text-gray-900">Photo</label>
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
                                        <p style="color: #fff; font-size:15px;" class="text-xs leading-5 text-gray-600">PNG, JPG, GIF up to 10MB</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <fieldset>
                            <p style="font-size: 15px;" class="mt-1 text-sm leading-6 text-gray-600">Trạng thái: </p>
                            <div class="mt-6 space-y-6">
                                <div class="flex items-center gap-x-3">
                                    <input name="push-notifications" type="radio" class="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-600">
                                    <label style="color: #fff; font-size:15px;" for="" class="block text-sm font-medium leading-6 text-gray-900">Còn trống</label>
                                </div>
                                <div class="flex items-center gap-x-3">
                                    <input name="push-notifications" type="radio" class="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-600">
                                    <label style="color: #fff; font-size:15px;" for="" class="block text-sm font-medium leading-6 text-gray-900">Đã cho thuê</label>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                    <div>
                        <fieldset>
                            <p style="font-size: 15px;" class="mt-1 text-sm leading-6 text-gray-600">All information has been filled in completely.</p>
                            <div class="mt-6 space-y-6">
                                <div class="flex items-center gap-x-3">
                                    <input name="push-notifications" type="radio" class="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-600">
                                    <label style="color: #fff; font-size:15px;" for="" class="block text-sm font-medium leading-6 text-gray-900">Confirm</label>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                    <div class="mt-6 flex items-center justify-end gap-x-6">
                        <button onclick="redirectDangbaimoi()" type="button" class="text-sm font-semibold leading-6 text-gray-900" style="color: #fff; font-size:15px;">Cancel</button>
                        <button onclick="redirectTrangchu()" type="submit" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Save</button>
                    </div>
                </div>
            </div>
        </body>
        <script>
            function redirectChangeInf() {
                window.location.href = "Trangchu.jsp";
            }
        </script>
        <script>
            function redirectLogout() {
                window.location.href = "index.jsp";
            }
        </script>
        <script>
            function redirectTrangchu() {
                window.location.href = "Trangchu.jsp";
            }
        </script>
        <script>
            function redirectDangbaimoi() {
                window.location.href = "TrangchuDangbaimoi.jsp";
            }
        </script>
    </body>
</html>
