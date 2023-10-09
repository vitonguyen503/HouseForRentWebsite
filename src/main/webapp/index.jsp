<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Homelyyyyyyy</title>
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

        }
        .block {
            flex-grow: 1;
            background-color: #f2f2f2;
            margin-right: 30px;
            margin-top: 60px;
        }
        .container .block h3, h2{
            text-align: center;
        }
        .overlay-img {
            position: absolute; /* Thiết lập vị trí tuyệt đối */
            top: 0;
            left: 0;
            width: 300px; /* Độ rộng của ảnh chèn lên */
            height: auto; /* Chiều cao tự động tính dựa trên tỷ lệ khung chứa */
            z-index: 1; /* Đảm bảo rằng ảnh chèn lên nằm trên ảnh gốc */
            margin-left: 70%;
            margin-top: 27%;
        }
        .container-form{
            display: flex;
            flex-direction: row; /* Đặt chiều ngang */
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
            <div style="display:inline-block;"><img style="width:50px; margin-left:100px; margin-right: 20px"  src="./img/Xanh dương nhạt và Trắng Hình vẽ một nét Đơn giản Phòng tập Biểu trưng Phòng tập.png" alt=""><b style="color: #c86161; display:inline-block "><h2>Homelyyyyyyy</h2></b></div>
            <h3 style="color: #000;">
                <i class="fa-solid fa-scissors"></i>
                Tìm trọ - Tìm niềm tin
            </h3>

            <p>Với hàng ngàn danh sách phòng trọ trên trang web, bạn có nhiều lựa chọn để tìm được ngôi nhà lý tưởng phù hợp với phong cách sống và ngân sách của bạn.</p>
            <p>Hãy truy cập trang web của chúng tôi ngay bây giờ để khám phá hàng ngàn lựa chọn phòng trọ đáng yêu và thuận tiện. Bạn sẽ không thất vọng!</p>
            <h6>Bạn là: </h6>
            <div class="container-form" style="width: 70%; background-color:#f3b6b6; height: 60px; margin-left:14%">
                <button style="margin-right: 30px;" type="button" class="btn btn-secondary" onclick="redirectLoginPage()">Người cho thuê</button>
                <button onclick="" type="button" class="btn btn-danger">Người tìm trọ</button>
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
            window.location.href = "Login.jsp";
        }
    </script>
</body>
</html>