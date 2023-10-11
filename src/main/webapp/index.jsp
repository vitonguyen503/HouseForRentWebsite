<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sweet Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        html{
            height: 100vh;
        }

        body{
            margin-top: 100px;
            background-image: url(./img/anh6.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .container{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 60%;
            width: 80%;
            margin-left: 16%;
        }
        .block {
            flex-grow: 1;
            background-color: #f2f2f2;
            margin-right: 30px;
            margin-top: 77px;
        }
        .container .block h3, h2{
            text-align: center;
        }
        .overlay-img {
            position: absolute;
            top: 0;
            left: 0;
            width: 300px;
            height: auto;
            z-index: 1;
            margin-left: 74%;
            margin-top: 30%;
        }
        .container-form{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            margin-top: 10px;

        }
    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/modules" method="post">
        <div class="container">
            <div class="block" style="flex-basis: 50%; height: 70vh; background-color: rgba(255, 255, 255, 0);">

                <div style="display:inline-block; padding-bottom:18px;"><img style="width:50px; margin-left:140px; margin-right: 20px"  src="./img/logo.jpg" alt=""><b style="color: #c86161; display:inline-block "><h2>Sweet Home</h2></b></div>
                <h3 style="color: #000;">
                    Tìm trọ - Tìm niềm tin
                </h3>

                <p>Với hàng ngàn danh sách phòng trọ trên trang web, bạn có nhiều lựa chọn để tìm được ngôi nhà lý tưởng phù hợp với phong cách sống và ngân sách của bạn.</p>
                <p>Hãy truy cập trang web của chúng tôi ngay bây giờ để khám phá hàng ngàn lựa chọn phòng trọ đáng yêu và thuận tiện. Bạn sẽ không thất vọng!</p>
                <h6>Bạn là: </h6>
                <div class="container-form" style="width: 70%; height: 60px; display:flex; justify-content:center; align-items:center; margin-left:13%">
                    <button onclick="redirectLoginPage()" style="margin-right: 10px; width:100px" type="button" class="btn btn-secondary">User</button>
                    <button onclick="redirectTrangchuGuest()" style="width: 100px;" type="button" class="btn btn-danger">Guest</button>
                </div>


            </div>
            <div class="block" style="flex-basis: 30%; height:70vh; background-color: rgba(255, 255, 255, 0);" >
                <img style="max-width: 100%;" src="./img/anh2.jpg" alt="">
            </div>
        </div>
        <div class="overlay-img"><img style="max-width: 100%;" src="./img/anh3.jpg" alt=""></div>
    </form>
    <script>
        function redirectLoginPage() {
            // Sử dụng JavaScript để điều hướng sang trang khác
            window.location.href = "login.jsp";
        }
    </script>
    <script>
        function redirectTrangchuGuest() {
            // Sử dụng JavaScript để điều hướng sang trang khác
            window.location.href = "dashboardGuest.jsp";
        }
    </script>
</body>
</html>