<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="vo.MemberVO"%>
<%
MemberVO mvo = (MemberVO) session.getAttribute("mvo");
String type = (String) request.getAttribute("type");
String mode = (String) request.getAttribute("mode");
if (mode.equals("modify")) {
	BoardVO bvo = (BoardVO) request.getAttribute("bvo");
}
%>

<div class="container-fluid mb-5">
	<div class="row mb-1">
		<div class="col"></div>
		<div class="col">
			<p class="h3 mb-5">게시글 작성</p>
			<div class="row">
				<div class="col">
					<label for="btype" class="form-label">게시판선택</label> <select
						class="form-select" id="type">
						<c:if test="${mvo.getPermit() eq 9}">
							<option value="notice"
								<c:if test="${type eq 'notice'}">selected</c:if>>공지사항</option>
						</c:if>
						<option value="free"
							<c:if test="${type eq 'free'}">selected</c:if>>유저공간</option>
						<option value="qna" <c:if test="${type eq 'qna'}">selected</c:if>>개발Q&A</option>
						<option value="welcome"
							<c:if test="${type eq 'welcome'}">selected</c:if>>가입인사</option>
						<option value="attendance"
							<c:if test="${type eq 'attendance'}">selected</c:if>>출석부</option>
					</select>
				</div>
				<div class="col">
					<div class="mb-3">
						<label for="writer" class="form-label">작성자</label> <input
							type="text" class="form-control" id="writer"
							value="<%=mvo.getNickname()%>" disabled>
					</div>
				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>
	<div class="row mb-1">
		<div class="col"></div>
		<div class="col">
			<div class="mb-3">
				<label for="title" class="form-label">제목</label> <input type="text"
					class="form-control"
					<c:if test="${mode eq 'modify'}">value="${bvo.getTitle()}"</c:if>
					id="title">
			</div>
		</div>
		<div class="col"></div>
	</div>
	<div class="row mb-1">
		<div class="col"></div>
		<div class="col">
			<div class="mb-3">
				<label for="content" class="form-label">내용</label>
				<textarea class="form-control" id="content" rows="10"><c:if
						test="${mode eq 'modify'}">${bvo.getContent()}</c:if></textarea>
			</div>
		</div>
		<div class="col"></div>
	</div>
	<div class="row mb-1">
		<div class="col"></div>
		<div class="col">
			<div class="row">
				<div class="col">
					<button class="btn btn-outline-secondary" type="button"
						onclick="loadmain('board?action=list&type=<%=type%>&page=1')">돌아가기</button>
				</div>
				<div class="col"></div>
				<div class="col">
					<c:if test="${mode eq 'write'}">
						<button class="btn btn-outline-success float-end" type="button"
							onclick="bwrite();">작성하기</button>
					</c:if>
					<c:if test="${mode eq 'modify'}">
						<button class="btn btn-outline-info float-end" type="button"
							onclick="bmodify(${bvo.getBno()});">수정하기</button>
					</c:if>
				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>
</div>