/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function displayImage() {
    var fileInput = document.getElementById('input-file');
    var avatarImage = document.getElementById('avatarImage');
    var file = fileInput.files[0];
    var reader = new FileReader();

    reader.onloadend = function () {
        avatarImage.src = reader.result;
    }

    if (file) {
        reader.readAsDataURL(file);
    } else {
        avatarImage.src = "";
    }
}


// Khi form được gửi

$('#myForm').on('submit', function (e) {
    e.preventDefault();

    var formData = new FormData(this);

    $.ajax({
        url: $(this).attr('action'),
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            // Xử lý khi upload thành công
            $('#avatarImage').attr('src', 'assets/upload/' + response);

            //Tải lại trang
            setTimeout(function () {
                location.reload();
            }, 2000);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            // Xử lý khi có lỗi xảy ra
            console.log(textStatus, errorThrown);
        }
    });
});

