<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : viewListMentor
    Created on : Jun 11, 2023, 6:18:19 PM
    Author     : Tuan Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">

    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />

    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="icon" href="temp/logo2.png">
        <link
            href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Roboto:300,300i,400,400i,500,500i,700,700i&amp;subset=vietnamese"
            rel="stylesheet">
        <!--        <link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css" />-->
        <link rel="stylesheet" href="https://cdn.usebootstrap.com/bootstrap/4.2.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/style.min.css" type="text/css" />

        <!--<link rel="stylesheet" href="assets/css/font-icons.css" type="text/css" />-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/select2.min.css" type="text/css" />
        <link rel="stylesheet" href="assets/css/responsive.css" type="text/css" />

        <!--<link rel="stylesheet" href="assets/bower_components/font-awesome/css/font-awesome.min.css" type="text/css" />-->
        <link rel="stylesheet" href="assets/css/custom.min.css" type="text/css" />
        <link rel="stylesheet" href="assets/css/overrideb6f5.css?v=10" type="text/css" />


        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--    <script src="assets/js/jquery.js"></script>-->
        <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="temp/home.css">

        <title>List Mentor</title>


        <jsp:useBean id="sk" class="dao.SkillDAO" scope = "request"></jsp:useBean>
    </head>

    <body class="stretched side-push-panel no-transition mentor">
        <jsp:include page="../home/header.jsp"/>
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-W43R7XH" height="0" width="0"
                          style="display:none;visibility:hidden"></iframe></noscript>


        <div id="wrapper" class="clearfix header_white">
            <a id="button" class="show"></a>


            <form id="formSearchMentor" action="search" method="get">
                <div class="search_mentor"
                     style="background: url(assets/images/banner_cover.png) center center no-repeat; background-size: cover; height: 300px;">
                    <div class="header_overlay"></div>
                    <div class="container clearfix">
                        <div class="search_box_mentor page_search_mentor">
                            <div class="tleft mb-3 pl-4">
                                <h3 class="title mb-0">Cộng đồng Mentor Link</h3>
                                <p class="white-color mb-2 mt-2">Tiến nhanh và xa hơn trong hành trình sự nghiệp cùng
                                    Mentor Link Việt Nam</p>
                            </div>

                            <div class="form-inline row" style="width:100%;">
                                <div class="row col-12">
                                    <div class="mb_10 col-sm-12 col-md-6">
                                        <input type="text" name="keyword" style="width: 100%" value="" class="form-control"
                                               placeholder="Search Mentor by name">
                                    </div>


                                    <div class="select-search-box-multiple col-sm-12 col-md-3 mb_10">
                                        <select style="width: 100%;" name="skill_id" id="fields_id" "
                                                data-placeholder="Choose skill">
                                                <option value="0" > All Skill</option>
                                            <c:forEach var="s" items="${listS}">
                                                <option value="${s.skill_id}">${s.skill_name}</option>
                                            </c:forEach>

                                        </select>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <button type="submit" class="btn btn-info btn_search text-uppercase mb_10 ml-5">
                                            <i class="icon icon-search"></i>
                                            <span class="btn_search_text">Find mentor</span>
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="container mt-3">
                    <div class="col-12">
                        <!--                        <p class="mb-2">Tìm thấy <b>688</b> Mentor cho bạn!<span class="ml-3"
                                                                                                         style="cursor: pointer;color:#175E4C;" onclick="toggleFilter()"><b>Lọc kết quả</b><i
                                                            id="toggle-icon-filter" class="fa fa-chevron-circle-down fa-lg" aria-hidden="true"
                                                            style="color:#175E4C; padding-left: 5px;  border-left: 1px solid #fff;"></i></span></p>-->
                    </div>
                    <div id="filter-search" class="col-12 pt-2" style="background-color: #63A393">
                        <div class="search_mentor">
                            <div class="search_box_mentor page_search_mentor pt-1 pb-1">
                                <div class="form-inline pl-3 mb-1 justify-content-between">
                                    <div class="row">

                                        <div class="mb_10 col-md-3">
                                            <input type="text" name="professtion" style="width: 180px;" value=""
                                                   class="form-control" placeholder="Search by professional">
                                        </div>
                                        <div class="mb_10 col-md-3">
                                            <input type="text" name="service" style="width: 180px;" value=""
                                                   class="form-control" placeholder="Search the service">
                                        </div>
                                        <div class="mb_10 col-md-3">
                                            <input type="text" name="achievements" style="width: 180px;" value=""
                                                   class="form-control" placeholder="Search achievements">
                                        </div>

                                        <div class="col-md-3">                                          
                                            <button type="submit" class="ml-3 btn btn-info btn_search text-uppercase mb_10 ">
                                                <span class="btn_search_text">Apply</span>
                                            </button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

            </form>


            <section id="content">
                <div class="content-wrap nopadding">
                    <div class="mentor_page">
                        <div class="container">
                            <div class="mentor_list">
                                <div class="row mb-4 pl-3 pr-3">
                                    <div id="carouselOrientation" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators mb-0" style="width: 25%; margin: auto;">
                                            <li data-target="#carouselOrientation" style="background-color: #333;"
                                                data-slide-to="0" class="active"></li>
                                            <li data-target="#carouselOrientation" style="background-color: #333;"
                                                data-slide-to="1"></li>
                                            <li data-target="#carouselOrientation" style="background-color: #333;"
                                                data-slide-to="2"></li>

                                        </ol>
                                        <div class="carousel-inner">

                                            <div class="carousel-item active">
                                                <a href="#"
                                                   target="_blank">
                                                    <img src="https://mentori.vn/assets/images/banner/tailieu.jpeg" width="100%">
                                                    <div style="height: 50px">
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="carousel-item">
                                                <a href="#" target="_blank">
                                                    <img src="https://mentori.vn/assets/images/banner/search_mentor_ck_desktop.png?v=1" width="100%">
                                                    <div style="height: 50px">
                                                    </div>
                                                </a>
                                            </div>

                                            <div class="carousel-item">
                                                <a href="#" target="_blank">
                                                    <img src="https://mentori.vn/assets/images/banner/bannerweb01.png" width="100%">
                                                    <div style="height: 50px">
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="carousel-caption d-none d-md-block pl-5 pr-5 pt-0 pb-0">
                                                <div class="post_item mb-0">
                                                    <div class="row mt-1 pb-5">
                                                        <div class="col-md-10 col-xs-12">
                                                        </div>
                                                        <div class="col-md-1 col-xs-12"></div>
                                                        <div class="col-md-1 col-xs-12">
                                                            <a class="carousel-control-prev" href="#carouselOrientation"
                                                               role="button" data-slide="prev"
                                                               style="width: 50%; bottom: -100px; -webkit-filter: invert(100%); filter: invert(100%);">
                                                                <span class="carousel-control-prev-icon"
                                                                      aria-hidden="true"></span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                            <a class="carousel-control-next" href="#carouselOrientation"
                                                               role="button" data-slide="next"
                                                               style="width: 50%; bottom: -100px; -webkit-filter: invert(100%); filter: invert(100%);">
                                                                <span class="carousel-control-next-icon"
                                                                      aria-hidden="true"></span>
                                                                <span class="sr-only">Next</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <c:forEach var="p" items="${listM}">
                                        
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
                                                                        <span>${i},</span>
                                                                    </c:forEach>           
                                                        </div>
                                                        <div class="row mt-1">
                                                            <div class="user-rate col-6">
                                                                <div class="wrap-star">
                                                                    <img src="temp/ic-mentee.png"
                                                                         style="width: auto; height: 18px; margin-bottom: 2px;"
                                                                         data-toggle="tooltip" data-placement="bottom" title=""
                                                                         data-original-title="Số Mentee"> <span class="wrap-number">
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="user-favorite col-6">
                                                                <div class="wrap-star">
                                                                    <!--                                                    <img src="temp/followed.png"
                                                                                                                            style="width: auto; height: 18px; margin-bottom: 2px;"
                                                                                                                            data-toggle="tooltip" data-placement="bottom" title=""
                                                                                                                            data-original-title="Số người Theo dõi">-->
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
                                                            <span class="mentor_detail_link notopmargin mb-1">Xem chi tiết</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>  

                                </div>
                            </div>
                            <!-- Phân trang  -->
                            <div class="search_pagination mb-5 mt-5">
                                <nav aria-label="Page navigation example">
                                    <c:set var="page" value="${requestScope.num}"/>
                                    <ul class='pagination'>
                                        <c:forEach begin="${1}" end="${requestScope.num}" var="i" >
                                            <li class='page-item'><a class='page-link' style="color: green; font-style:inherit "   href='viewListMentor?page=${i}'>${i}</a></li>
                                            </c:forEach>

                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </section>


</div>

<!--<div id="gotoTop" class="icon-angle-up"></div>-->

<script src="assets/js/plugins.js"></script>
<!-- <script src="assets/bower_components/icheck/icheck.min.js"></script> -->
<script src="assets/js/select2.min.js"></script>


<!-- Hover  -->
<script src="assets/js/headere5bf.js?v=12"></script>
<script src="assets/js/star-rating.js"></script>
<script src="temp/home.js"></script>

<jsp:include page="../home/footer.jsp"/>
</body>



</html>
