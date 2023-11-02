<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
BoardDAO bdao = new BoardDAO();
%>
<c:set var="blist" value="<%=bdao.selectType()%>" />
<c:set var="nlist" value="<%=bdao.selectNewest()%>" />

<div class="container-fluid">
	<div class="container text-center">
		<div class="row mb-5">
			<div class="col"></div>
			<div class="col-10">
				<div id="carouselExampleControls" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="./image/thum1.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="./image/carousel_2.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="./image/carousel_3.jpg" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<div class="container text-center w-50 mb-5">
		<div class="row">

			<div class="col">
				<div class="list-group">
					<a href="javascript:void(0);"
						class="list-group-item list-group-item-action"
						onclick="loadmain('board?action=list&type=notice&page=1')">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">공지사항</h5>
						</div>
					</a>
				</div>

				<c:forEach var="bvo" items="${blist}" varStatus="status">

					<c:if
						test="${bvo.getDel_yn() eq 'Y' and bvo.getType() eq 'notice'}">
					</c:if>

					<c:if
						test="${bvo.getDel_yn() eq 'N' and bvo.getType() eq 'notice'}">
						<div class="list-group">
							<a href="javascript:void(0);"
								class="list-group-item list-group-item-action"
								onclick="loadmain('board?action=view&bno=${bvo.getBno()}')">
								<div class="d-flex w-100 justify-content-between">
									<c:if test="${bvo.getTitle().length() >= 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle().substring(0,18)}${"..."}
										</label>
									</c:if>
									<c:if test="${bvo.getTitle().length() < 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle()}</label>
									</c:if>
									<span class="badge bg-primary rounded-pill h-50">${bvo.getCommentnum()}</span>
								</div>
							</a>
						</div>
					</c:if>

				</c:forEach>

			</div>

			<div class="col">
				<div class="list-group">
					<a href="javascript:void(0);"
						class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">최신글</h5>
						</div>
					</a>
				</div>

				<c:forEach var="bvo" items="${nlist}" varStatus="status">

					<div class="list-group">
						<c:if test="${bvo.getType() ne 'attendance'}">
							<a href="javascript:void(0);"
								class="list-group-item list-group-item-action"
								onclick="loadmain('board?action=view&bno=${bvo.getBno()}')">
								<div class="d-flex w-100 justify-content-between">
									<c:if test="${bvo.getTitle().length() >= 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle().substring(0,18)}${"..."}
										</label>
									</c:if>
									<c:if test="${bvo.getTitle().length() < 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle()}</label>
									</c:if>
									<span class="badge bg-primary rounded-pill h-50">${bvo.getCommentnum()}</span>
								</div>
							</a>
						</c:if>
						<c:if test="${bvo.getType() eq 'attendance'}">
							<a href="javascript:void(0);"
								class="list-group-item list-group-item-action">
								<div class="d-flex w-100 justify-content-between">
									<c:if test="${bvo.getTitle().length() >= 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle().substring(0,20)}${"..."}
										</label>
									</c:if>
									<c:if test="${bvo.getTitle().length() < 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle()}</label>
									</c:if>
								</div>
							</a>
						</c:if>
					</div>

				</c:forEach>

			</div>
		</div>
	</div>
	<div class="container text-center w-50 mb-5">
		<div class="row">

			<div class="col">
				<div class="list-group">
					<a href="javascript:void(0);"
						class="list-group-item list-group-item-action"
						onclick="loadmain('board?action=list&type=free&page=1')">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">유저공간</h5>
						</div>
					</a>
				</div>

				<c:forEach var="bvo" items="${blist}" varStatus="status">

					<c:if test="${bvo.getDel_yn() eq 'Y' and bvo.getType() eq 'free'}">
					</c:if>

					<c:if test="${bvo.getDel_yn() eq 'N' and bvo.getType() eq 'free'}">
						<div class="list-group">
							<a href="javascript:void(0);"
								class="list-group-item list-group-item-action"
								onclick="loadmain('board?action=view&bno=${bvo.getBno()}')">
								<div class="d-flex w-100 justify-content-between">
									<c:if test="${bvo.getTitle().length() >= 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle().substring(0,18)}${"..."}
										</label>
									</c:if>
									<c:if test="${bvo.getTitle().length() < 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle()}</label>
									</c:if>
									<span class="badge bg-primary rounded-pill h-50">${bvo.getCommentnum()}</span>
								</div>
							</a>
						</div>
					</c:if>

				</c:forEach>

			</div>

			<div class="col">
				<div class="list-group">
					<a href="javascript:void(0);"
						class="list-group-item list-group-item-action"
						onclick="loadmain('board?action=list&type=qna&page=1')">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">개발Q&A</h5>
						</div>
					</a>
				</div>

				<c:forEach var="bvo" items="${blist}" varStatus="status">

					<c:if test="${bvo.getDel_yn() eq 'Y' and bvo.getType() eq 'qna'}">
					</c:if>

					<c:if test="${bvo.getDel_yn() eq 'N' and bvo.getType() eq 'qna'}">
						<div class="list-group">
							<a href="javascript:void(0);"
								class="list-group-item list-group-item-action"
								onclick="loadmain('board?action=view&bno=${bvo.getBno()}')">
								<div class="d-flex w-100 justify-content-between">
									<c:if test="${bvo.getTitle().length() >= 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle().substring(0,18)}${"..."}
										</label>
									</c:if>
									<c:if test="${bvo.getTitle().length() < 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle()}</label>
									</c:if>
									<span class="badge bg-primary rounded-pill h-50">${bvo.getCommentnum()}</span>
								</div>
							</a>
						</div>
					</c:if>

				</c:forEach>

			</div>

		</div>
	</div>
	<div class="container text-center w-50 mb-5">
		<div class="row">
			<div class="col">
				<div class="list-group">
					<a href="javascript:void(0);"
						class="list-group-item list-group-item-action"
						onclick="loadmain('board?action=list&type=welcome&page=1')">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">가입인사</h5>
						</div>
					</a>
				</div>

				<c:forEach var="bvo" items="${blist}" varStatus="status">

					<c:if
						test="${bvo.getDel_yn() eq 'Y' and bvo.getType() eq 'welcome'}">
					</c:if>

					<c:if
						test="${bvo.getDel_yn() eq 'N' and bvo.getType() eq 'welcome'}">
						<div class="list-group">
							<a href="javascript:void(0);"
								class="list-group-item list-group-item-action"
								onclick="loadmain('board?action=view&bno=${bvo.getBno()}')">
								<div class="d-flex w-100 justify-content-between">
									<c:if test="${bvo.getTitle().length() >= 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle().substring(0,18)}${"..."}
										</label>
									</c:if>
									<c:if test="${bvo.getTitle().length() < 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle()}</label>
									</c:if>
									<span class="badge bg-primary rounded-pill h-50">${bvo.getCommentnum()}</span>
								</div>
							</a>
						</div>
					</c:if>

				</c:forEach>

			</div>
			<div class="col">
				<div class="list-group">
					<a href="javascript:void(0);"
						class="list-group-item list-group-item-action"
						onclick="loadmain('board?action=list&type=attendance&page=1')">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">출석부</h5>
						</div>
					</a>
				</div>

				<c:forEach var="bvo" items="${blist}" varStatus="status">

					<c:if
						test="${bvo.getDel_yn() eq 'Y' and bvo.getType() eq 'attendance'}">
					</c:if>

					<c:if
						test="${bvo.getDel_yn() eq 'N' and bvo.getType() eq 'attendance'}">
						<div class="list-group">
							<a href="javascript:void(0);"
								class="list-group-item list-group-item-action">
								<div class="d-flex w-100 justify-content-between">
									<c:if test="${bvo.getTitle().length() >= 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle().substring(0,20)}${"..."}
										</label>
									</c:if>
									<c:if test="${bvo.getTitle().length() < 20}">
										<label class="col-form-label col-form-label-sm">${bvo.getTitle()}</label>
									</c:if>
								</div>
							</a>
						</div>
					</c:if>

				</c:forEach>

			</div>
		</div>
	</div>
</div>