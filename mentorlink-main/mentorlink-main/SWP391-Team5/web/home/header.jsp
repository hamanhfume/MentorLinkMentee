<%-- 
    Document   : header
    Created on : Jun 11, 2023, 12:57:11 PM
    Author     : Lamnb
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="temp/home1.css">
    </head>

    <body> 
            
            <header id="header" class="sticky-header">
                <div id="header-wrap">
                    <div class="container-md header">
                        <div id="primary-menu-trigger" class="align-middle" style="opacity: 1; pointer-events: unset;"><!--mobile icon-->
                            <a href="Home" class="standard-logo"><img src="temp/logo.png" alt="logo" class="main_logo"></a>
                            <span class="standard-logo mobile-icon"><i class="fa-solid fa-bars"></i></span>
                        </div>
                        <!--                    <div id="logo">
                                                <a href="Home" class="standard-logo"><img src="temp/logo.png" alt="logo" class="main_logo"></a>
                                            </div>-->
                        <div class="dt-menu-mega d-flex ">
                            <ul id="mobile-menu" class="dt-menu-mega d-flex justify-content-between mobile-menu-none"
                                hide="true">

                                <li class="sub-menu">
                                    <a href="viewSkill">
                                        <div>List Skill</div>
                                    </a>
                                </li>
                                <li class="sub-menu">
                                    <a href="viewListMentor">
                                        <div>Find Mentor</div>
                                    </a>
                                </li>
                                <c:if test="${sessionScope.acc.role == 1}"> 
                                    <li class="sub-menu">
                                        <a href="mentorSuggestion">
                                            <div>Mentor Suggestion</div>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.acc == null}">  

                                    <li class="login-box">
                                        <a href="login" class="btn-info btn">Login</a>
                                    </li>
                                    <li class="login-box">
                                        <a href="signupController" class="btn-info btn">Register</a>
                                    </li>
                                </c:if>
                            </ul>

                            <!--Mentor / Mentee / Admin-->
                            <c:if test="${sessionScope.acc != null}"> 
                                <!--Mentee -->
                                <c:if test="${sessionScope.acc.role == 1}"> 
                                    <div id="top-user">
                                        <div class="div" id="user-avatar">
                                            <c:set var="avatarUrl" value="${sessionScope.avatarUrl}" />
                                            <img alt="" class="img-circle avatar_header"
                                                 style="width: 36px; height: 36px; -o-object-fit: cover; object-fit: cover;-o-object-position: center; object-position: center;"
                                                 src="assets/upload/${avatarUrl}">

                                        </div>
                                        <ul class="select_user_box" id="select_user_box">
                                            <li class="dt-menu-item-parent pt-2 pb-2">
                                                <div class="div">
                                                    <div class="" style="display: flex">
                                                        <div class="pr-2" style="width: 54px;">
                                                            <a href="/user/523868402" class="" title="Duy Dao">
                                                                <img alt="" class="img-circle avatar_header"
                                                                     style="width: 36px; height: 36px; -o-object-fit: cover; object-fit: cover;-o-object-position: center; object-position: center;"
                                                                     src="assets/upload/${avatarUrl}">
                                                            </a>
                                                        </div>
                                                        <div class="pl-0" style="width: 100%;">
                                                            <div>
                                                                <a href="UserProfile" class="" style="font-size: 14px;" title="">
                                                                    Mentee: ${sessionScope.acc.username} </a>
                                                            </div>
                                                            <div>
                                                                <a href="UserProfile" class="" style="font-size: 12px;" title="">
                                                                    My profile
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li role="separator" class="divider"></li>
                                            <!--                                        <li>
                                                                                        <a href="">
                                                                                            <i class="fa fa-leaf"></i>Register to become Mentor
                                                                                        </a>
                                                                                    </li>-->
                                            <li role="separator" class="divider"></li>


                                            <li><a class="pb-0">Individual</a></li>
                                            <li class="dt-menu-item-parent"></li>
<!--                                            <li>
                                                <a href="#" class="pb-0" style="cursor: pointer;">
                                                    <i class="fa fa-tag"></i>Request Mentor
                                                </a>
                                            </li>-->
                                            <li>
                                                <a href="satisticsRequest" class="pb-0" style="cursor: pointer;">
                                                    <i class="fa fa-shopping-cart"></i>Statistic Request Mentee
                                                </a>
                                            </li>
                                            <li>
                                                <a data-toggle="modal" data-target="#add-interest-field" class="pb-0"
                                                   style="cursor: pointer;" href="listrequestbyme1">
                                                    <i class="fa-solid fa-lightbulb"></i>List Request By Me
                                                </a>
                                            </li>
                                            <li>
                                                <a href="UserProfile" class="pb-0">
                                                    <i class="fa-solid fa-user"></i></i>My profile </a>
                                            </li>
                                            <li>
                                                <a href="changePass" class="">
                                                    <i class="fa fa-key"></i>Change password
                                                </a>
                                            </li>

                                            <li role="separator" class="divider"></li>



                                            <li>
                                                <a href="logout">
                                                    <i class="fa fa-sign-out" style=" -ms-transform: rotate(180deg); /* IE 9 */
                                                       -webkit-transform: rotate(180deg); /* Chrome, Safari, Opera */
                                                       transform: rotate(180deg);"></i>Logout </a>
                                            </li>
                                        </ul>
                                    </div>
                                </c:if>
                                <!-- Mentor -->
                                <c:if test="${sessionScope.acc.role == 2}"> 
                                    <div id="top-user">
                                        <div class="div" id="user-avatar">
                                            <c:set var="avatarUrl" value="${sessionScope.avatarUrl}" />
                                            <img alt="" class="img-circle avatar_header"
                                                 style="width: 36px; height: 36px; -o-object-fit: cover; object-fit: cover;-o-object-position: center; object-position: center;"
                                                 src="assets/upload/${avatarUrl}">
                                            <!--                                        <i class="fa fa-angle-down fa-lg" aria-hidden="true" style="color:#fff;"></i>-->
                                        </div>
                                        <ul class="select_user_box" id="select_user_box" >
                                            <li class="dt-menu-item-parent pt-2 pb-2">
                                                <div class="div">
                                                    <div class="" style="display: flex">
                                                        <div class="pr-2" style="width: 54px;">
                                                            <a href="#" class="" title="Duy Dao">
                                                                <img alt="" class="img-circle avatar_header"
                                                                     style="width: 36px; height: 36px; -o-object-fit: cover; object-fit: cover;-o-object-position: center; object-position: center;"
                                                                     src="assets/upload/${avatarUrl}">
                                                            </a>
                                                        </div>
                                                        <div class="pl-0" style="width: 100%;">
                                                            <div>
                                                                <a href="UserProfile" class="" style="font-size: 14px;" title="Duy Dao">
                                                                    Mentor:   ${sessionScope.acc.username} </a>
                                                            </div>
                                                            <div>
                                                                <a href="UserProfile" class="" style="font-size: 12px;" title="Duy Dao">
                                                                    My profile
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li role="separator" class="divider"></li>
                                                <c:if test="${sessionScope.acc.cv_status == 0}"> 
                                                <li>
                                                    <a href="CreateCV">
                                                        <i class="fa fa-leaf"></i>Tạo CV Cho Mentor
                                                    </a>                                            
                                                </li>
                                            </c:if>
                                            <c:if test="${sessionScope.acc.cv_status == 1}"> 
                                                <li>
                                                    <a href="viewcv?mentor_id=${sessionScope.acc.user_id}">
                                                        <i class="fa fa-leaf"></i>Xem CV Của Bạn
                                                    </a>                                            
                                                </li>
                                            </c:if>
                                            <li>
                                                <a href="#" data-modal-target="#popup-btn-rq-statistic" >
                                                    <i class="fa fa-leaf"></i>
                                                    <div class="center"  style="display: inline">List statistic request</div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="followingRequest">
                                                    <i class="fa fa-leaf"></i>List following request
                                                </a>
                                            </li>
                                            <li role="separator" class="divider"></li>


                                            <li><a class="pb-0">Individual</a></li>
                                            <li class="dt-menu-item-parent"></li>
                                            <li>
                                                <a href="UserProfile" class="pb-0">
                                                    <i class="fa-solid fa-user"></i></i>My profile</a>
                                            </li>
                                            <li>
                                                <a href="changePass" class="">
                                                    <i class="fa fa-key"></i>Change password
                                                </a>
                                            </li>

                                            <li role="separator" class="divider"></li>
                                            <li>
                                                <a href="#" target="_blank" class="pb-0">
                                                    <i class="fa fa-question-circle"></i>Trợ giúp và Hỗ trợ
                                                </a>
                                            </li>

                                            <li>
                                                <a href="logout">
                                                    <i class="fa fa-sign-out" style=" -ms-transform: rotate(180deg); /* IE 9 */
                                                       -webkit-transform: rotate(180deg); /* Chrome, Safari, Opera */
                                                       transform: rotate(180deg);"></i>Logout </a>
                                            </li>
                                        </ul>
                                    </div>
                                </c:if>
                                

                            </c:if>
                        </div>
                    </div>
                </div>
            </header>
    </body>
    <script src="temp/home.js"></script>

</html>

