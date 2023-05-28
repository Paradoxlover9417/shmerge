<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />

        <title>Insert title here</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

        <style>
            * {
                margin: 0;
                padding: 0;
            }
            li {
                list-style: none;
            }
            a {
                text-decoration: none;
                color: inherit;
            }
            li {
                border: 1px solid blue;
            }
            .wrap {
                width: 100%;
            }
            .wrap header {
                height: 80px;
                background-color: khaki;
                color: black;
                text-align: center;
                line-height: 80px;
                font-weight: bold;
            }
            .wrap .inner {
                margin: 0 auto;
                max-width: 1280px;
                text-align: center;
            }
            .wrap .inner .box {
                margin-top: 50px;
            }
            .wrap .inner .box ul {
                display: flex;
                width: 100%;
            }
            .wrap .inner .box ul li {
                width: 25%;
                height: 400px;
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <div class="wrap">
            <header>Temporary header</header>
            <div class="inner">
                <div class="box">
                    <h2>자주묻는 질문</h2>
                    <ul>
                        <li>test ${ testValue.q_title }</li>
                        <li>test ${ testValue.q_no }</li>
                        <li>test</li>
                        <li>test</li>
                        <li>test</li>
                    </ul>
                </div>
            </div>
        </div>
<c:import url="./footer.jsp"/>
    </body>
</html>
