# OwlBox - WebProject
<h3 align="center"> MVC2 패턴을 이용한 웹 사이트 구축 </h3>


<p align="center">
<img src="https://user-images.githubusercontent.com/103496262/172672280-91bafc4a-8ac7-4b76-998d-d36614081679.gif">
</p>
<div align=center> 예시 이미지입니다. </div>
<br>

<div align=center> 
   	<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
	<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
 	<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
 	<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
	<img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
	<img src="https://img.shields.io/badge/eclipse-IDE-F7DF1E?style=for-the-badge&logo=eclipse&logoColor=black">
	
</div>
<br><br>

<div align=center> 


</div>

#
**1. 개요**

	1. 웹 사이트명 : MVC2 패턴을 이용한 NFT민팅 사이트 구축
	2. 작성자 : 변재진
	3. 프로젝트 기간 : 2022/5/16 -> 2022/5/31

**2. 프로젝트의 목적**

	MVC2 패턴을 이용한 웹 사이트의 전반적인 구조와 
	웹사이트의 안에서 이루어지는 데이터의 처리과정, 통신흐름을 이해하여
	실제로 웹 사이트를 구축해보고 실제로 사용자가 이용할 비즈니스 모델을 생각하여 
	웹사이트에 포함시킨다.
	
	여기서 MVC2 패턴의 핵심적인 부분은, 비즈니스 로직을 처리하는 모델과 결과 화면을 보여주는 뷰를 분리한다는 것이다.
	어플리케이션의 흐름 제어나 사용자의 처리 요청은 컨트롤러에 집중된다는 것이다. 
	

**3. 소개**

	3명의 인원이 참여한 웹 사이트 구축 프로젝트 입니다. 
	OwlBox 는 자신이 가지고있는 NFT를 업로드하고 공유할수 있으며,
	회원들 간의 자유로운 소통을 할수 있도록 하는 취지에서 시작하였습니다.
	다른 회원의 NFT를 구경할수 있고 게시판을 통해 자유로운 소통을 할수 있습니다.
	NFT업로드는 관리자를 통해 업로드를 승인 받아야 하며, NFT의 속성별로 나누어 볼 수 있습니다.
	

#
**컨트롤러 구조** 
```

`-- ProjEx/src/main/java
	`-- admin	 	[관리자 DTO,DAO]
	`-- adminhandler	[관리자 페이지 핸들러]
	`-- board		[게시판 DTO,DAO]
	`-- boardhandler	[게시판 페이지 핸들러]
	`-- Category		[카테고리 DTO,DAO]
	`-- Collection		[콜렉션 DTO,DAO]
	`-- DB			[myBatis/DB관련 설정]
	`-- Handler		[나머지 페이지 핸들러]
    	`-- logon		[로그인 DTO,DAO]
	`-- logonhandler	[로그인 페이지 핸들러]
	`-- nfts		[NFTs DTO,DAO]
	`-- Property		[카테고리속성 DTO,DAO]

```
	
# 사용 Library version
	
-   **IDE**  : Eclipse Java EE 4.22.2 (Oxygen.2 Release)
-   **JDK**: Java 1.8
-   **Tomcat**  : Tomcat 9.0.85
-   **Gradle**  : Gradle 3.1.5 (Embedded in Eclipse)
-   **DBMS**  : Oracle 5.1.35
