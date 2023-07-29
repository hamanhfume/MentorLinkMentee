<%-- 
    Document   : view
    Created on : May 28, 2023, 4:50:14 PM
    Author     : damtu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="temp/logo2.png">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../home/header.jsp"/>
        <style>
            .skill-card-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .skill-card {
                width: 200px;
                margin: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                text-align: center;
            }

            .skill-card img {
                width: 100%;
                height: auto;
                object-fit: contain;
                border-radius: 5px;
                box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
                transition: transform 0.3s;
            }

            .skill-card img:hover {
                transform: translateY(-3px);
            }

            .skill-card a {
                text-decoration: none;
                color: #333;
            }

            .skill-card .skill-number {
                display: inline-block;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: #4CAF50;
                color: #fff;
                font-size: 18px;
                line-height: 40px;
                margin-bottom: 10px;
            }

            .skill-card h3 {
                margin: 0;
                font-size: 18px;
                text-align: center;
            }

            .title {
                text-align: center;
            }
            body {
                position: relative;
                min-height: 100vh;
            }

            #footer {
                /*position: absolute;*/
                left: 0;
                bottom: 0;
                width: 100%;
            }

        </style>

        <h1 class="title">Tất cả các skill</h1>

        <div class="skill-card-container">
            <c:forEach items="${listp}" var="o" varStatus="status">
                <div class="skill-card">
                    <div class="skill-number">${status.index + 1}</div>
                    <!-- Đặt href để chuyển hướng sang servlet MyServlet -->
                    <a href="searchBySkillid?skill_id=${o.skill_id}">
                        <img class="skill-image" src="${o.skill_img}" alt="Skill Image">
                        <h3>${o.skill_name}</h3>
                    </a>
                </div>
                <c:if test="${status.index % 4 == 3}">
                    <div style="width: 100%; height: 0;"></div>
                </c:if>
            </c:forEach>
        </div>

        <script>
            window.addEventListener('load', function () {
                var skillImages = document.querySelectorAll('.skill-image');
                var maxHeight = 0;

                // Tìm chiều cao lớn nhất trong các ảnh
                skillImages.forEach(function (image) {
                    maxHeight = Math.max(maxHeight, image.height);
                });

                // Đặt chiều cao tối đa cho tất cả các ảnh
                skillImages.forEach(function (image) {
                    image.style.height = maxHeight + 'px';
                });
            });
        </script>
        <div id="footer">
            <jsp:include page="../home/footer.jsp"/>
        </div>

    </body>
</html>
