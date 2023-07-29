<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : createCV
    Created on : May 28, 2023, 5:10:47 PM
    Author     : Tuan Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Create CV</title>
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,600&display=swap" rel="stylesheet">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
        <link rel="stylesheet" href="assets/css/createCV.css">
        <link rel="stylesheet" href="assets/css/selectSkill.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>

    <body>
        <jsp:include page="../home/header.jsp"/>
        <header class="header1">
            <div class="col-md-12 title-cv text-center">
                <h1 class="header__title" style="font-weight: 500; font-size: 40px;"><b>Create CV Of Mentor</b></h1>
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
                            <form id="formId" class="multisteps-form__form" action="CreateCV" method="post" onsubmit="return validateForm()">
                                <div class="multisteps-form__panel shadow p-4 rounded bg-white js-active" data-animation="scaleIn">
                                    <h3 class="multisteps-form__title"><b>Your User Info</b></h3>
                                    <div class="multisteps-form__content">
                                        <div class="form-row mt-4">
                                            <div class="col-12 col-sm-6">
                                                <label>Account Name</label>
                                                <input class="multisteps-form__input form-control" type="text" value="${InfoU.getUsername()}" placeholder="Account Name" name="username" required=""/>
                                            </div>
                                            <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                <label>Full Name</label>
                                                <input class="multisteps-form__input form-control" type="text" value="${InfoU.getFull_name()}" placeholder="Full Name" name="fullName" required=""/>
                                            </div>
                                        </div>
                                        <div class="form-row mt-4">
                                            <div class="col-12 col-sm-6">
                                                <label>Date Of Birth</label>
                                                <input class="multisteps-form__input form-control" max="<%=java.time.LocalDate.now()%>" type="date" name="date_of_birth" value="${InfoU.getDate_of_birth()}"/>
                                            </div>
                                            <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                <div class="form-group">
                                                    <label for="gender">Gender</label>
                                                    <select class="form-control" id="gender" name="gender" >
                                                        <option value="Male" ${InfoU.getGender() == 1 ? 'selected' : ''}>Nam</option>
                                                        <option value="Female" ${InfoU.getGender() == 0 ? 'selected' : ''}>Nữ</option>
                                                    </select>
                                                </div>                                                                                                  
                                            </div>
                                        </div>
                                        <div class="form-row mt-4">
                                            <div class="col-12 col-sm-6">
                                                <label>Email</label>
                                                <input class="multisteps-form__input form-control" name="email" value="${InfoU.getEmail()}" type="email" placeholder="Email" readonly/>
                                            </div>
                                            <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                <label>Address</label>
                                                <input class="multisteps-form__input form-control" type="text" placeholder="Address" name="address" value="${InfoU.getAddress()}" required=""/>
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
                                                <input class="multisteps-form__input form-control" type="text" placeholder="Your Profession" name="profession" required=""/>
                                            </div>
                                        </div>
                                        <div class="form-row mt-4">
                                            <label>Profession Introduction</label>
                                            <textarea class="multisteps-form__textarea form-control" placeholder="Service Description"
                                                      rows="4" name="profession_intro" style="resize: none;" required=""></textarea>
                                        </div>

                                        <h3 class="multisteps-form__title" style="margin-top: 50px;"><b>Archivement</b></h3>
                                        <h4 style="content: '';
                                            background-color: #175E4C; width: 260px; height: 4px; margin-bottom: 50px;"></h4>
                                        <div class="form-row mt-4">
                                            <div class="col">
                                                <label>Your Archivement</label>
                                                <input class="multisteps-form__input form-control" type="text" placeholder="Your Profession" name="archivement" required=""/>
                                            </div>
                                        </div>
                                        <div class="form-row mt-4">
                                            <label>Archivement Descition</label>
                                            <textarea class="multisteps-form__textarea form-control" placeholder="Service Description"
                                                      rows="4" name="archivement_des" style="resize: none;" required=""></textarea>
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

                                        return true; // Cho phép người dùng gửi biểu mẫu nếu có ít nhất một checkbox được chọn.
                                    }
                                </script>

                                <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                                    <h3 class="multisteps-form__title"><b>Service Description</b></h3>
                                    <h4 style="content: '';
                                        background-color: #175E4C; width: 260px; height: 4px; margin-bottom: 50px;"></h4>
                                    <div class="form-row mt-4">
                                        <label>Your Description</label>
                                        <textarea class="multisteps-form__textarea form-control" name="service_des" placeholder="Service Description"
                                                  rows="4" style="resize: none;" required=""></textarea>
                                    </div>

                                    <h3 class="multisteps-form__title" style="margin-top: 50px;"><b>The programming</b></h3>
                                    <h4 style="content: '';
                                        background-color: #175E4C; width: 260px; height: 4px; margin-bottom: 50px;"></h4>
                                    <div class="form-row mt-4">
                                        <label>The programming (Framework) you can training for the Mentee.</label>
                                        <textarea class="multisteps-form__textarea form-control" name="programming" placeholder="Service Description"
                                                  rows="4" style="resize: none;" required=""></textarea>
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
