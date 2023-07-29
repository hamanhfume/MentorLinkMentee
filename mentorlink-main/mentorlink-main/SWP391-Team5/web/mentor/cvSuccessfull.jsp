
<%-- 
    Document   : forgetPassword
    Created on : Jul 1, 2023, 3:22:04 PM
    Author     : lamnb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="icon" href="https://scontent.fhan5-1.fna.fbcdn.net/v/t1.15752-9/346119165_204038079126623_4944693773758350157_n.png?_nc_cat=105&ccb=1-7&_nc_sid=ae9488&_nc_ohc=59rA4Ca5SLQAX9FFAc0&_nc_ht=scontent.fhan5-1.fna&oh=03_AdRxmjNtaFmGhZQ4ul_XUCsH5XiC-mmcQODINzz4E7nZ8A&oe=6496E682">
        <link rel="stylesheet" href="https://cdn.usebootstrap.com/bootstrap/4.2.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/style.min.css" type="text/css" />
        <link rel="stylesheet" href="assets/css/responsive.css" type="text/css" />

        <link rel="stylesheet" href="assets/css/custom.minbc11.css?v=99" type="text/css" />
        <link rel="stylesheet" href="assets/css/override.css" type="text/css" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Forget Password</title>
    </head>



    <body class="stretched side-push-panel no-transition">
        <jsp:include page="../home/header.jsp"/>       
        <section id="content" style="position: relative;
                 overflow: hidden;
                 min-height: 67vh;
                 background-color: #FFF;
                 margin-top: 50px;">
            <div class="content-wrap nopadding" style="min-height: 70vh">
                <div class="login_container"
                     style=" background: url() center center no-repeat; background-size: cover;">
                </div>
                <div class="card card_login divcenter noradius noborder allmargin modal-padding card-login-custom"
                     style="max-width: 500px; background-color: rgba(255,255,255,0.93);">
                    <div class="card-body nopadding">
                        <div class="wrap-title">
                            <h3 class="title">Successfully</h3>
                        </div>
                        <div class="login-logo">
                            <img src="assets/images/logo2.png" alt="ym">
                        </div>
                        <div class="help-block show_err">
                        </div>
                        <!--Show error in here -->                       
                        <div id="change-content">
                            <div class="center">
                                <h4 style="margin-bottom: 50px">
                                    Chúc mừng bạn đã tạo CV thành công. Chúng tôi mong rằng bạn sẽ có thật nhiều đóng góp cho nền tảng.
                                </h4>
                            </div>



                            <div class="mb_10 center mt-3">
                                <!--                                <button type="submit" class="btn btn-success"
                                                                        style="min-width: 200px;">CV của bạn</button>-->
                                <a href="viewcv?mentor_id=${mentor_id}" class="btn btn-success"
                                   style="min-width: 200px;">CV của bạn</a>
                            </div>

                            <!--                            <div class="mb_10 nobottommargin center">
                                                            <a href="login" class="">Back to Login</a>
                                                        </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <jsp:include page="../home/footer.jsp"/>
    </body>
</html>
