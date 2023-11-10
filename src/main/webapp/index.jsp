<%@ page import="com.example.housemanage.controller.TrangchuServlet" %>
<%@ page import="com.example.housemanage.controller.DBConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.housemanage.model.Room" %>
<%@ page import="com.example.housemanage.controller.SearchServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    TrangchuServlet trangchuServlet = new TrangchuServlet();
    List<Room> roomList = trangchuServlet.getRoom();
%>

<html>
<head>
    <title>Dashboard</title>
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
        .facebook-icon {
            display: inline-block;
            width: 40px;
            height: 40px;
            background-image: url(./img/facebook.jpg);
            background-size: cover;
            transition: background-color 0.2s, transform 0.2s;
        }

        .facebook-icon:hover {
            background-color: #1877f2;
            transform: scale(1.2);
        }
        .insta-icon {
            display: inline-block;
            width: 40px;
            height: 40px;
            background-image: url(./img/instagram.jpg);
            background-size: cover;
            transition: background-color 0.2s, transform 0.2s;
        }

        .insta-icon:hover {
            background-color: #1877f2;
            transform: scale(1.2);
        }
        .zalo-icon {
            display: inline-block;
            width: 40px;
            height: 40px;
            background-image: url(./img/zalo.jpg);
            background-size: cover;
            transition: background-color 0.2s, transform 0.2s;
        }

        .zalo-icon:hover {
            background-color: #1877f2;
            transform: scale(1.2);
        }
        .card1 {
            position: absolute;
            height: 350px;
            width: 100%;
            max-width: 850px;
            margin: auto;
            background: #ffffff;
            border-radius: 25px;
            box-shadow: 0 10px 50px rgba(0, 0, 0, 0.3);
        }

        .card1 .inner_part {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0 0 0 30px;
            height: 350px;
            position: absolute;
        }

        #slideImg:checked ~ .inner_part {
            padding: 0;
            transition: 0.1s ease-in;
        }

        .inner_part .img {
            height: 260px;
            width: 260px;
            overflow: hidden;
            flex-shrink: 0;
            border-radius: 20px;
            box-shadow: 0 10px 50px rgba(0, 0, 0, 0.2);
        }

        #slideImg:checked ~ .inner_part .img {
            height: 350px;
            width: 850px;
            z-index: 99;
            transition: 0.3s 0.2s ease-in;
        }

        .img img {
            height: 100%;
            width: 100%;
            cursor: pointer;
            opacity: 0;
            transition: 0.6s;
        }

        #slide_1:checked ~ .inner_part .img_1,
        #slide_2:checked ~ .inner_part .img_2,
        #slide_3:checked ~ .inner_part .img_3,
        #slide_4:checked ~ .inner_part .img_4,
        #slide_5:checked ~ .inner_part .img_5 {
            opacity: 1;
            transition-delay: 0.2s;
        }

        .content {
            padding: 0 20px 0 35px;
            width: 530px;
            margin-left: 50px;
            opacity: 0;
            transition: 0.6s;
        }

        #slideImg:checked ~ .inner_part .content {
            display: none;
        }

        #slide_1:checked ~ .inner_part .content_1,
        #slide_2:checked ~ .inner_part .content_2,
        #slide_3:checked ~ .inner_part .content_3,
        #slide_4:checked ~ .inner_part .content_4,
        #slide_5:checked ~ .inner_part .content_5 {
            opacity: 1;
            margin-left: 0;
            z-index: 100;
            transition-delay: 0.3s;
        }

        .content .title {
            font-size: 30px;
            font-weight: 700;
            color: #0d0925;
            margin: 0 0 20px 0;
        }

        .content .text {
            font-size: 19px;
            color: #4e4a67;
            margin: 0 auto 30px auto;
            line-height: 1.5em;
            text-align: justify;
        }

        .content button {
            padding: 15px 20px;
            border: none;
            font-size: 16px;
            color: #fff0e6;
            font-weight: 600;
            letter-spacing: 1px;
            border-radius: 50px;
            cursor: pointer;
            outline: none;
            background: #000000;
            box-shadow: 0 10px 50px rgba(0, 0, 0, 0.2);
            float: right;
        }

        .content button:hover {
            background: #cecece;
            color: #000000;
        }

        .slider {
            position: absolute;
            bottom: 25px;
            left: 55%;
            transform: translateX(-50%);
            z-index: 1;
        }

        #slideImg:checked ~ .slider {
            display: none;
        }

        .slider .slide {
            position: relative;
            height: 10px;
            width: 50px;
            background: #d9d9d9;
            border-radius: 5px;
            display: inline-flex;
            margin: 0 3px;
            cursor: pointer;
        }

        .slider .slide:before {
            position: absolute;
            content: "";
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: #000000;
            border-radius: 10px;
            transform: scaleX(0);
            transition: transform 0.6s;
            transform-origin: left;
        }

        #slide_1:checked ~ .slider .slide_1:before,
        #slide_2:checked ~ .slider .slide_2:before,
        #slide_3:checked ~ .slider .slide_3:before,
        #slide_4:checked ~ .slider .slide_4:before,
        #slide_5:checked ~ .slider .slide_5:before {
            transform: scaleX(1);
            width: 100%;
        }

        input {
            display: none;
        }
        .truncate {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            max-width: 400px;
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
                        <a href="index.jsp" class="bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium" aria-current="page">Dashboard</a>
                        <a href="aboutWebsite.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">About</a>
                    </div>
                </div>
            </div>
            <button style="width: 13%; margin-top: 3px;" onclick="redirectLogin()" type="button" class="btn btn-secondary">Add new post</button>
        </div>
    </div>
</nav>

<form class="bg-white shadow" style="position: fixed; width:100%; top:60px; z-index: 1;" method="post" action="roomSearch.jsp">
    <!-- <label for="large" class="block mb-2 text-base font-medium text-gray-900 dark:text-white">Large select</label> -->
    <select name="local" style="width: 15%;" id="local" class="block w-full px-4 py-2 text-base text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
        <option selected>Address</option>
        <option>Hà Đông</option>
        <option>Thanh Xuân</option>
        <option>Ba Đình</option>
        <option>Hoàn Kiếm</option>
        <option>Tây Hồ</option>
        <option>Long Biên</option>
        <option>Cầu Giấy</option>
        <option>Đống Đa</option>
        <option>Hai Bà Trưng</option>
        <option>Hoàng Mai</option>
    </select>

    <select name="area" style="width: 15%;" id="area" class="block w-full px-4 py-2 text-base text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
        <option selected>Area</option>
        <option>5-10</option>
        <option>10-15</option>
        <option>15-20</option>
        <option>20-25</option>
        <option>25-30</option>
        <option>30-35</option>
        <option>>35</option>
    </select>

    <select name="price" style="width: 15%;" id="price" class="block w-full px-4 py-2 text-base text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
        <option selected>Price</option>
        <option>1-1.5</option>
        <option>1.5-2</option>
        <option>2-2.5</option>
        <option>2.5-3</option>
        <option>3-3.5</option>
        <option>3.5-4</option>
        <option> >4 </option>
    </select>

    <input name="inputsearch" class="inputsearch" type="search" style="width: 20%;" placeholder="Search">

    <button style="display: inline-block; margin-left:3%; margin-top:-5px" type="submit" class="btn btn-secondary">Search</button>
</form>

<div class="container" style="display: flex; margin:100px 5%;">
    <div class="KhoiTrai" style="padding:20px; flex:65; margin-top:30px;">
        <main>
            <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
                <!-- Your content -->
                <%
                    if(!roomList.isEmpty()){
                        for(Room room : roomList){%>
                             <div class="row">
                                <div class="col-md-3">
                                    <div class="card">
                                        <a href="inforHome.jsp?roomid=<%=room.getID()%>"><img style="max-width: 100%;" src="getRoomImage?roomID=<%=room.getID()%>" alt=""></a>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="card" style="border: 0;">
                                        <b><a style="text-decoration: none; color:black;" href="inforHome.jsp?roomid=<%=room.getID()%>"><%= room.getHeading() %></a></b>
                                        <div>
                                            <p style="color: brown; display:inline-block;"><b><%=room.getPrice()%>tr/tháng</b></p>
                                            <p style="display: inline-block; margin-left: 4%;"><%=room.getArea()%>m2</p>
                                            <p style="display: inline-block; margin-left: 4%;"><%= room.getAddress() %></p>
                                        </div>
                                        <p class="truncate" style="color: rgb(122, 121, 120); font-size: 12px;"><%= room.getDescription() %></p>
                                    </div>
                                </div>
                             </div>
                            <div style="height: 12px;"></div>
                            <hr>
                            <div style="height: 12px;"></div>
                           <% }
                        }
                    %>
            </div>
        </main>
        </div>

    <div class="KhoiPhai" style="margin-top: 50px; padding:20px; flex:20;">
        <a href="https://shopee.vn/product/26947756/2820087763"><img style="max-width: 100%;" src="./img/anh1.png" alt=""></a>
    </div>
</div>

<div style="margin-left: 5%; margin-right:5%;">
    <a href="https://doanhnghiep.batdongsan.com.vn/quaysomm"><img src="./img/qcao.png" alt=""></a>
</div>

<div class="bg-white py-24 sm:py-32" style="border-top: 1px solid #d8d6d6; margin-top:10px; z-index:0; height:650px;">
    <div class="mx-auto max-w-7xl px-6 lg:px-8">
        <div class="mx-auto max-w-2xl lg:mx-0">
            <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">From the blog</h2>
            <p class="mt-2 text-lg leading-8 text-gray-600">Những bài báo nói về thực trạng thuê nhà trọ hiện nay.</p>
            <div class="card1" style="margin-top: 20px; margin-left:-7%; z-index: 0">
                <input type="radio" name="select" id="slide_1" checked>
                <input type="radio" name="select" id="slide_2">
                <input type="radio" name="select" id="slide_3">
                <input type="radio" name="select" id="slide_4">
                <input type="radio" name="select" id="slide_5">
                <input type="checkbox" id="slideImg">

                <div class="slider">
                    <label for="slide_1" class="slide slide_1"></label>
                    <label for="slide_2" class="slide slide_2"></label>
                    <label for="slide_3" class="slide slide_3"></label>
                    <label for="slide_4" class="slide slide_4"></label>
                    <label for="slide_5" class="slide slide_5"></label>
                </div>

                <div class="inner_part">
                    <label for="slideImg" class="img">
                        <img class="img_1" src="./img/anhtro1.png">
                    </label>
                    <div class="content content_1">
                        <div class="title"><a style="color: #000000; text-decoration:none;" href="https://kenh14.vn/">Kênh14.net</a></div>
                        <div class="text">
                            Trải nghiệm thuê trọ từ chung cư mini tới nhà nguyên căn: Cần đánh giá an toàn nơi sống
                        </div>
                        <button><a style="color: #fff; text-decoration:none" href="http://kenh14.vn/trai-nghiem-thue-tro-tu-chung-cu-mini-toi-nha-nguyen-can-can-danh-gia-an-toan-noi-song-202309151912064.chn">Read More</a></button>
                    </div>
                </div>

                <div class="inner_part">
                    <label for="slideImg" class="img">
                        <img class="img_2" src="./img/anhtro2.png">
                    </label>
                    <div class="content content_2">
                        <div class="title"><a style="color: #000000; text-decoration:none;" href="https://kenh14.vn/">Kênh14.net</a></div>
                        <div class="text">
                            Tân sinh viên "cân não" không biết nên ở KTX, thuê trọ hay nhà họ hàng: Dưới đây chính là lời giải đáp!
                        </div>
                        <button><a style="color: #fff; text-decoration:none" href="http://kenh14.vn/tan-sinh-vien-can-nao-khong-biet-nen-o-ktx-thue-tro-hay-nha-ho-hang-duoi-day-chinh-la-loi-giai-dap-20230901013049017.chn">Read More</a></button>
                    </div>
                </div>

                <div class="inner_part">
                    <label for="slideImg" class="img">
                        <img class="img_3" src="./img/anhtro3.png">
                    </label>
                    <div class="content content_3">
                        <div class="title"><a style="color: #000000; text-decoration:none;" href="https://thanhnien.vn/">Báo thanh niên</a></div>
                        <div class="text">
                            Đầu năm học, tân sinh viên cần lưu ý gì để tránh ‘sập bẫy’ khi thuê trọ?
                        </div>
                        <button><a style="color: #fff; text-decoration:none" href="https://thanhnien.vn/dau-nam-hoc-tan-sinh-vien-can-luu-y-gi-de-tranh-sap-bay-khi-thue-tro-18523082714315511.htm">Read More</a></button>
                    </div>
                </div>

                <div class="inner_part">
                    <label for="slideImg" class="img">
                        <img class="img_4" src="./img/anhtro4.png">
                    </label>
                    <div class="content content_4">
                        <div class="title"><a style="color: #000000; text-decoration:none;" href="https://dantri.com.vn/">Báo dân trí</a></div>
                        <div class="text">
                            Được hỗ trợ 3 tháng tiền thuê trọ: Mong giá phòng không bị "tông" lên!
                        </div>
                        <button><a style="color: #fff; text-decoration:none" href="https://dantri.com.vn/an-sinh/duoc-ho-tro-3-thang-tien-thue-tro-mong-gia-phong-khong-bi-tong-len-20220329162113330.htm">Read More</a></button>
                    </div>
                </div>

                <div class="inner_part">
                    <label for="slideImg" class="img">
                        <img class="img_5" src="./img/anhtro5.png">
                    </label>
                    <div class="content content_5">
                        <div class="title"><a style="color: #000000; text-decoration:none;" href="https://dantri.com.vn/">Báo dân trí</a></div>
                        <div class="text">
                            Thủ Đức vận động miễn giảm tiền thuê trọ cho công nhân
                        </div>
                        <button><a style="color: #fff; text-decoration:none" href="https://dantri.com.vn/kinh-doanh/thu-duc-van-dong-mien-giam-tien-thue-tro-cho-cong-nhan-20210625180606920.htm">Read More</a></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="gioithieu" style="margin-left:15%; margin-right:15%; background-color:rgb(237, 240, 242); border-radius: 20px;">
    <div style="padding: 15px;">
        <p style="text-align: center;"><b>CHO THUÊ PHÒNG TRỌ SWEET HOME</b></p>
        <p>Hiện đang có rất nhiều bài đăng cho thuê phòng trọ ở khắp mọi nơi tại ứng dụng Sweet Home để bạn có thể tự do lựa chọn phòng trọ theo đúng các nhu cầu về địa điểm, diện tích phòng, giá cả... Chúng tôi tự tin có thể giúp bạn trong việc tìm thuê phòng trọ, nhà trọ trên cả nước.</p>
        <div style="margin-left: 25%; margin-right: 25%; padding:14px;"><img style="max-width:100%; " src="./img/anh.jpg" alt=""></div>
        <p>Dưới đây là một số thực trạng vấn đề thuê trọ và cách để thuê được phòng trọ hợp lý" mà các người muốn thuê trọ nên biết để hạn chế tối thiểu rủi ro và mau chóng tìm được phòng trọ ưng ý.</p>
        <p><b>Thực trạng vấn đề tìm thuê phòng trọ</b></p>
        <p>Trong xã hội hiện đại, việc tìm kiếm chỗ ở thích hợp và phù hợp với nhu cầu của mọi người đang trở thành một thách thức lớn. Đặc biệt ở các thành phố lớn và các khu vực phát triển, nhu cầu về chỗ ở ngày càng gia tăng, gây ra tình trạng khan hiếm các căn hộ, nhà trọ, và phòng ở. Điều này đặt ra câu hỏi quan trọng: Làm thế nào để người dân có thể dễ dàng tìm kiếm và thuê được những nơi ở phù hợp với họ? Thêm vào đó, làm thế nào để những người có nhu cầu cho thuê phòng trọ đưa thông tin về phòng của họ đến với những người có nhu cầu?</p>
        <div style="margin-left: 25%; margin-right: 25%; padding:14px;"><img style="max-width: 100%;" src="./img/anh4.jpg" alt=""></div>
        <p>Để tránh các trường hợp trên, khi đi tìm phòng cần tìm hiểu kỹ thông tin tại các website uy tín, đến trực tiếp xem phòng và hỏi thêm cư dân sống quanh khu vực muốn thuê trọ. Hãy luôn cảnh giác, có nhiều trường hợp giá đăng cho thuê rất rẻ chỉ dưới 1 triệu, nhưng khi đến ở lại phát sinh nhiều phụ thu bất chính khác. Vì vậy cần xác định chính chủ cho thuê, gặp trực tiếp để dễ thỏa thuận kỹ về giá điện, nước, internet, phí gửi xe hoặc các loại phí nào sẽ phát sinh nếu có. Và lưu ý là đọc kỹ hợp đồng trước khi đặt bút ký. </p>
        <p><b>Cách thuê được phòng trọ phù hợp</b></p>
        <p>Nhu cầu tìm phòng trọ luôn vượt lượng cung, đặc biệt là các tiêu chí giá rẻ, phòng trọ đẹp, an ninh... Đầu tiên muốn thuê được phòng trọ đúng nhu cầu thì phải xem nhiều nơi, nhiều phòng trọ để có thể chọn lựa, nhưng việc chạy xe ngoài đường để tìm kiếm phòng trọ thì tốn rất nhiều thời gian cũng như công sức. Vậy để đạt được mục đích 1 cách dễ dàng thì người đi thuê trọ có thể lên mạng tra cứu, tìm hiểu thông tin trước. Sau khi đã tham khảo, lựa chọn được phòng trọ đúng nhu cầu (xem bài đăng có hình ảnh, giới thiệu thông tin phòng trọ, người đăng bài thuê trọ) thì có thể liên lạc với chính chủ nhà trọ để thuê nhà rất dễ dàng và thuận tiện.</p>
        <div style="margin-left: 25%; margin-right: 25%; padding: 14px;"><img style="max-width: 100%;" src="./img/anh5.jpg" alt=""></div>
        <p>Thông tin online thì rất nhiều và nên được chọn lọc kĩ để tránh mất thời gian và lừa đảo. Người thuê trọ nên chọn các trang web, ứng dụng có uy tín để xem. Sweet Home là trang web cho thuê trọ có thể đóng vai trò quan trọng trong việc nâng cao sự thuận tiện và hiệu quả trong việc tìm kiếm và thuê nhà, đồng thời giúp tạo ra một cộng đồng nhà ở đa dạng và phong cách.</p>
        <p>Hãy luôn tỉnh táo, sáng suốt đọc kỹ thông tin phòng để lựa chọn được phòng trọ theo đúng các tiêu chí của bạn. Việc tìm phòng trọ sẽ không còn khó khăn như bạn nghĩ, hãy đến với Sweet Home! </p>
    </div>
</div>

<div class="footer1" style="margin-top: 25px; margin-left:15%; margin-right:15%; background-color:#fff; border-radius: 20px; border: 2px solid #d8d6d6">
    <div style="padding: 15px;">
        <div style="margin-left: 30%; margin-right:30%;">
            <img src="./img/anh7.jpg" alt="">
        </div>
        <p style="text-align: center;"><b>Liên hệ với chúng tôi nếu bạn cần hỗ trợ</b></p> <br>
        <div class="bg-white py-24 sm:py-32" style="margin-top:-100px; height:200px">
            <div class="mx-auto max-w-7xl px-6 lg:px-8 flex justify-center">
                <dl class="grid grid-cols-1 gap-x-8 gap-y-16 text-center lg:grid-cols-2" >
                    <div class="mx-auto flex max-w-xs flex-col gap-y-4">
                        <dt style="font-size: 18px; color:#f43d3d" class="text-base leading-7 text-gray-600">Hỗ trợ đăng tin</dt>
                        <dd style="padding: 0; font-size: 20px;" class="text-base leading-7 text-gray-600">Điện thoại: 0966344955</dd>
                        <dd style="margin-top:-10px; font-size: 20px;" class="text-base leading-7 text-gray-600">Zalo: <a href="https://zalo.me/0966344956">0966344955</a></dd>
                    </div>

                    <div class="mx-auto flex max-w-xs flex-col gap-y-4">
                        <dt style="font-size: 18px; color:#f43d3d" class="text-base leading-7 text-gray-600">Phản ánh/Khiếu nại</dt>
                        <dd style="padding: 0; font-size: 20px;" class="text-base leading-7 text-gray-600">Điện thoại: 0388191919</dd>
                        <dd style="margin-top:-10px; font-size: 20px;" class="text-base leading-7 text-gray-600">Zalo: <a href="https://zalo.me/0388191919">0388191919</a></dd>
                    </div>
                </dl>
            </div>
        </div>
    </div>
</div>

<hr style="margin-top: 60px;">

<div class="bg-white py-24 sm:py-32" style="margin-left: 20%; margin-right:20%;">
    <img style="width: 200px; margin-top:-120px; z-index:-1;" src="./img/topPeekI.png" alt="">
    <div class="mx-auto max-w-7xl px-6 lg:px-8" style="margin-top: -5px; background-color:#fff; z-index:0; border:1px solid #c6c3c3; border-radius:20px;">
        <div style="text-align: center;">
            <p style="color: #f43d3d; font-size:25px; margin-top:-40px"><b>Thông tin liên hệ</b></p>
            <a style="margin-right: 18px;" href="https://www.facebook.com" target="_blank" class="facebook-icon"></a> <a style="margin-right: 18px;" href="https://www.instagram.com/" target="_blank" class="insta-icon"></a> <a href="https://zaloweb.me/" target="_blank" class="zalo-icon"></a>
            <p style="color: rgb(153, 153, 153);">Địa chỉ: Yên Nghĩa, Hà Đông, Hà Nội</p>
        </div>
    </div>
</div>

<div style="text-align: center; margin-top:-80px;">
    <p style="font-size: 15px; color:#969494">Website Developer</p>
    <p style="font-size: 12px; color:#b5b3b3; margin-top:-12px">H503 X Thu Quynh</p>
</div>
<script src="ButtonAvatar.js"></script>
<script>
    function redirectLogin() {
        window.location.href = "http://localhost:8080/HouseManage/login";
    }
</script>
</body>
</html>
