<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
            width: 82%;
            margin-left: 15%;
        }
    </style>
</head>
<body>
    <header>
        <div><img style="width:50px; height: 50px" src="./img/Xanh dương nhạt và Trắng Hình vẽ một nét Đơn giản Phòng tập Biểu trưng Phòng tập.png" alt=""> <p style="display: inline-block; color:#b99c9c; margin-left:10px">Homelyyyyyyy</p></div>
    </header>
    <body>
        <div class="KhoiTrai">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <div class="card" style="width: 9.5rem; height:200px; background-color:rgb(217, 217, 245);">
                        <img style="width: 100%; height: 110px" src="./img/anh1.jpg" class="card-img-top" alt="...">
                        <div class="card-body" style="margin-left: -3px;">
                            <h6 style = "text-align:center; margin-top: -5px; color:#b99c9c;">Nguyen The Vu</h6>
                            <p style="font-size: 13px; margin-top: -5px; color:#b99c9c;">0966344956</p>
                            <p style="font-size: 13px; margin-top: -17px; color:#b99c9c;">Ha Noi</p>
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
            <div class="form">
                <div>
                    <h3 style="color: #fff; text-align:center; padding:15px; display:inline-block">Các bài đã đăng gần đây</h3>
                    <button style="display: inline-block; margin-left:45%; margin-right:1%" onclick="redirectAdd()" type="button" class="btn btn-secondary">Add</button>
                    <button style="display: inline-block; margin-right:1%;" onclick="redirectEdit()" type="button" class="btn btn-danger">Edit</button>
                    <button style="display: inline-block;" onclick="redirectTrangchu()" type="button" class="btn btn-warning">Delete</button>
                </div>

                <p style="color: #fff;">Tổng số bài đăng: ${count}</p>
                <p style="color: #fff; padding-bottom:10px;">${error}</p>

                <div class="row" style="border: 1px solid #fff; padding: 6px;">
                    <div class="col-md-3">
                        <!-- Nửa đầu của dòng 1 -->
                        <div class="card">
                            <a href=""><img style="max-width: 100%;" src="./img/anh2.jpg" alt=""></a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <!-- Nửa sau của dòng 1 -->
                        <div class="card" style="border: 0; background-color: rgba(0, 0, 0, 0);">
                            <b><a style="text-decoration: none; color:#fff;" href="">Phong tro 1</a></b>
                            <p style="font-size: 12px; color:#000000"><b>Ha Noi</b> - Ngay dang bai: ${date}</p>
                            <p style="font-size: 12px; color:#000000">So luot thich: ${like}</p>
                            <p style="color: #000000; font-size: 12px;">Mo ta: ${Mota}</p>
                        </div>
                    </div>
                </div>

                <div style="height: 12px;"></div>
                <hr color="#fff">
                <div style="height: 12px;"></div>
            </div>
        </div>
    </body>
    <footer></footer>

    <script>
        function redirectChangeInf() {
            window.location.href = "TrangchuChangeInf.jsp";
        }
    </script>
    <script>
        function redirectLogout() {
            window.location.href = "index.jsp";
        }
    </script>
    <script>
        function redirectAdd() {
            window.location.href = "TrangchuDangbaimoi.jsp";
        }
    </script>
    <script>
        function redirectEdit() {
            window.location.href = "TrangchuEditBaidang.jsp";
        }
    </script>
    <script>
        function redirectDelete() {
            window.location.href = "Trangchu.jsp";
        }
    </script>
</body>
</html>
