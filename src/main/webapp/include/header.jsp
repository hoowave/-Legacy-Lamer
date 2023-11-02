<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="vo.MemberVO"%>
<html>

<head>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<title>Lamer</title>
</head>
<%
MemberVO mvo = (MemberVO) session.getAttribute("mvo");
%>
<body class="bg-light">
	<nav class="navbar bg-light mb-5 sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="/project/">Lamer</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3 mb-5">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/project/">Home</a></li>
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="javascript:void(0);" onclick="loadmain('menu/about.jsp')">About</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="javascript:void(0);"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Web Tools </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="javascript:void(0);"
									onclick="loadmain('menu/crawling.jsp')">Web Crawling</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="javascript:void(0);"
									onclick="loadmain('menu/mirroring.jsp')">Web Mirroring</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="javascript:void(0);"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Find Password </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="javascript:void(0);"
									onclick="loadmain('menu/dictionary.jsp')">Make Dictionary</a></li>
								<li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="javascript:void(0);"
									onclick="loadmain('menu/office.jsp')">Office Files</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="javascript:void(0);"
									onclick="loadmain('menu/archive.jsp')">Archive Files</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="javascript:void(0);"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								VIP zone </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="javascript:void(0);"
									onclick="loadmain('menu/scan.jsp')">Port Scan</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="javascript:void(0);"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Board </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="javascript:void(0);"
									onclick="loadmain('board?action=list&type=notice&page=1')">공지사항</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="javascript:void(0);"
									onclick="loadmain('board?action=list&type=free&page=1')">유저공간</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="javascript:void(0);"
									onclick="loadmain('board?action=list&type=qna&page=1')">개발Q&A</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="javascript:void(0);"
									onclick="loadmain('board?action=list&type=welcome&page=1')">가입인사</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="javascript:void(0);"
									onclick="loadmain('board?action=list&type=attendance&page=1')">출석부</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link"
							href="javascript:void(0);" onclick="loadmain('menu/faq.jsp')">FAQ</a></li>
					</ul>
					<c:if test="${mvo eq null}">
						<div class="row">
							<div class="col mb-3">
								<span class="mb-1">더 많은 정보가 필요하다면?</span> <a
									href="javascript:void(0);" class="mb-1 text-info loginlabel">로그인</a>
								<span class="mb-1">또는</span> <a href="javascript:void(0);"
									class="mb-1 text-success registerlabel">회원가입</a>
							</div>
						</div>

						<div class="loginform" style="display: none">
							<div class="row mb-3 text-center">
								<label for="colFormLabelLg"
									class="col-form-label col-form-label-lg">Login</label>
							</div>
							<div class="row mb-3 text-center">
								<div class="col-4">
									<label for="inputEmail3" class="col-form-label">아이디 : </label>
								</div>
								<div class="col">
									<input type="text" class="form-control" id="login_id">
								</div>
							</div>
							<div class="row mb-3 text-center">
								<div class="col-4">
									<label for="inputEmail3" class="col-form-label">비밀번호 :
									</label>
								</div>
								<div class="col">
									<input type="password" class="form-control" id="login_pw">
								</div>
							</div>
							<div class="d-grid gap-2">
								<button onclick="login();" type="button"
									class="btn btn-outline-success loginbtn">로그인</button>
							</div>
						</div>

						<div class="registerform" style="display: none">
							<div class="row mb-3 text-center">
								<label for="colFormLabelLg"
									class="col-form-label col-form-label-lg">Register</label>
							</div>
							<div class="row mb-3 text-center">
								<div class="col-4">
									<label for="inputEmail3" class="col-form-label">아이디 : </label>
								</div>
								<div class="col">
									<input type="text" class="form-control" id="register_id">
								</div>
							</div>
							<div class="row mb-3 text-center">
								<div class="col-4">
									<label for="inputEmail3" class="col-form-label">비밀번호 :
									</label>
								</div>
								<div class="col">
									<input type="password" class="form-control" id="register_pw">
								</div>
							</div>
							<div class="row mb-3 text-center">
								<div class="col-4">
									<label for="inputEmail3" class="col-form-label">비밀번호확인
										: </label>
								</div>
								<div class="col">
									<input type="password" class="form-control"
										id="register_confirm_pw">
								</div>
							</div>
							<div class="row mb-3 text-center">
								<div class="col-4">
									<label for="inputEmail3" class="col-form-label">이메일 : </label>
								</div>
								<div class="col">
									<input type="email" class="form-control" id="register_email">
								</div>
							</div>
							<div class="row mb-3 text-center">
								<div class="col-4">
									<label for="inputEmail3" class="col-form-label">닉네임 : </label>
								</div>
								<div class="col">
									<input type="text" class="form-control" id="register_nickname">
								</div>
							</div>
							<div class="d-grid gap-2">
								<button type="button"
									class="btn btn-outline-success registerbtn"
									onclick="register();">회원가입</button>
							</div>
						</div>
					</c:if>
					<c:if test="${mvo ne null}">
						<div class="row">
							<div class="col"></div>
							<div class="col-10 mb-3">
								<div class="card text-bg-light mb-3" style="max-width: 18rem;">
									<div class="card-header text-center"><%=mvo.getNickname()%>님
										환영합니다!
									</div>
									<div class="card-body">
										<p class="card-text">
											회원등급 :
											<%=mvo.getSpermit()%></p>
										<p class="card-text">
											보유포인트 :
											<%=mvo.getPoint()%></p>
										<c:if test="${mvo.permit eq 9}">
											<div class="d-grid gap-2 col-6 mx-auto mb-3">
												<button onclick="loadmain('administer/stats.jsp');"
													type="button" class="btn btn-outline-danger btn-sm">관리페이지</button>
											</div>
										</c:if>
										<div class="d-grid gap-2 col-6 mx-auto">
											<button onclick="logout();" type="button"
												class="btn btn-outline-success btn-sm">로그아웃</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col"></div>
						</div>
					</c:if>

				</div>
			</div>
		</div>
	</nav>
	<div class="maincontent">