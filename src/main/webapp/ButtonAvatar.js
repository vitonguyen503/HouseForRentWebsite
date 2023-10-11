// Lấy tham chiếu đến các phần tử HTML cần tương tác
const showLinksButton = document.getElementById('user-menu-button');
const myForm = document.getElementById('myForm');
const links = myForm.getElementsByTagName('a');

// Thay đổi trạng thái ban đầu của dropdown
myForm.style.display = 'none';

// Thêm sự kiện click vào nút để hiển thị hoặc ẩn dropdown
showLinksButton.addEventListener('click', function() {
    if (myForm.style.display === 'none') {
        myForm.style.display = 'block';
    } else {
        myForm.style.display = 'none';
    }
});
