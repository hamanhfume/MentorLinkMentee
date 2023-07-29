<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : updateCV
    Created on : Jun 14, 2023, 2:51:32 AM
    Author     : Tuan Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Update CV</title>
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,600&display=swap" rel="stylesheet">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
        <link rel="stylesheet" href="assets/css/createCV.css">
        <<link rel="stylesheet" href="assets/css/selectSkill.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>

    <body>
        <jsp:include page="../home/header.jsp"/>
        <header class="header1">
            <div class="col-md-12 title-cv text-center">
                <h1 class="header__title" style="font-weight: 500; font-size: 40px;"><b>Update CV Of Mentor</b></h1>
            </div>
        </header>
        <div class="content">
            <div class="content__inner">
                <h2 class="content__title" style="font-weight: 200;">Click on steps or 'Back' and 'Next' buttons</h2>
            </div>
            <div class="container overflow-hidden">
                <div class="multisteps-form">
                    <div class="row">
                        <div class="col-12 col-lg-8 ml-auto mr-auto mb-4">
                            <div class="multisteps-form__progress">
                                <button class="multisteps-form__progress-btn js-active" type="button" title="User Info">User
                                    Info</button>
                                <button class="multisteps-form__progress-btn" type="button" title="Profession">Profession</button>
                                <button class="multisteps-form__progress-btn" type="button" title="Skills">Skills</button>
                                <button class="multisteps-form__progress-btn" type="button" title="Service">Service Description</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-8 m-auto">
                            <form class="multisteps-form__form" action="updatecv" method="post" onsubmit="return validateForm()">
                                <div class="multisteps-form__panel shadow p-4 rounded bg-white js-active" data-animation="scaleIn">
                                    <h3 class="multisteps-form__title"><b>Your User Info</b></h3>
                                    <div class="multisteps-form__content">
                                        <div class="form-row mt-4">
                                            <div class="col-12 col-sm-6">
                                                <label>Account Name</label>
                                                <input class="multisteps-form__input form-control" type="text" value="${cv.getInfor().getUsername()}" placeholder="Account Name" readonly required/>
                                            </div>
                                            <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                <label>Full Name</label>
                                                <input class="multisteps-form__input form-control" type="text" value="${cv.getInfor().getFull_name()}" placeholder="Full Name" name="fullName" required/>
                                            </div>
                                        </div>
                                        <div class="form-row mt-4">
                                            <div class="col-12 col-sm-6">
                                                <label>Date Of Birth</label>
                                                <input class="multisteps-form__input form-control" type="date" name="date_of_birth" value="${cv.getInfor().getDate_of_birth()}" required/>
                                            </div>
                                            <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                <div class="form-group">
                                                    <label for="gender">Gender</label>
                                                    <select class="form-control" id="gender" name="gender" >
                                                        <option value="Male" ${cv.getInfor().getGender() == 1 ? 'selected' : ''}>Nam</option>
                                                        <option value="Female" ${cv.getInfor().getGender() == 0 ? 'selected' : ''}>Nữ</option>
                                                    </select>
                                                </div>                                                   
                                                <!--<input class="multisteps-form__input form-control" type="text" name="gender"/>-->
                                            </div>
                                        </div>
                                        <div class="form-row mt-4">
                                            <div class="col-12 col-sm-6">
                                                <label>Email</label>
                                                <input class="multisteps-form__input form-control" name="email" value="${cv.getInfor().getEmail()}" type="email" placeholder="Email" readonly required/>
                                            </div>
                                            <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                <label>Address</label>
                                                <input class="multisteps-form__input form-control" type="text" placeholder="Address" name="address" value="${cv.getInfor().getAddress()}" required/>
                                            </div>
                                        </div>
                                        <div class="button-row d-flex mt-4">
                                            <button class="btn btn-next ml-auto js-btn-next" type="button" title="Next" style="color: #fff;
                                                    background-color: #175E4C;color: white;">Next</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                                    <h3 class="multisteps-form__title"><b>Profession</b></h3>
                                    <h4 style="content: '';
                                        background-color: #175E4C; width: 260px; height: 4px; margin-bottom: 50px;"></h4>
                                    <div class="multisteps-form__content">
                                        <div class="form-row mt-4">
                                            <div class="col">
                                                <label>Your Profession</label>
                                                <input class="multisteps-form__input form-control" value="${cv.getProfession()}" type="text" placeholder="Your Profession" name="profession" required/>
                                            </div>
                                        </div>
                                        <div class="form-row mt-4">
                                            <label>Profession Introduction</label>
                                            <textarea class="multisteps-form__textarea form-control" placeholder="Service Description"
                                                      rows="4" name="profession_intro" style="resize: none;" required>${cv.getProfession_introduction()}</textarea>
                                        </div>

                                        <h3 class="multisteps-form__title" style="margin-top: 50px;"><b>Archivement</b></h3>
                                        <h4 style="content: '';
                                            background-color: #175E4C; width: 260px; height: 4px; margin-bottom: 50px;"></h4>
                                        <div class="form-row mt-4">
                                            <div class="col">
                                                <label>Your Archivement</label>
                                                <input class="multisteps-form__input form-control" type="text" placeholder="Your Profession" name="archivement" value="${cv.getAchievements()}" required/>
                                            </div>
                                        </div>
                                        <div class="form-row mt-4">
                                            <label>Archivement Descition</label>
                                            <textarea class="multisteps-form__textarea form-control" placeholder="Service Description"
                                                      rows="4" name="archivement_des" style="resize: none;" required>${cv.getAchievements_des()}</textarea>
                                        </div>
                                        <div class="row">
                                            <div class="button-row d-flex mt-4 col-12">
                                                <button class="btn btn-back js-btn-prev" type="button" title="Prev" style="color: #fff;
                                                        background-color: #175E4C;color: white;">Back</button>
                                                <button class="btn btn-next ml-auto js-btn-next" type="button" title="Next" style="color: #fff;
                                                        background-color: #175E4C;color: white;">Next</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <style>

                                </style>

                                <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                                    <h3 class="multisteps-form__title"><b>Select your skills.</b></h3>
                                    <div class="wrapper2">
                                        <div class="container2">                          
                                            <c:forEach var="s" items="${listSkill}">
                                                <label class="option_item">
                                                    <input type="checkbox" class="checkbox" name="SkillId" value="${s.getSkill_id()}">
                                                    <div class="option_inner facebook">
                                                        <div class="tickmark"></div>      
                                                        <div class="name">${s.getSkill_name()}</div>
                                                    </div>
                                                </label>
                                            </c:forEach>

                                        </div>
                                        <div class="row">
                                            <div class="button-row d-flex mt-4 col-12">
                                                <button class="btn btn-back js-btn-prev" type="button" title="Prev" style="color: #fff;
                                                        background-color: #175E4C;color: white;">Back</button>
                                                <button class="btn btn-next ml-auto js-btn-next" type="button" title="Next" style="color: #fff;
                                                        background-color: #175E4C;color: white;">Next</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>                               
                                <script>
                                    function validateForm() {
                                        // Kiểm tra các trường input và textarea
                                        const inputs = document.querySelectorAll("input[required], textarea[required]");
                                        for (let i = 0; i < inputs.length; i++) {
                                            if (!inputs[i].value.trim()) {
                                                alert("Vui lòng điền đầy đủ thông tin.");
                                                return false; // Ngăn người dùng gửi biểu mẫu nếu có trường bắt buộc trống.
                                            }
                                        }

                                        // Kiểm tra checkbox
                                        const checkboxes = document.getElementsByName("SkillId");
                                        let isChecked = false;

                                        for (let i = 0; i < checkboxes.length; i++) {
                                            if (checkboxes[i].checked) {
                                                isChecked = true;
                                                break;
                                            }
                                        }

                                        if (!isChecked) {
                                            alert("Vui lòng chọn ít nhất một kỹ năng.");
                                            return false; // Ngăn người dùng gửi biểu mẫu nếu không có checkbox nào được chọn.
                                        }

                                        return true; // Cho phép người dùng gửi biểu mẫu nếu các trường bắt buộc đã được nhập và có ít nhất một checkbox được chọn.
                                    }
                                </script>

                                <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                                    <h3 class="multisteps-form__title"><b>Service Description</b></h3>
                                    <h4 style="content: '';
                                        background-color: #175E4C; width: 260px; height: 4px; margin-bottom: 50px;"></h4>
                                    <div class="form-row mt-4">
                                        <label>Your Description</label>
                                        <textarea class="multisteps-form__textarea form-control" name="service_des" placeholder="Service Description"
                                                  rows="4" style="resize: none;" required>${cv.getService_description()}</textarea>
                                    </div>

                                    <h3 class="multisteps-form__title" style="margin-top: 50px;"><b>The rogramming</b></h3>
                                    <h4 style="content: '';
                                        background-color: #175E4C; width: 260px; height: 4px; margin-bottom: 50px;"></h4>
                                    <div class="form-row mt-4">
                                        <label>The programming (Framework) you can training for the Mentee.</label>
                                        <textarea class="multisteps-form__textarea form-control" name="programming" placeholder="Service Description"
                                                  rows="4" style="resize: none;" required>${cv.getLanguage()}</textarea>
                                    </div>
                                    <div class="button-row d-flex mt-4">
                                        <button class="btn btn-back js-btn-prev" type="button" title="Prev" style="color: #fff;
                                                background-color: #175E4C;color: white;">Back</button>
                                        <button class="btn btn-next ml-auto" type="submit" title="Send" style="color: #fff;
                                                background-color: #175E4C;color: white;">Send</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="assets/js/createCV.js"></script>
<jsp:include page="../home/footer.jsp"/>
</body>

</html>
