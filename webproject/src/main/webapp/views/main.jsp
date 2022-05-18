<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script src="/webproject/views/script.js"></script>
<script src="/webproject/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OwlBox</title>

    <link rel="icon" type="image/png" href="img/icon.png" >
    <script src="https://kit.fontawesome.com/c9ab076429.js" crossorigin="anonymous"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=PT+Serif&display=swap');
    </style>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
    <!-- navbar -->
    <nav id="navbar">
        <div class="navbar__logo">
            <a href="#">
                <img src="img/logo.png" alt="Logo" width="400" height="200">
            </a>
        </div>
        <!-- 로그인이 안됐을때 -->
        <c:if test="${sessionScope.id eq null }">
        <div>
            <ul class="navbar__menu">
                <li class="navbar__menu__item">Collection</li>
                <li class="navbar__menu__item">My Page</li>
                <li class="navbar__menu__item" onclick="location='board.do'">Board</li>
                <li class="navbar__menu__item" onclick="location='loginPage.do'">Sign In</li>
            </ul>
        </div> 
        </c:if>
        <!-- 로그인이 됐을때 -->
        <c:if test="${sessionScope.id ne null }">
        <div>
            <ul class="navbar__menu">
                <li class="navbar__menu__item">Collection</li>
                <li class="navbar__menu__item">My Page</li>
                <li class="navbar__menu__item" onclick="location='board.do'">Board</li>
                <li class="navbar__menu__item" onclick="location='logOut.do'">Logout</li>
            </ul>
        </div>
        </c:if>
    </nav>
    <!-- Home -->
    <section id="home">
        <p class="home__description">WELCOME TO OWLBOX!</p>
        <h1 class="home__title">Discover, Collect<br/> and Sell extraordinary NFTs</h1>
        <button class="home__exp">Start Explore</button>
    </section>
    <!-- collect~feature까지 배경 그라데이션 -->
    <div class="gradation">
    <!-- collect -->
        <section id="about" class="section">
            <div class="section__container">
                <div class="about__disc">
                    <h2>Trending in OwlBox</h2>
                </div>
                <div class="about__collection">
                    <figure class="snip1336">
                        <img src="/img/Cloud_night.png"/>
                        <figcaption>
                            <img src="img/coll-img.png" class="profile"/>
                            <h2>Collection Name<span>by User Name</span></h2>
                            <p>Collection description</p>
                        </figcaption>
                    </figure>
                    <figure class="snip1336">
                        <img src="/img/Cloud_night.png"/>
                        <figcaption>
                            <img src="img/coll-img.png" class="profile"/>
                            <h2>Collection Name<span>by User Name</span></h2>
                            <p>Collection description</p>
                        </figcaption>
                    </figure>
                    <figure class="snip1336">
                        <img src="/img/Cloud_night.png"/>
                        <figcaption>
                            <img src="img/coll-img.png" class="profile"/>
                            <h2>Collection Name<span>by User Name</span></h2>
                            <p>Collection description</p>
                        </figcaption>
                    </figure>
                </div>
            </div>
        </section>
        <!-- currency -->
        <section id="currency" class="section">
            <div class="section__container">
                <div class="currency__set">
                    <div class="currency__left">
                        <h3>Moon Stone</h3>
                        <p>The <b>Moon Stone</b> token is built and traded on<br/>
                            the Harmony ONE platform, using the UniswapV2 Protocol.<br/>
                            Secure, fast and with extremely low trading fees,<br/>
                            you'll be earning rewards in no time!
                        </p>
                    </div>
                    <div class="currency__right">
                        <img src="img/moonstone_2.png" width="500" height="400"/>
                    </div>
                </div>
            </div>
        </section>
        <!-- mypage -->
        <section id="mypage" class="section">
            <div class="feature__title">
                <h2>Create and sell your NFTs</h2>
            </div>
            <div class="features">
                <div class="feature">
                    <div class="flip-card-front">
                        <img src="img/upload.png" class="card-img" width="300px" height="400px"/>
                    </div>
                    <div class="flip-card-back">
                        <h2>Add your NFTs</h2>
                        <p>Upload your work, add a title and
                            discription, and customize your NFTs
                            with properties, stats and content.
                        </p>
                        <button class="home__exp">move</button>
                    </div>
                </div>
                <div class="feature">
                    <div class="flip-card-front">
                        <img src="img/collect.png" class="card-img" width="130%" height="100%"/>
                    </div>
                    <div class="flip-card-back">
                        <h2>Create your collection</h2>
                        <p>Click My Collections and set up 
                            your collection. Add a discription,
                            profile & banner images.
                        </p>
                        <button class="home__exp">move</button>
                    </div>
                </div>
                <div class="feature">
                    <div class="flip-card-front">
                        <img src="img/sell.png" class="card-img" width="130%" height="100%"/>
                    </div>
                    <div class="flip-card-back">
                        <h2>List them for sale</h2>
                        <p>From fixed-price listings,
                            You choose how you want to sell
                            your NFTs, and we help you sell them.
                        </p>
                        <button class="home__exp">move</button>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- board -->
    <section id="board" class="section">
        <div class="section__container">
            <div class="board__set">
                <div class="board__left">
                    <h2>Ready to get started</h2>
                    <p>Communicate with members in OwlBox!</p>
                    <div class="board__left__search">
                        <input type="text" placeholder=&nbsp;&nbsp;Search...>
                        <button type="button">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                </div>
                <div class="board__right">
                    <img src="img/icon.png" width="200" height="200"/>
                    <i class="fa-solid fa-comment-dots"></i>
                </div>
            </div>
        </div>
    </section>
    <!-- contact -->
    <section id="contact" class="section">
        <div class="contact__title">
            <h2>Join the Community</h2>
        </div>
        <div class="contact__icon">
            <a class="smGlobalBtn" href="https://www.facebook.com/" ><i class="fab fa-facebook-f"></i></a>
			<a class="smGlobalBtn" href="https://twitter.com/" ><i class="fab fa-twitter"></i></a>
			<a class="smGlobalBtn" href="https://www.youtube.com" ><i class="fab fa-youtube"></i></a>
			<a class="smGlobalBtn" href="https://www.instagram.com/" ><i class="fab fa-instagram"></i></a>
        </div>
    </section>
</body>
</html>