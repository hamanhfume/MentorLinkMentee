<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : home
    Created on : Jun 11, 2023, 1:00:46 PM
    Author     : lamNB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="temp/logo2.png">
        <link rel="stylesheet" href="assets/popup.css"/>
        <link rel="stylesheet" href="temp/home1.css">
        <!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>MentorLink</title>
        <jsp:useBean id="sk" class="dao.SkillDAO" scope = "request"></jsp:useBean>
    </head>

    <body>
        <jsp:include page="../home/header.jsp"/>
        <div id="wrapper"> <!--header-->      
            <!--end header-->
            <section class="slider">
                <video width="100%" height="auto" autoplay="autoplay" loop="" muted="" poster="temp/cover.jpg">
                    <source src="temp/background.mp4" type="video/mp4">
                </video>

                <div class="slider_content">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <h1 style="color: #fff;">MentorLink - Nền tảng Kết nối Cố vấn và Học cùng Chuyên gia </h1>
                            <p style="color: #fff; font-size: 18px;">Với sứ mệnh là nâng cao chất lượng nguồn nhân lực, giúp
                                thanh niên Việt Nam định vị nghề nghiệp và tạo cơ hội phát triển</p>
                            <div class="row">
                                <div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <section id="content" style="margin-bottom: 0px;">
            <div class="content-wrap nopadding">
                <section class="container-md">
                    <div class="mobile-none">
                        <img src="temp/3stepmentoring.jpeg" class="w-100">
                    </div>
                    <div class="desktop-none">
                        <img src="temp/3stepmobile.jpeg" class="w-100">
                    </div>
                </section>
                <div class="mentor_team mt-5 pt-5">
                    <div class="container-md">
                        <div class="">
                            <h2 class="text-uppercase text-center main-color bolder-weight">Outstanding Mentor</h2>
                        </div>
                        <div class="row">
                            <c:forEach var="p" items="${listT}">

                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 mb-3 mt-3">
                                    <div class="mentor_item mentor_item_custom wow fadeInUp">
                                        <a href="viewcv?mentor_id=${p.mentor_id}">
                                            <div class="mentor_avatar">
                                                <img src="assets/upload/${p.getInfor().getAvatar()}" alt="${p.getInfor().getFull_name()}">
                                            </div>
                                            <div class="mentor_info">
                                                <div style="min-height: 100px;">
                                                            <div class="name">${p.getInfor().getFull_name()} </div>
                                                            <div class="">
                                                                <span class="jobs">
                                                                    ${p.profession} <span
                                                                        class="field"></span> </span>
                                                            </div>
                                                                    <c:forEach var="i" items="${sk.getSkillByMentor_id(p.mentor_id)}">
                                                                        <span><b>${i},</b></span>
                                                                    </c:forEach>           
                                                        </div>
                                                <div class="row mt-1">
                                                    <div class="user-rate col-6">
                                                        <div class="wrap-star">
                                                            <img src="temp/ic-mentee.png"
                                                                 style="width: auto; height: 18px; margin-bottom: 2px;"
                                                                 data-toggle="tooltip" data-placement="bottom" title=""
                                                                 data-original-title="Số Mentee"> ${p.numberRequest} <span class="wrap-number">
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="user-favorite col-6">
                                                        <div class="wrap-star">                                                    
                                                            <span class="wrap-number" style="padding-bottom: 2px;"></span>
                                                        </div>
                                                        <div></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="mentor_item_info_box1">
                                            <a href="#" class="mentor_item_info_box_ref"
                                               title="${p.getInfor().getFull_name()}">
                                                <div class="span_title"><span>Giới thiệu bản thân</span>
                                                </div>
                                                <div class="line"></div>
                                                <p>${p.profession_introduction}</p>
                                                <span class="span_title">Chủ đề MentorLink</span>
                                                <div class="line"></div>
                                                <p><i class="fa fa-circle" style="font-size: 11px !important;"
                                                      aria-hidden="true"></i>
                                                    <strong>Service description: </strong>${p.service_description}
                                                </p>
                                                <p><i class="fa fa-circle" style="font-size: 11px !important;"
                                                      aria-hidden="true"></i>
                                                    <strong>Achievements: </strong>${p.achievements}
                                                </p>
                                                <div class="line line2"></div>
                                                <div class="text-center">
                                                    <a href="viewcv?mentor_id=${p.mentor_id}">
                                                        <span class="mentor_detail_link notopmargin mb-1">View details</span>
                                                    </a>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>    
                        </div>
                        <div class="home_title mentor_team_title text-center mt-3">
                            <a href="viewListMentor">
                                <button class="btn btn-info btn_search">See more</button>
                            </a>
                        </div>
                    </div>
                </div>


                <section class="pb-5 pt-5" style="background-color: #eee;">
                    <div class="container">
                        <div>
                            <div>
                                <h4 class="primary-color mb-2">The good language for beginner </h4>

                            </div>
                            <div class="row">
                                <c:forEach var="s" items="${listS}">

                                    <div class="col-md-4 col-sm-12 mb-4">
                                        <div class="p-3"
                                            style="background-color: #fff; border-radius: 20px; min-height: 370px;">
                                            <a href="searchBySkillid?skill_id=${s.skill_id}" target="_blank">
                                                <img src="${s.skill_img}" class="w-100 image_fade">
                                                <div class="row" style="padding-left: 8px; ">

                                                </div>
                                                <h4 class="t600 mb-3 mt-3">${s.skill_name}</h4>
                                            </a>
                                            <p class="mb-3 course-desciption" style="color: #949BA1">Especially for beginners who are passionate about programming.</p>

                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                        <!-- specification courses-->
                    </div>
                </section>
            </div>
        </section>

        <!-- footer -->
        <div id="popup-btn-rq-statistic" class="popup-btn-rq-statistic">
            <div class="check-modal">
                <h1>List statistic request</h1>
                <button data-close-button class="popup-close-btn">
                    <i class="fa-solid fa-x"></i>
                </button>
            </div>
            <div class="sum-of-requests">
                <h5>The total number of request given you: ${object.getNumTotalRequests()}  request</h5>
                <h5>The number of accept request: ${object.getNumAcceptedRequests()} request </h5>   
                <h5>The number of cancel request: ${object.getNumCanceledRequests()} request </h5>
                <h5>Percentage of accept request: ${object.getCancelPercentage()} </h5>
                <h5>Percentage of cancel request: ${object.getCompletedPercentage()} </h5>
                <table class="table">
                    <th>List request for you</th>
                    <tr>
                        <th>STT</th>
                        <th>Mentee Name</th>
                        <th>Title</th>
                        <th>Request Content</th>
                        <th>Created Date</th>
                        <th>Finish Date</th>
                        <th>Request Status</th>
                    </tr>
                    <c:forEach var="o" items="${listR}">

                        <tr>
                            <td>${o.getStt()}</td>
                            <td>${o.getMenteeName()}</td>
                            <td>${o.getTitle()}</td>
                            <td>${o.getRequestContent()}</td>
                            <td>${o.getCreatedDate()}</td>	
                            <td>${o.getFinishDate()}</td>
                            <td>${o.getRequestStatus()}</td>
                        </tr>
                    </c:forEach>

                </table>
                <h4> The rank average star of you : ${top} </h4>

                <table class="table">
                    <th>List Top Rank Average Star for Mentor</th>
                    <tr>
                        <th>TOP</th>
                        <th>Mentor Name</th>
                        <th>Average Start</th>
                    </tr>

                    <c:forEach var="r" items="${listRS}">
                        <tr>
                            <td>${r.getRank()}</td>
                            <td>${r.getFullName()}</td>
                            <td>${r.getAverageRating()}</td>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
        <div id="overlay"></div>
        <jsp:include page="../home/footer.jsp"/>
    </body>
    <script src="temp/home.js"></script>
    <script src="assets/js/popup1.js"></script>

</html>
