<%@page import="vo.MemberVO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberVO mvo = (MemberVO) session.getAttribute("mvo");
BoardVO bvo = (BoardVO) request.getAttribute("bvo");
String title = (String) request.getAttribute("title");
int commentnum = (int) request.getAttribute("commentnum");
%>
<div class="container-fluid mb-5">
	<div class="row mb-1">
		<div class="col"></div>
		<div class="col-6">
			<p class="h3 mb-3"><%=bvo.getTitle()%></p>
			<table class="table table-bordered mb-3">
				<tr>
					<td>
						<div class="form-floating">
							<input type="text" readonly class="form-control-plaintext"
								id="type" value="<%=title%>"> <label for="type">카테고리</label>
						</div>
					</td>
					<td>
						<div class="form-floating">
							<input type="text" readonly class="form-control-plaintext"
								id="writer" value="<%=bvo.getWriter()%>"> <label
								for="writer">작성자</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-floating">
							<input type="text" readonly class="form-control-plaintext"
								id="date" value="<%=bvo.getDate()%>"> <label for="date">작성일</label>
						</div>
					</td>
					<td>
						<div class="form-floating">
							<input type="text" readonly class="form-control-plaintext"
								id="hit" value="<%=bvo.getHit()%>"> <label for="hit">조회수</label>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="form-floating">
							<input type="text" readonly class="form-control-plaintext"
								id="title" value="<%=bvo.getTitle()%>"> <label
								for="title">제목</label>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p class="mx-1 my-1 lh-base" style="min-height: 300px">
							<%=bvo.getContent()%>
						</p>
					</td>
				</tr>
			</table>
		</div>
		<div class="col"></div>
	</div>
	<div class="row mb-3">
		<div class="col"></div>
		<div class="col-6">
			<div class="accordion">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
							aria-controls="panelsStayOpen-collapseOne">댓글(${commentnum})</button>
					</h2>
					<div id="panelsStayOpen-collapseOne"
						class="accordion-collapse collapse show"
						aria-labelledby="panelsStayOpen-headingOne">
						<div class="accordion-body" id="comment_load"
							bno="<%=bvo.getBno()%>"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>
	<div class="row">
		<div class="col"></div>
		<div class="col-6">
			<div class="row">
				<div class="col d-flex justify-content-start">
					<c:if
						test="${mvo.getNickname() eq bvo.getWriter() || mvo.permit eq 9}">
						<button type="button" class="btn btn-outline-danger"
							onclick="bdelete('${bvo.getType()}',${bvo.getBno()});">삭제하기</button>
					</c:if>

				</div>
				<div class="col d-flex justify-content-center">
					<c:if
						test="${mvo.getNickname() eq bvo.getWriter() || mvo.permit eq 9}">
						<button type="button" class="btn btn-outline-info"
							onclick="loadmain('board?action=modifypage&bno=<%=bvo.getBno()%>')">수정하기</button>
					</c:if>
				</div>
				<div class="col d-flex justify-content-end">
					<button class="btn btn-outline-secondary" type="button"
						onclick="loadmain('board?action=list&type=<%=bvo.getType()%>&page=1')">돌아가기</button>
				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>
</div>
<script>
$("#comment_load").load("comment?action=view&bno=<%=bvo.getBno()%>&page=1");
</script>