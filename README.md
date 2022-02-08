<<<<<<< HEAD
# 열대어 전문 쇼핑몰  - 협업 프로젝트

## 목차

* 프로젝트 소개
    1. 프로젝트 설명
    2. 개발 환경
    3. 주요 기능 및 역할 분담
* 동작 구조
* 마치며
    1. 프로젝트 보완사항
    2. 소감


## 프로젝트 소개
1. **프로젝트 설명**

    스프링mvc 온라인 쇼핑몰의 전반적인 기능을 구현한 팀 프로젝트

2. **개발환경**
    * Front<br>
        Javascript, Vue.js, Jquery, axios/ajax

    * Back<br>
        JDK 1.8, JSP, Spring Framework, Mybatis, Tomcat 8, Oracle 19c, AWS(RDS)
    
3. **주요기능 및 역할 분담**
    * Spring Security를 활용한 로그인인증 및 권한부여  
    * 상품 리스트와 페이징
    * 최근 본 상품
    * 상품 주문 및 장바구니담기
    * 리뷰작성 및 상품문의
    * 공지사항/1:1문의
    * 마이페이지(주문내역,리뷰내역,상품문의내역,개인정보수정)
    * 관리자페이지(회원관리,상품관리,주문관리,게시판관리)

## 동작 구조

![구조](https://user-images.githubusercontent.com/87694251/150920090-aa8e92d0-8d67-4b76-8bda-c84c3e096fc8.jpg)



=======
# 온라인 쇼핑몰 구현(Javaqua,잡아쿠아) - 2인 프로젝트

<img width="200" alt="폴더구조" src="https://user-images.githubusercontent.com/85216782/150094471-c4e12b8b-e05a-4cf6-8aaf-bb1ce1a22351.png">
<img width="700" alt="폴더구조" src="https://user-images.githubusercontent.com/85216782/150094647-254fcdd1-303f-4857-8606-e5f84017cc05.png">


사이트 : [http://javaqua.cafe24.com/](http://javaqua.cafe24.com/)
## 개요  

스프링 MVC패턴을 이용한 온라인 쇼핑몰 구현.

## 목적  

* 홈페이지 구현을 통한 웹개발에 대한 전반적인 흐름파악
* 협업과 깃(git) 통한 분업, 의견조율 및 버전관리 경험습득
* 일반적인 쇼핑몰의 기능을 대부분 구현하여 다양한 상황의 코드구성

## 주요기능 및 역할분담  


> ### 김지훈
* 로그인 (아이디저장, 자동로그인, 회원가입, 회원수정)
* 게시판 (페이징, 조건별 검색 및 페이징, 단일 이미지 첨부, 댓글기능, 답글기능)
* 상품 (페이징, 조건별 검색 및 페이징, 다중 이미지 첨부 및 텍스트)
* 최근본 상품 (쿠키)
* 스프링 시큐리티 (사용자 인증과 권한설정)

> ### 이예구
* 상품주문
* 장바구니기능
* 상품문의 및 답변 
* 리뷰작성
* 마이페이지 (구매내역, 리뷰내역, 상품문의내역)

> ### 공통
* 웹디자인 / 웹퍼블리싱
* 관리자페이지 (회원정보, 상품관리, 주문관리, 게시글 및 문의관리)

## 개발환경

> ### Back-End

* Spring 5
* JDK 1.8
* MariaDB
* Tomcat 8
* MyBatis 3.4
* Maven 2.9

> ### Fornt-End

* HTML & CSS & JavaScript
* Jquery
* Ajax
* Vue.js
* Axios
* JSP


## 동작 구조

![구조](https://user-images.githubusercontent.com/87694251/151108148-ec56f69e-eba2-4ed6-baef-6d2eb345ffd3.jpg)

## 개선사항

> ### 김지훈
* 모바일환경에서 적용되는 반응형 css를 따로 작성하지 않았다.
* 많은 기능을 구현하는데에만 집중해 코드의 중복제거와 재사용에 소홀했다.
* Git에서 변경사항을 커밋할 때   

> ### 이예구
* 유지보수를 고려할때 가독성 향상을 위한 간결한 코드처리와 주석처리를 더욱더 신경 쓸 필요가 있겠다.
* jsp와 vue.js가 혼용해서 쓰이는 부분을 한가지로 통일 해서 처리할 필요성이 있겠다.
>>>>>>> develop

