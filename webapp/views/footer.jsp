<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Go Seoul</title>
        <style>
            footer {
                background-color: lightgray;
                font-family: "Title_Medium";
            }

            .footerLogo {
                width: 200px;
            }
        </style>
    </head>
    <body>
        <div>
            <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 border-top">
                <p class="col-md-4 mb-0 text-muted">&copy; 2023 Go Seoul Company, All rights reserved</p>

                <img class="footerLogo" src="./images/goseoul_02.png" />

                <ul class="nav col-md-4 justify-content-end">
                    <li class="nav-item"><a href="main.do" class="nav-link px-2 text-muted">Home</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">공지사항</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">개인정보처리방침</a></li>
                    <li class="nav-item"><a href="q_board.do" class="nav-link px-2 text-muted">FAQ</a></li>
                </ul>
            </footer>
        </div>
    </body>
</html>
