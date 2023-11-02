<%@page import="vo.BoardVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="vo.PagingVO"%>
<%@page import="vo.CommentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberVO mvo = (MemberVO) session.getAttribute("mvo");
ArrayList<CommentVO> clist = (ArrayList) request.getAttribute("clist");
PagingVO pvo = (PagingVO) request.getAttribute("pvo");
int bno = (int) request.getAttribute("bno");
%>
<c:if test="${clist.isEmpty()}">
	<div class="text-center mb-3">
		<p class="mb-1">작성된 댓글이 없습니다.</p>
	</div>
</c:if>
<c:forEach var="cvo" items="${clist}" varStatus="status">
	<c:if test="${cvo.getDel_yn() eq 'Y' && cvo.getRn() == 1}">
		<div class="list-group">
			<a class="list-group-item list-group-item-action mb-1"
				aria-current="true">
				<div class="d-flex w-100 justify-content-between">
					<small class="mb-1 text-dark">삭제된 댓글입니다.</small>
				</div>
			</a>
		</div>
	</c:if>
	<c:if test="${cvo.getDel_yn() eq 'N' && cvo.getRn() == 1}">
		<div class="list-group reply${cvo.getGroupno()} cno${cvo.getCno()}">
			<a class="list-group-item list-group-item-action mb-1"
				aria-current="true">
				<div class="d-flex w-100 justify-content-between mb-1">
					<p class="mb-1 text-info">작성자 : ${cvo.getWriter()}</p>
					<small>작성일 : ${cvo.getDate()}</small>
				</div>
				<div class="d-flex w-100 justify-content-between">
					<div>
						<p class="text-dark">${cvo.getContent()}</p>
					</div>
					<div>
						<c:if test="${mvo.getNickname() ne null}">
							<button class="btn btn-outline-secondary btn-sm comment_ctl"
								type="button" id="reply"
								onclick="loadreply(${cvo.getGroupno()})">답글</button>
						</c:if>
						<c:if
							test="${mvo.getNickname() eq cvo.getWriter() || mvo.getPermit() eq 9}">
							<button class="btn btn-outline-success btn-sm comment_ctl"
								type="button" id="modify" onclick="loadmodify(${cvo.getCno()})">수정</button>
						</c:if>
						<c:if
							test="${mvo.getNickname() eq cvo.getWriter() || mvo.getPermit() eq 9}">
							<button class="btn btn-outline-danger btn-sm comment_ctl"
								type="button" id="delete"
								onclick="commentdelete(${cvo.getCno()})">삭제</button>
						</c:if>
					</div>
				</div>
			</a>
		</div>
	</c:if>
	<c:if test="${cvo.getDel_yn() eq 'Y' && cvo.getRn() != 1}">
		<div class="row">
			<div class="col"></div>
			<div class="col-11">
				<div class="list-group">
					<a class="list-group-item list-group-item-action mb-1"
						aria-current="true">
						<div class="d-flex w-100 justify-content-between">
							<small class="mb-1 text-dark">삭제된 댓글입니다.</small>
						</div>
					</a>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${cvo.getDel_yn() eq 'N' && cvo.getRn() != 1}">
		<div class="row">
			<div class="col"></div>
			<div class="col-11">
				<div class="list-group cno${cvo.getCno()}">
					<a class="list-group-item list-group-item-action mb-1"
						aria-current="true">
						<div class="d-flex w-100 justify-content-between mb-1">
							<p class="mb-1 text-info">작성자 : ${cvo.getWriter()}</p>
							<small>작성일 : ${cvo.getDate()}</small>
						</div>
						<div class="d-flex w-100 justify-content-between">
							<div>
								<p class="text-dark">${cvo.getContent()}</p>
							</div>
							<div>
								<c:if
									test="${mvo.getNickname() eq cvo.getWriter() || mvo.getPermit() eq 9}">
									<button class="btn btn-outline-success btn-sm comment_ctl"
										type="button" id="modify"
										onclick="loadmodify(${cvo.getCno()})">수정</button>
								</c:if>
								<c:if
									test="${mvo.getNickname() eq cvo.getWriter() || mvo.getPermit() eq 9}">
									<button class="btn btn-outline-danger btn-sm comment_ctl"
										type="button" id="delete"
										onclick="commentdelete(${cvo.getCno()})">삭제</button>
								</c:if>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</c:if>
</c:forEach>
<div class="row">
	<div class="col"></div>
	<div class="col">
		<nav>
			<ul class="pagination pagination-sm justify-content-center">
				<li
					class="page-item <c:if test="${pvo.getPage() == 1}">disabled</c:if>"><a
					class="page-link" href="javascript:void(0);"
					onclick="loadcomment(${bno},1)"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach var="i" begin="1" end="${pvo.getMaxpage()}">
					<li
						class="page-item <c:if test="${pvo.getPage() == i}">disabled</c:if>"><a
						class="page-link" href="javascript:void(0);"
						onclick="loadcomment(${bno},${i})">${i}</a></li>
				</c:forEach>
				<li
					class="page-item <c:if test="${pvo.getPage() == pvo.getMaxpage()}">disabled</c:if>"><a
					class="page-link" href="javascript:void(0);"
					onclick="loadcomment(${bno},${pvo.getMaxpage()})"> <span
						aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
	<div class="col"></div>
</div>
<c:if test="${mvo eq NULL}">
	<div class="input-group my-3">
		<span class="input-group-text">댓글</span>
		<textarea class="form-control" disabled>로그인이 필요합니다.</textarea>
		<button class="btn btn-outline-secondary" type="button"
			onclick="login_show();">로그인</button>
	</div>
</c:if>
<c:if test="${mvo ne NULL}">
	<div class="input-group my-3">
		<span class="input-group-text">${mvo.getNickname()}</span>
		<textarea class="form-control" id="commentcontent"></textarea>
		<button class="btn btn-outline-secondary" type="button"
			onclick="commentwrite();">댓글작성</button>
	</div>
</c:if>

<script>
function loadreply(num){
	$('.replydiv').remove();
	$('.modifydiv').remove();
	$('.reply'+num).append(`
			<div class="row">
				<div class="col"></div>
				<div class="col-11">
					<div class="input-group my-3 replydiv" id=`+num+`>
					<span class="input-group-text">${mvo.getNickname()}</span>
					<textarea class="form-control" id="replycontent"></textarea>
					<button class="btn btn-outline-secondary" type="button"
					onclick="replywrite();">답글작성</button>
				</div>
				</div>
			</div>
			`)
}

function loadmodify(num){
	$.ajax({
		url: '/project/comment',
		type: "post",
		async: false,
		data: {
			action: 'replycontent',
			cno: num,
		},
		success: function(result) {
			$('.replydiv').remove();
			$('.modifydiv').remove();
			$('.cno'+num).append(`
					<div class="row">
					<div class="col"></div>
					<div class="col-11">
						<div class="input-group my-3 modifydiv" id=`+num+`>
						<span class="input-group-text">${mvo.getNickname()}</span>
						<textarea class="form-control" id="modifycontent">`+result+`</textarea>
						<button class="btn btn-outline-secondary" type="button"
						onclick="commentmodify();">수정하기</button>
					</div>
					</div>
				</div>
				`)
		},
		error: function(xhr, status, error) {
			alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
		}
	})
}
</script>