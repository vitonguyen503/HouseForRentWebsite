<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang chu guest</title>
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        header .bg-white shadow{
            position: fixed;
        }
        #local{
            padding-top: 10px;
            padding-bottom: 10px;
            margin-top: 20px;
            margin-bottom: 10px;
            margin-left: 20%;
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
                            <a href="TrangchuGuest.jsp" class="bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium" aria-current="page">Dashboard</a>
                            <a href="TrangAboutWeb.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">About</a>
                        </div>
                    </div>
                </div>

                <button style="width: 7%; margin-top: 3px;" onclick="redirectLoginGuest()" type="button" class="btn btn-secondary">Sign in</button>
                <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
                    <button style="margin-right: 1%;" type="button" class="relative rounded-full bg-gray-800 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
                        <span class="absolute -inset-1.5"></span>
                        <span class="sr-only">View notifications</span>
                        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0"></path>
                        </svg>
                    </button>

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
                            <a href="TrangchuChangeInf.jsp" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-0">Your Profile</a>
                            <a href="index.jsp" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-2">Sign out</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <header class="bg-white shadow" style="position: fixed; width:100%; top:60px">
        <!-- <label for="large" class="block mb-2 text-base font-medium text-gray-900 dark:text-white">Large select</label> -->
        <select style="width: 15%;" id="local" class="block w-full px-4 py-2 text-base text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            <option selected>Local</option>
            <option value="HaNoi">Hà Nội</option>
            <option value="TP.HCM">TP.Hồ Chí Minh</option>
            <option value="DaNang">Đà Nẵng</option>
            <option value="CanTho">Cần Thơ</option>
            <option value="HaiPhong">Hải Phòng</option>
            <option value="KhanhHoa">Khánh Hòa</option>
        </select>

        <select style="width: 15%;" id="area" class="block w-full px-4 py-2 text-base text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            <option selected>Area</option>
            <option>10-15m&sup2</option>
            <option>15-20m&sup2</option>
            <option>20-25m&sup2</option>
            <option>25-30m&sup2</option>
            <option>30-35m&sup2</option>
            <option>>35m&sup2</option>
        </select>

        <select style="width: 15%;" id="price" class="block w-full px-4 py-2 text-base text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            <option selected>Prices</option>
            <option>1-2tr</option>
            <option>2-2.5tr</option>
            <option>2.5-3tr</option>
            <option>3-5tr</option>
            <option> >5tr </option>
            <option> >10tr </option>
        </select>

        <button style="display: inline-block; margin-left:3%; margin-top:-5px" type="button" class="btn btn-secondary">Search</button>
    </header>

    <main style="margin-left: 7%; margin-right:7%;">
        <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8" style="margin-top: 150px;">
            <!-- Your content -->
            <div class="row">
                <div class="col-md-3">
                    <!-- Nửa đầu của dòng 1 -->
                    <div class="card">
                        <a href="TrangHienthithongtinphongtro.jsp"><img style="max-width: 100%;" src="img/anh2.jpg" alt=""></a>
                    </div>
                </div>
                <div class="col-md-9">
                    <!-- Nửa sau của dòng 1 -->
                    <div class="card" style="border: 0;">
                        <b><a style="text-decoration: none; color:black;" href="#">Title</a></b>
                        <div>
                            <p style="color: brown; display:inline-block;"><b>Prices</b></p>
                            <p style="display: inline-block; margin-left: 4%;">Area</p>
                            <p style="display: inline-block; margin-left: 4%;">Local</p>
                            <p style="display: inline-block; margin-left: 30%;">Ngay dang bai</p>
                        </div>
                        <p style="color: rgb(122, 121, 120); font-size: 12px;">Decription</p>
                        <img style="display: inline-block;" src="" alt=""> <p style="display: inline-block;">Name</p>
                    </div>
                </div>
            </div>

            <div style="height: 12px;"></div>
            <hr>
            <div style="height: 12px;"></div>
        </div>
    </main>

    <!-- Cac trang tiep theo -->
    <div class="flex items-center justify-between border-t border-gray-200 bg-white px-4 py-3 sm:px-6" style="margin-bottom:0;">
        <div class="flex flex-1 justify-between sm:hidden">
            <a href="#" class="relative inline-flex items-center rounded-md border border-gray-300 bg-white px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50">Previous</a>
            <a href="#" class="relative ml-3 inline-flex items-center rounded-md border border-gray-300 bg-white px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50">Next</a>
        </div>
        <div class="hidden sm:flex sm:flex-1 sm:items-center sm:justify-between" style="display: flex; justify-content:center">

            <div>
                <nav class="isolate inline-flex -space-x-px rounded-md shadow-sm" aria-label="Pagination">
                    <a href="#" class="relative inline-flex items-center rounded-l-md px-2 py-2 text-gray-400 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">
                        <span class="sr-only">Previous</span>
                        <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                            <path fill-rule="evenodd" d="M12.79 5.23a.75.75 0 01-.02 1.06L8.832 10l3.938 3.71a.75.75 0 11-1.04 1.08l-4.5-4.25a.75.75 0 010-1.08l4.5-4.25a.75.75 0 011.06.02z" clip-rule="evenodd"></path>
                        </svg>
                    </a>
                    <a href="#" aria-current="page" class="relative z-10 inline-flex items-center bg-indigo-600 px-4 py-2 text-sm font-semibold text-white focus:z-20 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">1</a>
                    <a href="#" class="relative inline-flex items-center px-4 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">2</a>
                    <a href="#" class="relative hidden items-center px-4 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0 md:inline-flex">3</a>
                    <span class="relative inline-flex items-center px-4 py-2 text-sm font-semibold text-gray-700 ring-1 ring-inset ring-gray-300 focus:outline-offset-0">...</span>
                    <a href="#" class="relative hidden items-center px-4 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0 md:inline-flex">8</a>
                    <a href="#" class="relative inline-flex items-center px-4 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">9</a>
                    <a href="#" class="relative inline-flex items-center px-4 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">10</a>
                    <a href="#" class="relative inline-flex items-center rounded-r-md px-2 py-2 text-gray-400 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">
                        <span class="sr-only">Next</span>
                        <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                            <path fill-rule="evenodd" d="M7.21 14.77a.75.75 0 01.02-1.06L11.168 10 7.23 6.29a.75.75 0 111.04-1.08l4.5 4.25a.75.75 0 010 1.08l-4.5 4.25a.75.75 0 01-1.06-.02z" clip-rule="evenodd"></path>
                        </svg>
                    </a>
                </nav>
            </div>
        </div>
    </div>
    <script src="ButtonAvatar.js"></script>
    <script>
        function redirectLoginGuest() {
            window.location.href = "LoginGuest.jsp";
        }
    </script>
</body>
</html>
