<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : viewCvMentor
    Created on : Jun 11, 2023, 2:00:26 PM
    Author     : Tuan Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">

    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />

    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" /> 

        <link
            href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Roboto:300,300i,400,400i,500,500i,600,600i&amp;subset=vietnamese"
            rel="stylesheet">


        <!--<link rel="stylesheet" href="https://cdn.usebootstrap.com/bootstrap/4.2.1/css/bootstrap.min.css">-->

        <link rel="stylesheet" href="assets/style.min.css" type="text/css" />

        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->

        <!--<link rel="stylesheet" href="assets/css/font-icons.css" type="text/css" />-->
        <link rel="icon" href="temp/logo2.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <link rel="stylesheet" href="assets/css/responsive.css" type="text/css" />

        <link rel="stylesheet" href="assets/css/custom.min.css" type="text/css" />

        <link rel="stylesheet" href="assets/css/overrideb6f5.css?v=10" type="text/css" />

        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="assets/css/ratecomment.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>


        <title>${cv.getInfor().getFull_name()}</title>

    </head>

    <body class="stretched side-push-panel no-transition">
        <jsp:include page="../home/header.jsp"/>
        <div id="wrapper" class="clearfix header_white">
            <a id="button" class="show"></a>

            <section id="content">

                <div class="mentor_profile_page">
                    <div class="container clearfix">
                        <div class="row">
                            <div class="col-md-9">
                                <!-- <div class="desktop-none mb-3">
                                    <a id="go-app" href="https://apps.apple.com/vn/app/mentori/id1503372381">
                                        <img src="../assets/images/app/downapp.png">
                                    </a>
                                </div> -->
                                <div class="mentor_profile_left_sidebar profile-user-custom">
                                    <div class="mentor_top boder_shadow profile-user-custom-header">
                                        <img class="bg-bot-profile" src="assets/images/bg-bot-profile.png" alt="#">
                                        <div class="profile-wrap-cover">
                                            <div class="profile-banner"
                                                 style="background: url(assets/images/image_profile.png) no-repeat center center; background-size: cover;">
                                            </div>
                                            <div class="wrap-content">
                                                <div class="wrap-profile-user-name">
                                                    <div class="wrap-user-name row">
                                                        <div class="col-xs-12 col-md-7">
                                                            <h3 class="profile-user-name  active">${cv.getInfor().getFull_name()}</h3>
                                                        </div>
                                                        <div class="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <p class="header-job-title">@${cv.getInfor().getUsername()}</p>
                                            </div>
                                            <div class="wrap-profile-avatar">
                                                <div class="profile_avatar_other profile_avatar img-circle">
                                                    <!-- Cho phep nguoi dung xem anh chi tiet khi click vao -->
                                                    <a href="#" data-lightbox="avatar-1">
                                                        <img src="assets/upload/${cv.getInfor().getAvatar()}"
                                                             onerror="this.onerror=null; this.src='../assets/images/avatar.jpg'">
                                                    </a>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="user-mentee">
                                                            <img src="assets/images/ic-mentee.png"
                                                                 style="width: auto; height: 18px; margin-bottom: 2px;"
                                                                 data-toggle="tooltip" data-placement="bottom" title=""
                                                                 data-original-title="Số Mentee" /><span>17 mentee</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="user-hour">
                                                            <img src="assets/images/hour.png"
                                                                 style="width: auto; height: 18px; margin-bottom: 2px;"
                                                                 data-toggle="tooltip" data-placement="bottom" title=""
                                                                 data-original-title="Tổng số giờ cố vấn" />
                                                            <span>18 h</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="user-rate">
                                                            <div class="wrap-star">
                                                                <img src="assets/images/rating.png"
                                                                     style="width: auto; height: 18px; margin-bottom: 2px;"
                                                                     data-toggle="tooltip" data-placement="bottom" title=""
                                                                     data-original-title="Đánh giá" />
                                                                <span class="wrap-number">5.0/5</span>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="user-favorite" style="left: -10px;">

                                                            <img src="assets/images/followed.png"
                                                                 style="width: auto; height: 18px;" data-toggle="tooltip"
                                                                 data-placement="bottom" title=""
                                                                 data-original-title="Số người Theo dõi" />
                                                            <span style="margin-left: 0px;">175</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="profile-action">
                                            <div class="profile_btn box-group box-group-custom" id="connect_mentor_pair">
                                                <div class="box-group-custom-top">
                                                    <c:if test="${sessionScope.acc == null}"> 
                                                        <a href="login"><button id="show-login" type="button" class="btn btn-info btn-box-top-lg"
                                                                                                               style="background-color: #175E4C; color: #fff; margin-top: 20px;">Create Request</button></a>
                                                        </c:if>
                                                    <c:if test="${sessionScope.acc.role == 1}"> 
                                                        <a href="requestMentor?mentor_id=${mentor_id}"><button id="show-login" type="button" class="btn btn-info btn-box-top-lg"
                                                                                                               style="background-color: #175E4C; color: #fff; margin-top: 20px;">Create Request</button></a>
                                                        </c:if>
                                                        <c:if test="${sessionScope.acc.role == 2 && sessionScope.acc.user_id == mentor_id}"> 
                                                        <a href="updatecv"><button id="show-login" type="button" class="btn btn-info btn-box-top-lg"
                                                                                   style="background-color: #175E4C; color: #fff; margin-top: 20px;">Update CV</button></a>
                                                        </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tabs tabs-bb clearfix tabs-mentoring" id="tab-12">
                                        <ul class="tab-nav clearfix"
                                            style="float: left; display: flex; overflow-x: auto; white-space: nowrap; max-width: 100%;">
                                            <li class="first_tab">
                                                <a href="#profile" role="tab" data-toggle="tab_profile"
                                                   data-get="profile">CV Profile</a>
                                            </li>
                                            <li class="first_tab">
                                                <a href="#review" role="tab" data-toggle="tab_profile"
                                                   data-get="review">Feedback</a>
                                            </li>
                                        </ul>
                                        <div class="tab-container mt-4" style="clear: both;">
                                            <div class="tab-content clearfix" id="profile">
                                                <div class="mentor_intro boder_shadow profile-user-custom-body">
                                                    <!-- <div class="mentor_section mentor_intro_text" style="background-color: #175E4C; border-radius: 20px;">
                                                        <div class="intro_section_title">
                                                            <h4 style="color: white">Giới thiệu bản thân</h4>
                                                        </div>                   
                                                    </div> -->
                                                    <!--<div class="line"></div>-->
                                                    <div class="mentor_section mentor_intro_text">
                                                        <div class="intro_section_title">
                                                            <h4>SELF INTRODUCTION</h4>
                                                        </div>
                                                        <p></p>
                                                    </div>
                                                    <div class="line"></div>
                                                    <div class="mentor_section mentor_exp">
                                                        <div class="intro_section_title">
                                                            <h4>PROFESSION</h4>
                                                        </div>
                                                        <ul>
                                                            <li class="clearfix">
                                                                <span id="exp-9074" class="anchor"></span>
                                                                <div class="exp-9074 div_result">
                                                                    <div class="img">
                                                                        <img src="assets/images/logo2.png"
                                                                             alt="favicon_icon">
                                                                    </div>
                                                                    <div class="text">
                                                                        <p class="item_title">${cv.getProfession()}</p>
                                                                        <p class="company_name">${cv.getProfession_introduction()}</p>
                                                                        <p class="achievements"></p>
                                                                    </div>
                                                                    <div class="date">
                                                                        <span class="start_time">05/2022</span>
                                                                        <span> - </span>
                                                                        <span class="end_time">Hiện tại</span>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="mentor_section mentor_exp mentor_edu">
                                                        <div class="intro_section_title">
                                                            <h4>ARCHIVEMENT</h4>
                                                        </div>
                                                        <ul>
                                                            <li class="clearfix">
                                                                <span id="edu-1919" class="anchor"></span>
                                                                <div class="edu-1919 div_result">
                                                                    <div class="img">
                                                                        <img src="assets/images/logo2.png"
                                                                             alt="favicon_icon">
                                                                    </div>
                                                                    <div class="text">
                                                                        <!--<p class="item_title">RMIT University</p>-->
                                                                        <p class="name">${cv.getAchievements()}</p>
                                                                        <p class="score">${cv.getAchievements_des()}</p>
                                                                    </div>
                                                                    <div class="date">
                                                                        <span class="start_time"> 10/2021</span>
                                                                        <span> - </span>
                                                                        <span class="end_time">06/2022</span>
                                                                    </div>
                                                                </div>
                                                            </li>                                                            
                                                        </ul>
                                                    </div>
                                                    <div class="mentor_section mentor_exp">
                                                        <div class="intro_section_title">
                                                            <h4>FRAMEWORK</h4>
                                                        </div>
                                                        <ul>
                                                            <li class="clearfix">
                                                                <span id="activity-850" class="anchor"></span>
                                                                <div class="activity-850 div_result">
                                                                    <div class="img">
                                                                        <img src="assets/images/logo2.png"
                                                                             alt="">
                                                                    </div>
                                                                    <div class="text">
                                                                        <p class="name">${cv.getLanguage()}</p>                                                                       
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="mentor_section mentor_awards">
                                                        <div class="intro_section_title">
                                                            <h4>SERVICE</h4>
                                                        </div>
                                                        <ul>
                                                            <li class="clearfix">
                                                                <span id="award-870" class="anchor"></span>
                                                                <div class="award-870 div_result">
                                                                    <div class="text">
                                                                        <!--                                                                        <p class="item_title">Dean's Scholarship 2012</p>-->
                                                                        <p class="">${cv.getService_description()}</p>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>                                                    
                                                </div>
                                            </div>
                                            <div class="tab-content clearfix" id="tab_profile_pending">
                                            </div>


                                            <div class="tab-content clearfix" id="review">
                                                <!-- Danh gia o day -->

                                                <div class="pb-4 pt-4 pl-3 pr-3">
                                                    <div class="row">
                                                        <div class="wrapper1  row">
                                                            <h3>Mentor's Skills</h3> 
                                                            <c:forEach var="f" items="${listFS}">
                                                                <div class="col-6" style="margin-bottom: 20px">
                                                                    <h5 style="display: inline">${f.getSkill().getSkill_name()}: ${f.getStar_rate_skill()}/5</h5>                                                          
                                                                    <i class="fa fa-star yellow-star" style="font-size: 22px"></i>
                                                                </div>
                                                            </c:forEach>



                                                        </div>

                                                    </div>
                                                </div>


                                                <div style="text-align: center; background: #175E4C; border-radius: 8px;">
                                                    <h3 style="color: white">Feedback From Mentee</h3>
                                                </div>
                                                <div style="border-top: 0.3px solid #E9E9E9;" class=""></div>
                                                <c:forEach var="i" items="${listF}">
                                                    <div class="pb-4 pt-4 pl-3 pr-3">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <p class="mb-3 t600">${i.getCreate_date()}</p>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <p class="mb-3" style="white-space: pre-line;">${i.getFeedback_comment()}</p>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-3 pl-0 pr-0">
                                                                <div class="appointment-mentor">
                                                                    <!--<p class="mb-0 ml-3"
                                                                     style="line-height: 30px; font-style: italic;">Đánh giá
                                                                     từ Mentee</p>-->
                                                                    <div class="mb-0 ml-3">
                                                                        <!--                                                                        <div class="stars" style="color: #175E4C;">
                                                                                                                                                    <i class="fas fa-star"></i>
                                                                                                                                                    <i class="fas fa-star"></i>
                                                                                                                                                    <i class="far fa-star"></i>
                                                                                                                                                    <i class="far fa-star"></i>
                                                                                                                                                    <i class="far fa-star"></i>
                                                                            i.getRate_start()                                                                    </div>-->
                                                                        <c:choose>
                                                                            <c:when test="${i.getRate_start() > 0}">
                                                                                <c:set var="yellowStars" value="${i.getRate_start()}" />
                                                                                <c:set var="greyStars" value="${5 - i.getRate_start()}" />
                                                                                <c:forEach begin="1" end="${yellowStars}">
                                                                                    <i class="fa fa-star yellow-star"></i>
                                                                                </c:forEach>
                                                                                <c:forEach begin="1" end="${greyStars}">
                                                                                    <i class="fa fa-star grey-star"></i>
                                                                                </c:forEach>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <c:forEach begin="1" end="5">
                                                                                    <i class="fa fa-star grey-star"></i>
                                                                                </c:forEach>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                    <style>
                                                                        .yellow-star {
                                                                            color: yellow;
                                                                        }
                                                                        .grey-star {
                                                                            color: grey;
                                                                        }
                                                                    </style>
                                                                </div>
                                                            </div>
                                                            <div class="col-2 pl-0 pr-0 tright">
                                                                <a class="info-review">
                                                                    <img class="avt-review"
                                                                         src="assets/upload/${i.getInfor().getAvatar()}"
                                                                         onerror="this.onerror=null; this.src='../assets/images/avatar.jpg'">
                                                                </a>
                                                            </div>
                                                            <div class="col-7">
                                                                <a class="info-review" href="#">${i.getInfor().getFull_name()}</a>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div style="border-top: 0.3px solid #E9E9E9;" class=""></div>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mentor_profile_right_sidebar">
                                    <div class="mb-4">
                                        <div id="carouselOrientation3" class="carousel slide" data-ride="carousel">
                                            <ol class="carousel-indicators mb-0" style="width: 25%; margin: auto;">
                                                <li data-target="#carouselOrientation3" style="background-color: #333;"
                                                    data-slide-to="0" class="active"></li>


                                            </ol>
                                            <div class="carousel-inner">

                                                <div class="carousel-item active">

                                                    <img src="assets/images/banner_right.jpg" width="100%">
                                                    <div style="height: 30px">
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <h4 class="mb-4 pl-0" style="font-size: 16px; font-weight: bold;">Maybe you are interested
                                    </h4>
                                    <c:forEach var="i" begin="1" end="5">
                                        <div class="mentor_right_item pb-3">
                                            <a class="user_avatar_name" href="viewcv?mentor_id=${listMentor.get(i).getMentor_id()}">
                                                <div class="row">
                                                    <div class="col-3 pr-1">
                                                        <div class="mentor_page" style="margin-top: 0px;">
                                                            <div class="container">
                                                                <div class="mentor_list">


                                                                    <div class="mentor_item wow fadeInUp" data-wow-duration="1s"
                                                                         data-wow-delay="0.3s" data-id="523866403"
                                                                         style="margin-bottom: 0px; height: auto;">

                                                                        <div class="">
                                                                            <img onerror="this.onerror=null; this.src='../assets/images/avatar.jpg'"
                                                                                 src="assets/upload/${listMentor.get(i).getInfor().getAvatar()}"                                                                                
                                                                                 class="img-circle avatar_header" width="50"
                                                                                 height="50">
                                                                        </div>

                                                                        <!--                                                                        <div class="mentor_item_info_box mentor_item_info_box_523866403"
                                                                                                                                                     style="display: none; width: 300px;">
                                                                                                                                                    <div class="span_title"><span>Giới thiệu bản
                                                                                                                                                            thân</span>
                                                                                                                                                    </div>
                                                                                                                                                    <div class="line"></div>
                                                                                                                                                    <p>Assistant Brand Manager at Unilever</p>
                                                                                                                                                    <span class="span_title">Chủ đề Mentoring</span>
                                                                                                                                                    <div class="line"></div>
                                                                                                                                                    <p><i class="fa fa-circle"
                                                                                                                                                          style="font-size: 11px !important;"
                                                                                                                                                          aria-hidden="true"></i>
                                                                                                                                                        <strong>Định hướng và chia sẻ kinh nghiệm nghề
                                                                                                                                                            nghiệp: </strong>Assistant Brand Manager tại
                                                                                                                                                        Unilever
                                                                                                                                                    </p>
                                                                                                                                                    <div class="line line2"></div>
                                                                                                                                                    <div class="text-center">
                                                                                                                                                        <span
                                                                                                                                                            class="mentor_detail_link notopmargin mb-1">Xem
                                                                                                                                                            chi tiết</span>
                                                                                                                                                    </div>
                                                                                                                                                </div>-->
                                                                    </div>


                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-9 pl-0">
                                                        <p class="mb-0 t600">${listMentor.get(i).getInfor().getFull_name()}</p>
                                                        <div class="">
                                                            <span class="jobs" style="color: #949BA1">
                                                                ${listMentor.get(i).getProfession()}
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </c:forEach>                                                                       
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal" id="modalShowReviewsFields" tabindex='-1'>
                    <div class="modal-dialog" style="margin-top: 150px">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body">
                                <div id="box-reviews-modal">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

        </div>
        <style>
            #myCarouselTopic .carousel-item .img-fluid h4 {
                min-height: 60px;
            }

            #myCarouselTopic .img-fluid.mx-auto.d-block {
                background-color: white;
                padding: 10px;
                border-radius: 10px;
            }

            #myCarouselTopic .img-fluid {
                box-shadow: 0px 0px 10px 2px #888888;
                padding: 30px;
                border-radius: 30px;
                /* margin-left: 20px;
            margin-right: 20px; */
            }

            /* @media (min-width: 768px) and (max-width: 991px) { */

            /* Show 3rd slide on md  if col-md-4*/

            #myCarouselTopic .carousel-inner .active.col-sm-6.carousel-item+.carousel-item+.carousel-item {
                position: absolute;
                top: 0;
                right: -50%;
                /*change this with javascript in the future*/
                z-index: -1;
                display: block;
                visibility: visible;
            }

            /* } */

            @media (min-width: 576px) and (max-width: 768px) {

                /* Show 2 slide on md  if col-md-4*/
                #myCarouselTopic .carousel-inner .active.col-sm-6.carousel-item+.carousel-item+.carousel-item {
                    position: absolute;
                    top: 0;
                    right: -50%;
                    /*change this with javascript in the future*/
                    z-index: -1;
                    display: block;
                    visibility: visible;
                }

            }

            .info-review {
                font-size: 18px;
                color: #333333;
                /* margin-left: 4px; */
            }

            .avt-review {
                width: 36px;
                height: 36px;
                -o-object-fit: cover;
                object-fit: cover;
                -o-object-position: center;
                object-position: center;
                border: 1px solid #DDDDDD;
                border-radius: 50%;
            }

            .item-r .ratting_star i.active {
                color: #FFCC00;
            }

            .note_r.shorten .seemore {
                color: #0e76a8;
                cursor: pointer;
            }

            .note_r.shorten .shorten_content_full {
                color: #0e76a8;
                cursor: pointer;
            }

            .note_r.shorten {
                text-align: justify;
                font-style: italic;
                color: #444;
                margin-top: 15px;
            }

            .container-fluid {
                background-color: #175E4C;
                padding-bottom: 35px;
            }

            .home-review-title h2,
            .home-review-title p {
                color: white;
                margin-left: 100px;
            }

            .home-review-title h2 {
                padding-top: 30px;
            }

            #myCarousel .img-fluid.mx-auto.d-block {
                background-color: white;
                padding: 10px;
                border-radius: 10px;
            }

            #myCarousel .img-fluid {
                box-shadow: 0px 0px 10px 2px #888888;
                padding: 30px;
                border-radius: 30px;
                /* margin-left: 20px;
            margin-right: 20px; */
            }

            /* @media (min-width: 768px) and (max-width: 991px) { */

            /* Show 3rd slide on md  if col-md-4*/
            #myCarousel .carousel-inner .active.col-md-4.carousel-item+.carousel-item+.carousel-item+.carousel-item {
                position: absolute;
                top: 0;
                right: -33.3333%;
                /*change this with javascript in the future*/
                z-index: -1;
                display: block;
                visibility: visible;
            }

            /* } */

            @media (min-width: 576px) and (max-width: 768px) {

                /* Show 2 slide on md  if col-md-4*/
                #myCarousel .carousel-inner .active.col-sm-6.carousel-item+.carousel-item+.carousel-item {
                    position: absolute;
                    top: 0;
                    right: -50%;
                    /*change this with javascript in the future*/
                    z-index: -1;
                    display: block;
                    visibility: visible;
                }

            }

            @media (min-width: 576px) {
                #myCarousel .carousel-item {
                    margin-right: 0;
                }

                #myCarouselTopic .carousel-item {
                    margin-right: 0;
                }

                /* show 2 items */
                #myCarousel .carousel-inner .active+.carousel-item {
                    display: block;
                }

                #myCarouselTopic .carousel-inner .active+.carousel-item {
                    display: block;
                }

                /* #myCarouselBanner .carousel-inner .active+.carousel-item {
                display: none;
            } */

                #myCarousel .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left),
                #myCarousel .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left)+.carousel-item {
                    transition: none;
                }

                #myCarouselTopic .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left),
                #myCarouselTopic .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left)+.carousel-item {
                    transition: none;
                }

                #myCarouselTopic .carousel-inner .carousel-item-next {
                    position: relative;
                    transform: translate3d(0, 0, 0);
                }

                #myCarousel .carousel-inner .carousel-item-next {
                    position: relative;
                    transform: translate3d(0, 0, 0);
                }


                #myCarouselTopic .active.carousel-item-left+.carousel-item-next.carousel-item-left,
                #myCarouselTopic .carousel-item-next.carousel-item-left+.carousel-item,
                #myCarouselTopic .carousel-item-next.carousel-item-left+.carousel-item+.carousel-item {
                    position: relative;
                    transform: translate3d(-100%, 0, 0);
                    visibility: visible;
                }

                #myCarousel .active.carousel-item-left+.carousel-item-next.carousel-item-left,
                #myCarousel .carousel-item-next.carousel-item-left+.carousel-item,
                #myCarousel .carousel-item-next.carousel-item-left+.carousel-item+.carousel-item {
                    position: relative;
                    transform: translate3d(-100%, 0, 0);
                    visibility: visible;
                }

                /* farthest right hidden item must be abso position for animations */
                #myCarouselTopic .carousel-inner .carousel-item-prev.carousel-item-right {
                    position: absolute;
                    top: 0;
                    left: 0;
                    z-index: -1;
                    display: block;
                    visibility: visible;
                }

                #myCarousel .carousel-inner .carousel-item-prev.carousel-item-right {
                    position: absolute;
                    top: 0;
                    left: 0;
                    z-index: -1;
                    display: block;
                    visibility: visible;
                }

                /* right or prev direction */
                #myCarouselTopic .active.carousel-item-right+.carousel-item-prev.carousel-item-right,
                #myCarouselTopic .carousel-item-prev.carousel-item-right+.carousel-item,
                #myCarouselTopic .carousel-item-prev.carousel-item-right+.carousel-item+.carousel-item {
                    position: relative;
                    transform: translate3d(100%, 0, 0);
                    display: block;
                    visibility: visible;
                }

                #myCarousel .active.carousel-item-right+.carousel-item-prev.carousel-item-right,
                #myCarousel .carousel-item-prev.carousel-item-right+.carousel-item,
                #myCarousel .carousel-item-prev.carousel-item-right+.carousel-item+.carousel-item {
                    position: relative;
                    transform: translate3d(100%, 0, 0);
                    display: block;
                    visibility: visible;
                }

            }

            @media (max-width: 768px) {
                .mobile-none {
                    display: none;
                }
            }

            /*MD*/
            @media (min-width: 768px) {
                .desktop-none {
                    display: none;
                }

                /* show 3rd of 3 item slide */
                .carousel-inner .active+.carousel-item+.carousel-item {
                    display: block;
                }

                .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left)+.carousel-item+.carousel-item {
                    transition: none;
                }

                #myCarousel .carousel-control-next {
                    right: -70px !important;
                }

                #myCarousel .carousel-control-prev {
                    left: -70px !important;
                }

                .carousel-inner .carousel-item-next {
                    position: relative;
                    transform: translate3d(0, 0, 0);
                }

                #myCarouselTopic .carousel-control-next {
                    right: -70px !important;
                }

                #myCarouselTopic .carousel-control-prev {
                    left: -70px !important;
                }

                /* left or forward direction */
                .carousel-item-next.carousel-item-left+.carousel-item+.carousel-item+.carousel-item {
                    position: relative;
                    transform: translate3d(-100%, 0, 0);
                    visibility: visible;
                }

                /* right or prev direction */
                .carousel-item-prev.carousel-item-right+.carousel-item+.carousel-item+.carousel-item {
                    position: relative;
                    transform: translate3d(100%, 0, 0);
                    visibility: visible;
                    display: block;
                    visibility: visible;
                }

            }


            /*LG 6th*/
            @media (min-width: 991px) {

                /* show 4th item */
                .carousel-inner .active+.carousel-item+.carousel-item+.carousel-item {
                    display: block;
                }

                #myCarouselTopic .carousel-inner .active+.carousel-item+.carousel-item+.carousel-item {
                    display: none;
                }

                .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left)+.carousel-item+.carousel-item+.carousel-item {
                    transition: none;
                }




                /* right or prev direction //t - previous slide direction last item animation fix */
                .carousel-item-prev.carousel-item-right+.carousel-item+.carousel-item+.carousel-item+.carousel-item {
                    position: relative;
                    transform: translate3d(100%, 0, 0);
                    visibility: visible;
                    display: block;
                    visibility: visible;
                }

            }

            .mentor_profile_page .mentor_profile_right_sidebar .mentor_right_item p {
                color: #333333 !important;
                font-size: 14px !important;
            }
        </style>

    </div>
</section>

</div>
<!--class="icon-angle-up"-->
<!--<div id="gotoTop" ><i class="fa-light fa-chevron-up"></i></div>-->


<!--<script src="assets/js/plugins.js"></script>-->


<!-- Hover : co the ban biet -->
<!--<script src="assets/js/headere5bf.js?v=12"></script>-->
<!-- Hover : co the ban biet -->
<!--<script src="assets/js/star-rating.js"></script>-->
<!-- Hien thi review -->
<script src="assets/js/functions.js"></script>

<jsp:include page="../home/footer.jsp"/>
</body>

</html>
