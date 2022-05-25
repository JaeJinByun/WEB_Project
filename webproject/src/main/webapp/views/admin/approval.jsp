<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/webproject/views/style.css" rel="stylesheet" type="text/css">

<script src="/webproject/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>OwlBox</title>

        <link rel="icon" type="image/png" href="../img/icon.png" >
        <script src="https://kit.fontawesome.com/c9ab076429.js" crossorigin="anonymous"></script>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=PT+Serif&display=swap');
        </style>
        
        <script src="../jquery-3.6.0.js"></script> 
        <script src="../script.js" defer></script> 
    </head>
    <body>
        
        <!-- navbar -->
        <nav id="navbar">
            <div class="navbar__logo">
                <img src="/webproject/views/img/logo.png" alt="Logo" width="200" height="100">
            </div>
            <div class="navbar__menu">
                <ul class="navbar__menu">
                	<li class="navbar__menu__item" onclick="location='main.do'">Home</li>
                    <li class="navbar__menu__item">Collection</li>
                    <li class="navbar__menu__item active">Admin</li>
                    <li class="navbar__menu__item">Board</li>
                    <li class="navbar__menu__item" onclick="location='logOut.do'">SignOut</li>
                </ul>
            </div>
        </nav>

        <!-- home -->
        <section id="home">
            <img src="/webproject/views/img/icon.png" alt="profile photo" class="home__avater">
            <h1 class="home__title">Admin</h1>
        </section>

        <!-- archives -->
        <section id="archives" class="section">
            <div class="section__container">
                <div class="work__categories">
                    <button class="category__btn" onclick="location='manage.do'">Members</span></button>
                    <button class="category__btn">Approval</span></button>
                </div>
            </div>
            <!-- 승인 받을 NFT들 보이는 부분 -->
            <h1 class="memboard">Approval</h1>
            <div class="cartWrap tbl-bg">
                <!-- 첫번째 NFT-->
                <div class="items">
                    <div class="infoWrap">
                        <div class="cartSection">
                            <img src="/webproject/views/img/collect.png" class="itemImg"/>
                            <p class="itemNumber">Collection name<span>by User Name</span></p>
                            <h3>NFT name</h3>
                        </div>
                        <div class="cartSection">
                            <button class="appr__btn trigger">approve</button>
                        </div>
                    </div>
                </div>
                <!-- 두번째 NFT-->
                <div class="items">
                    <div class="infoWrap">
                        <div class="cartSection">
                            <img src="/webproject/views/img/collect.png" class="itemImg"/>
                            <p class="itemNumber">Collection name<span>by User Name</span></p>
                            <h3>NFT name</h3>
                        </div>
                        <div class="cartSection">
                            <button class="appr__btn trigger">approve</button>
                        </div>
                    </div>
                </div>
                <!-- 세번째 NFT-->
                <div class="items">
                    <div class="infoWrap">
                        <div class="cartSection">
                            <img src="/webproject/views/img/collect.png" class="itemImg"/>
                            <p class="itemNumber">Collection name<span>by User Name</span></p>
                            <h3>NFT name</h3>
                        </div>
                        <div class="cartSection">
                            <button class="appr__btn trigger">approve</button>
                        </div>
                    </div>
                </div>
                <!-- 네번째 NFT-->
                <div class="items">
                    <div class="infoWrap">
                        <div class="cartSection">
                            <img src="/webproject/views/img/collect.png" class="itemImg"/>
                            <p class="itemNumber">Collection name<span>by User Name</span></p>
                            <h3>NFT name</h3>
                        </div>
                        <div class="cartSection">
                            <button class="appr__btn trigger">approve</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- foot -->
        <section id="foot">
        </section>
    </body>
</html>