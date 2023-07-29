<%-- 
    Document   : createRequest
    Created on : Jun 12, 2023, 9:08:48 PM
    Author     : Tuan Vinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!---Coding By CodingLab | www.codinglabweb.com--->
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />

        <link rel="stylesheet" href="assets/css/request.css" />
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag/dist/css/multi-select-tag.css">
    </head>

    <body>
        <jsp:include page="../home/header.jsp"/>
        <div class="body_temp">
            <section class="container1">    
                <div class="header_title">
                    <div class="header_tmp">
                        <header>Create Request</header>  
                    </div>
                </div>
                <form action="requestMentor" method="post" class="formm">
                    <div class="input-boxx">
                        <label>Title</label>
                        <input type="text" placeholder="Enter the title" name="tieude"required />
                    </div>

                    <div class="columnn">
                        <div class="input-boxx">
                            <label>Start Time</label>
                            <input type="datetime-local" id="start-time" placeholder="Enter start time" name="batdau" required />
                        </div>
                        <div class="input-boxx">
                            <label>End Time</label>
                            <input type="datetime-local" id="end-time" placeholder="Enter end time" name="ketthuc" required />
                        </div>
                    </div>
                    <script>

                        // Lấy thời gian hiện tại
                        var currentTime = new Date();

                        // Thêm 1 giờ vào thời gian hiện tại
                        currentTime.setHours(currentTime.getHours() + 1);

                        // Định dạng chuỗi YYYY-MM-DDTHH:MM
                        var minStartTime = currentTime.toISOString().slice(0, 16);

                        // Thiết lập giá trị tối thiểu cho input thời gian bắt đầu
                        document.getElementById("start-time").setAttribute("min", minStartTime);

                        // Xử lý sự kiện khi giá trị thời gian bắt đầu thay đổi
                        document.getElementById("start-time").addEventListener("input", function () {
                            var startTime = new Date(this.value);

                            // Thêm 1 giờ vào thời gian bắt đầu
                            startTime.setHours(startTime.getHours() + 1);

                            // Định dạng chuỗi YYYY-MM-DDTHH:MM
                            var minEndTime = startTime.toISOString().slice(0, 16);

                            // Thiết lập giá trị tối thiểu cho input thời gian kết thúc
                            document.getElementById("end-time").setAttribute("min", minEndTime);

                            // Kiểm tra điều kiện thời gian và hiển thị thông báo lỗi nếu chọn sai
                            var endTimeInput = document.getElementById("end-time");
                            var endTime = new Date(endTimeInput.value);

                            if (endTime <= startTime) {
                                endTimeInput.setCustomValidity("End time must be greater than start time.");
                            } else {
                                endTimeInput.setCustomValidity(""); // Xóa thông báo lỗi nếu hợp lệ
                            }
                        });
                    </script> 

                    <div class="gender-boxx">
                        <div class="gender-boxx">
                            <label style="font-size: 15px; font-weight: bold;">Skill</label>
                            <div class="gender-option ">
                                <select name="skills" id="skills" multiple=>
                                    <c:forEach items="${listp}" var="o" varStatus="status">
                                        <option value="${o.getSkill_id()}">${o.skill_name}</option>
                                        <c:if test="${status.index % 4 == 3}">
                                            <div style="width: 100%; height: 0;"></div>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                    </div>
                    <script>
                        function handleSkillSelection() {
                            var select = document.getElementById("skills");
                            var options = select.selectedOptions;
                            var selectedCount = options.length;
                            var minSelection = 1;
                            var maxSelection = 3;

                            if (selectedCount < minSelection) {
                                alert("Please select at least " + minSelection + " skill.");
                                event.preventDefault(); // Ngăn việc gửi dữ liệu xuống server
                            } else if (selectedCount > maxSelection) {
                                alert("Please select at most " + maxSelection + " skills.");
                                event.preventDefault(); // Ngăn việc gửi dữ liệu xuống server
                            }
                        }
                    </script>

                    <div class="input-boxx">
                        <label>Duration of the request</label>
                        <div class="select-boxx">
                            <select name="sogiohoc" required>
                                <option hidden>Choose time</option>
                                <option value="1">1 hour</option>
                                <option value="2">2 hour</option>
                                <option value="3">3 hour</option>
                                <option value="4">4 hour</option>
                                <option value="5">5 hour</option>
                            </select>
                        </div>
                    </div>
                    <script>
                        // Xử lý sự kiện khi giá trị thay đổi
                        var selectElement = document.querySelector('select[name="sogiohoc"]');
                        selectElement.addEventListener('change', function () {
                            var selectedValue = parseInt(this.value);
                            var startTimeInput = document.getElementById("start-time");
                            var endTimeInput = document.getElementById("end-time");
                            var startTime = new Date(startTimeInput.value);
                            var endTime = new Date(endTimeInput.value);

                            // Thêm số giờ học vào thời gian bắt đầu
                            startTime.setHours(startTime.getHours() + selectedValue);

                            // Kiểm tra điều kiện khoảng cách giữa bắt đầu và kết thúc
                            if (endTime < startTime) {
                                this.setCustomValidity("End time must be greater than or equal to the start time plus duration of the request.");
                            } else {
                                this.setCustomValidity(""); // Xóa thông báo lỗi nếu hợp lệ
                            }
                        });
                    </script>
                    <div class="input-boxx">
                        <label>Content</label><br>
                        <textarea placeholder="Content required" name="noidung" required></textarea>
                    </div>

                    <c:if test="${requestScope.errE!=null}">
                        <h6 style="color: red">${requestScope.errE}</h6>
                    </c:if>
                    <p></p>

                    <button style="border: 30px; background: #175E4C">Send Request</button>
                </form>
            </section>
        </div>
        <script src="https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag/dist/js/multi-select-tag.js"></script>
        <script>
                        new MultiSelectTag('skills')
        </script>

    </body>
    <jsp:include page="../home/footer.jsp"/>
</html>