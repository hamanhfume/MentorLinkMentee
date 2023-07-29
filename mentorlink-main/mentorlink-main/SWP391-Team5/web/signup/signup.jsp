<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : signup
    Created on : May 25, 2023, 11:32:02 PM
    Author     : lamnb
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">

    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="icon" href="https://scontent.fhan5-1.fna.fbcdn.net/v/t1.15752-9/346119165_204038079126623_4944693773758350157_n.png?_nc_cat=105&ccb=1-7&_nc_sid=ae9488&_nc_ohc=59rA4Ca5SLQAX9FFAc0&_nc_ht=scontent.fhan5-1.fna&oh=03_AdRxmjNtaFmGhZQ4ul_XUCsH5XiC-mmcQODINzz4E7nZ8A&oe=6496E682">
        <link rel="stylesheet" href="https://cdn.usebootstrap.com/bootstrap/4.2.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/style.min.css" type="text/css" />
        <link rel="stylesheet" href="assets/css/responsive.css" type="text/css" />

        <link rel="stylesheet" href="assets/css/custom.minbc11.css?v=99" type="text/css" />
        <link rel="stylesheet" href="assets/css/override.css" type="text/css" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <title>Đăng ký</title>
    <body >
        <jsp:include page="../home/header.jsp"/>
        <section id="content">
            <div class="content-wrap nopadding">
                <div class="card card_login divcenter noradius noborder allmargin card-login-custom modal-padding"
                     style="max-width: 400px; background-color: rgba(255,255,255,0.93);">
                    <div class="card-body nopadding">

                        <div class="wrap-title">
                            <h3 class="title">ĐĂNG KÝ</h3>
                        </div>
                        <div class="login-logo">
                            <img src="assets/images/logo2.png" alt="ym">
                        </div>
                        <div class="help-block show_err">
                        </div>
                        <!--                        <a href="login/facebook.html" class="dt-btn-login">
                                                    <img src="assets/images/icons/icon-fb.png" alt="#" class="dt-icon-login">
                                                    <span class="dt-btn-login-text">
                                                        Đăng nhập bằng Facebook </span>
                                                </a>
                                                <a href="login/google.html" class="dt-btn-login">
                                                    <img src="assets/images/icons/icon-google.png" alt="#" class="dt-icon-login">
                                                    <span class="dt-btn-login-text">
                                                        Đăng nhập bằng Gmail </span>
                                                </a>-->
                        <!--<p class="text-or">Hoặc</p>-->
                        <form id="register-account" name="register-account" class="nobottommargin" action="signupController"
                              method="post" autocomplete="off">

                            <div class="mb_10">
                                <label for="role">Role đăng ký</label> &nbsp;&nbsp;
                                <select name="accounttype" id="role" class="form-control not-dark">
                                    <option value="1">Mentee</option>
                                    <option value="2">Mentor</option>
                                </select>
                            </div>
                            <div class="mb_10">
                                <label for="username">Username <span style="color: red">*</span></label>
                                <input type="text" name="user" value=""
                                       class="form-control not-dark login-form-username" />
                            </div>
                            <div class="mb_10">
                                <label for="">Email <span style="color: red">*</span></label>
                                <input type="email" name="email" value=""
                                       class="form-control not-dark login-form-username" />
                            </div>
                            <div class="mb_10">
                                <label for="">Họ và tên <span style="color: red">*</span></label>
                                <input type="text" name="name" value=""
                                       class="form-control not-dark login-form-username" />
                            </div>
                            <div class="mb_10">
                                <label for="">ngày tháng năm sinh <span style="color: red">*</span></label>
                                <input  type="date" name="date" value=""
                                        class="form-control not-dark login-form-password" max="<%=java.time.LocalDate.now()%>"/>
                            </div>
                            <div class="mb_10">
                                <label for="">Phone <span style="color: red">*</span></label>
                                <input  type="text" name="phone" value=""
                                        class="form-control not-dark login-form-password" />
                            </div>
                            <div class="mb_10">
                                <label for="">Địa chỉ <span style="color: red">*</span></label>
                                <input  type="text" name="address" value=""
                                        class="form-control not-dark login-form-password" />
                            </div>
                            <div class="mb_10">
                                <label for="role">giới tính</label> &nbsp;&nbsp;
                                <select name="gender" id="role" class="form-control not-dark">
                                    <option value="1">Nam</option>
                                    <option value="2">Nữ</option>

                                </select>
                            </div>

                            <div class="mb_10">
                                <label for="">Mật khẩu (8-20 ký tự ) <span style="color: red">*</span></label>
                                <input id="password" type="password" name="password" pattern=".{8,20}" value=""
                                       class="form-control not-dark login-form-password" />
                            </div>
                            <div class="mb_10">
                                <label for="">Nhập lại mật khẩu <span style="color: red">*</span></label>
                                <input type="password" name="cofirm_password" value=""
                                       class="form-control not-dark login-form-password" />
                                <c:if test="${requestScope.err != null}">
                                    <h6 style="color: red">${requestScope.err}</h6>
                                </c:if>
                                <c:if test="${requestScope.errE!=null}">
                                    <h6 style="color: red">${requestScope.errE}</h6>
                                </c:if>
                            </div>&nbsp;&nbsp;
                            <div class="mb_10 center">
                                <button class="btn btn-success" 
                                        type="submit" value="" onclick="validateRegisterForm()">Đăng ký</button>
                            </div>

                        </form>
                        <div class="mb_10 nobottommargin">
                            Bạn đã có tài khoản? <a href="login" class="">Hãy click vào đây để đăng nhập</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../home/footer.jsp"/>
    </body>


</html>
