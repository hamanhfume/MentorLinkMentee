<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : feedbackmentor
    Created on : Jul 7, 2023, 3:47:22 PM
    Author     : Tuan Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <link rel="icon" href="temp/logo2.png">
        <title>Form Reviews</title>
        <link rel="stylesheet" href="assets/css/feedback1.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    </head>

    <body>
        <jsp:include page="../home/header.jsp"/>
        <div class="containerr">
            <div class="wrapper">
                <form action="commentAndRateStart" method="post">
                    <div
                        style="height: 50px; width: 500px; background-color: #175E4C; margin-bottom: 20px; color: white; border-radius: 6px;">
                        <h1>Feedback For Mentor</h1>
                    </div>
                    <div
                        style="height: 2px; width: 520px; background-color: #175E4C; margin-bottom: 20px; border-radius: 6px;">
                    </div>
                    <h3>Please rate the skills you have learned</h3>
                    <div class="row">

                        <c:forEach begin="0" end="${listSkill.size()-1}" step="1" var="i">
                            <div class="row" style="font-size: 1.5rem">
                                <div class="col-6">
                                    <h3>${listSkill.get(i).skill_name}</h3>
                                </div>
                                <div class="rating${i+1} col-6">
                                    <input type="number" name="rating${i+1}" hidden value="1">
                                    <i class='bx bxs-star star${i+1} active' style="--i: 0;"></i>
                                    <i class='bx bx-star star${i+1}' style="--i: 1;"></i>
                                    <i class='bx bx-star star${i+1}' style="--i: 2;"></i>
                                    <i class='bx bx-star star${i+1}' style="--i: 3;"></i>
                                    <i class='bx bx-star star${i+1}' style="--i: 4;"></i>
                                </div>                               
                            </div>
                        </c:forEach>


                        <!--                    <div class="row">
                                                <div class="col-6">
                                                    <h3>HTML</h3>
                                                </div>
                                                <div class="rating2 col-6">
                                                    <input type="number" name="rating2" hidden>
                                                    <i class='bx bxs-star star2 active' style="--i: 0;"></i>
                                                    <i class='bx bx-star star2' style="--i: 1;"></i>
                                                    <i class='bx bx-star star2' style="--i: 2;"></i>
                                                    <i class='bx bx-star star2' style="--i: 3;"></i>
                                                    <i class='bx bx-star star2' style="--i: 4;"></i>
                                                </div>
                                            </div>
                        
                                            <div class="row">
                                                <div class="col-6">
                                                    <h3>HTML</h3>
                                                </div>
                                                <div class="rating3 col-6">
                                                    <input type="number" name="rating3" hidden>
                                                    <i class='bx bxs-star star3 active' style="--i: 0;"></i>
                                                    <i class='bx bx-star star3' style="--i: 1;"></i>
                                                    <i class='bx bx-star star3' style="--i: 2;"></i>
                                                    <i class='bx bx-star star3' style="--i: 3;"></i>
                                                    <i class='bx bx-star star3' style="--i: 4;"></i>
                                                </div>
                                            </div>-->

                    </div>
                    <div style="margin-top: 20px;">
                        <div
                            style="height: 2px; width: 520px; background-color: #175E4C; margin-bottom: 20px; border-radius: 6px;">
                        </div>
                        <h2>General assessment</h2>

                        <div class="rating" style="font-size: 3rem;">
                            <input type="number" name="rating" hidden value="1">
                            <i class='bx bxs-star star active' style="--i: 0;"></i>
                            <i class='bx bx-star star' style="--i: 1;"></i>
                            <i class='bx bx-star star' style="--i: 2;"></i>
                            <i class='bx bx-star star' style="--i: 3;"></i>
                            <i class='bx bx-star star' style="--i: 4;"></i>
                        </div>
                        <textarea name="opinion" cols="30" rows="5" placeholder="Your opinion..." style="outline: none; resize: none;
                                  " required=""></textarea>
                        <div class="btn-group">
                            <button type="submit" class="btn submit">Submit</button>

                        </div>

                    </div>
                </form>
            </div>
        </div>
        <script src="assets/js/feedback1.js"></script>
        <jsp:include page="../home/footer.jsp"/>
    </body>
</html>
