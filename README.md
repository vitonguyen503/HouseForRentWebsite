# 1. Giới thiệu
## 1.1. Đặt vấn đề
Trong xã hội hiện đại, việc tìm kiếm chỗ ở thích hợp và phù hợp với nhu cầu của mọi người đang trở thành một thách thức lớn. Đặc biệt ở các thành phố lớn và các khu vực phát triển, nhu cầu về chỗ ở ngày càng gia tăng, gây ra tình trạng khan hiếm các căn hộ, nhà trọ, và phòng ở. Điều này đặt ra câu hỏi quan trọng: Làm thế nào để người dân có thể dễ dàng tìm kiếm và thuê được những nơi ở phù hợp với họ? Thêm vào đó, làm thế nào để những người có nhu cầu cho thuê phòng trọ đưa thông tin về phòng của họ đến với những người có nhu cầu? 

Trang web cho thuê trọ ra đời với mục tiêu giải quyết vấn đề này. Chúng tôi nhận thấy rằng việc nắm bắt thông tin về các căn hộ, nhà trọ, và phòng ở hiện có, cũng như tạo một nền tảng kết nối giữa người cho thuê và người thuê, có thể giúp cải thiện trải nghiệm tìm kiếm và thuê nhà của mọi người.

Sản phẩm của chúng tôi không chỉ giúp người dùng dễ dàng tìm kiếm các loại chỗ ở, mà còn cung cấp thông tin chi tiết về từng căn hộ hoặc phòng, giúp họ đưa ra quyết định thông minh. Đồng thời, chúng tôi cung cấp một cơ hội cho những người có chỗ ở trống để tiếp cận một lượng lớn người thuê tiềm năng, tăng khả năng cho thuê nhanh chóng và hiệu quả.

Chúng tôi tin rằng trang web cho thuê trọ có thể đóng vai trò quan trọng trong việc nâng cao sự thuận tiện và hiệu quả trong việc tìm kiếm và thuê nhà, đồng thời giúp tạo ra một cộng đồng nhà ở đa dạng và phong cách. Hãy cùng chúng tôi khám phá những cơ hội và lợi ích mà trang web của chúng tôi mang lại và tham gia cùng chúng tôi trong cuộc hành trình tạo ra một môi trường ở tốt hơn cho mọi người.
## 1.2. Các giải pháp đã có
Từ xưa đến nay, những người có nhu cầu cho thuê phòng trọ vẫn luôn sử dụng các cách marketing truyền thống như: biển quảng cáo, môi giới, ... Tuy nhiên, trong thời đại công nghệ bùng nổ như hiện nay, những phương pháp ấy không còn hiệu quả nữa. Lượng người mà người cho thuê có thể truyền tải tới là không nhiều do những hạn chế như: khoảng cách địa lý, ...
## 1.3. Giải pháp đề xuất
Với vấn đề này, một trang web cho thuê trọ là phương pháp hiệu quả nhất. Với độ phủ sóng của Internet, người dùng có thể dễ dàng nắm bắt được các thông tin về phòng trọ mình cần thông qua vài cú click chuột, thuận lợi hơn rất nhiều so với những phương pháp cổ điển.

# 2. Thiết kế và triển khai
## 2.1. Yêu cầu chức năng
### 2.1.1. Đăng nhập/Đăng ký
Ứng dụng cho phép:
- Đối với người cho thuê: tạo tài khoản và đăng nhập vào hệ thống
- Đối với người tìm trọ: không cần tạo tài khoản mà vẫn có thể truy cập vào hệ thống
### 2.1.2. Đăng bài cho thuê trọ
Ứng dụng cho phép:
- Đối với người cho thuê:
  - Đăng bài về thông tin trọ
  - Chỉnh sửa các bài đăng (sửa nội dung, xóa)
- Đối với người tìm trọ: không có

### 2.1.3. Hiển thị các phòng trọ có sẵn 
- Đối với người cho thuê:
  - Xem các phòng trọ đã đăng
  - Xem tất cả các phòng trọ có sẵn
- Đối với người tìm trọ:
  - Xem được tất cả các phòng trọ trên hệ thống
  - Xem các phòng trọ theo tiêu chí: giá trọ, địa điểm, ...

 ### 2.1.4. Đặt chỗ
 - Đối với người cho thuê:
   - Xem được thông tin của người đã đặt chỗ đối với từng phòng trọ
 - Đối với người tìm trọ:
   - Để lại thông tin cá nhân để người cho thuê liên lạc
  
## 2.2. Yêu cầu phi chức năng
### 2.2.1. Thời gian phản hồi (Response Time)
Sản phẩm phải đáp ứng được thời gian tải dữ liệu đủ nhanh khi người dùng truy cập vào trang web.
### 2.2.2. Tính sẵn sàng (Availability) 
Hệ thống luôn phải sẵn sàng bất cứ lúc nào vì người dùng có thể truy cập vào bất kỳ thời điểm nào trong ngày.
### 2.2.3. 
