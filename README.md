# 온라인 쇼핑몰 구현(Javaqua,잡아쿠아) - 2인 프로젝트

<img width="200" alt="폴더구조" src="https://user-images.githubusercontent.com/85216782/150094471-c4e12b8b-e05a-4cf6-8aaf-bb1ce1a22351.png">
<img width="700" alt="폴더구조" src="https://user-images.githubusercontent.com/85216782/150094647-254fcdd1-303f-4857-8606-e5f84017cc05.png">


사이트 : [http://javaqua.cafe24.com/](http://javaqua.cafe24.com/)
## 개요  

스프링 MVC패턴을 이용한 온라인 쇼핑몰 구현.

<img width="200" alt="plist" src="https://user-images.githubusercontent.com/87694251/151114760-96e0399b-fd34-40b1-a41b-518bb8242501.GIF">

<img width="200" alt="detail" src="https://user-images.githubusercontent.com/87694251/151114777-56c07ad9-c1e6-4f65-8cef-0de744a94dc9.GIF">

<img width="200" alt="cart" src="https://user-images.githubusercontent.com/87694251/151114896-547ba3a7-9e4e-4b1a-9621-35bba940ba23.GIF">

<img width="200" alt="order" src="https://user-images.githubusercontent.com/87694251/151114765-f847d50d-c385-4daa-aeab-075da106cc9d.GIF">

<img width="200" alt="orderlist" src="https://user-images.githubusercontent.com/87694251/151114767-e429dcb7-7fed-46c0-b5b8-3fbc89587b5f.GIF">


## 목적  

* 홈페이지 구현을 통한 웹개발에 대한 전반적인 흐름파악
* 협업과 깃(git) 통한 분업, 의견조율 및 버전관리 경험습득
* 일반적인 쇼핑몰의 기능을 대부분 구현하여 다양한 상황의 코드구성

## 주요기능 및 역할분담  


> ### 김지훈
* 로그인 (아이디저장, 자동로그인, 회원가입, 회원수정)
* 게시판 (CRUD, 페이징, 조건별 검색 및 페이징, 단일 이미지 첨부, 댓글기능, 답글기능)
* 상품 (CRUD, 페이징, 조건별 검색 및 페이징, 다중 이미지 첨부 및 텍스트)
* 최근본 상품 (쿠키)
* 스프링 시큐리티 (사용자 인증과 권한설정)

> ### 이예구
* 로그인 (아이디저장, 자동로그인, 회원가입, 회원수정)
* 게시판 (CRUD, 페이징, 조건별 검색 및 페이징, 단일 이미지 첨부, 댓글기능, 답글기능)
* 상품 (CRUD, 페이징, 조건별 검색 및 페이징, 다중 이미지 첨부 및 텍스트)
* 최근본 상품 (쿠키)
* 장바구니 & 주문 (CRUD)
* 상품문의 & 리뷰 (CRUD, 페이징)
* 관리자페이지 (회원정보, 상품관리, 주문관리, 게시글 및 문의관리)
* 스프링 시큐리티 (사용자 인증과 권한설정)

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


