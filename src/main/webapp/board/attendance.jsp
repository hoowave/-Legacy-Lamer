<%@page import="vo.PagingVO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberVO mvo = (MemberVO) session.getAttribute("mvo");
ArrayList<BoardVO> blist = (ArrayList) request.getAttribute("blist");
PagingVO pvo = (PagingVO) request.getAttribute("pvo");
String type = (String) request.getAttribute("type");
String title = (String) request.getAttribute("title");
%>
<div class="container-fluid mb-5">
	<div class="row">
		<div class="col"></div>
		<div class="col-6">
			<p class="h3 mb-5"><%=title%></p>
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th scope="col" class="w-10">번호</th>
						<th scope="col" class="w-50">내용</th>
						<th scope="col" class="w-25">작성자</th>
					</tr>
				</thead>
				<tbody>

					<c:if test="${blist.isEmpty()}">
						<td colspan="3">작성된 출석이 없습니다.</td>
					</c:if>

					<c:forEach var="bvo" items="${blist}" varStatus="status">

						<c:if test="${bvo.getDel_yn() eq 'Y'}">
							<tr>
								<td>${status.count}</td>
								<td class="text-secondary" colspan="3">삭제된 게시글 입니다.</td>
							</tr>
						</c:if>

						<c:if test="${bvo.getDel_yn() eq 'N'}">
							<tr>
								<td>${status.count}</td>
								<td>${bvo.getTitle()}</td>
								<td>${bvo.getWriter()}</td>
							</tr>
						</c:if>

					</c:forEach>

				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
							<div class="row">
								<div class="col"></div>
								<div class="col">
									<nav>
										<ul class="pagination pagination-sm justify-content-center">
											<li
												class="page-item <c:if test="${pvo.getPage() == 1}">disabled</c:if>"><a
												class="page-link" href="javascript:void(0);"
												onclick="loadmain('board?action=list&type=<%=type%>&page=1')">
													<span aria-hidden="true">&laquo;</span>
											</a></li>
											<c:forEach var="i" begin="1" end="${pvo.getMaxpage()}">
												<li
													class="page-item <c:if test="${pvo.getPage() == i}">disabled</c:if>"><a
													class="page-link" href="javascript:void(0);"
													onclick="loadmain('board?action=list&type=<%=type%>&page=${i}')">${i}</a></li>
											</c:forEach>
											<li
												class="page-item <c:if test="${pvo.getPage() == pvo.getMaxpage()}">disabled</c:if>"><a
												class="page-link" href="javascript:void(0);"
												onclick="loadmain('board?action=list&type=<%=type%>&page=${pvo.getMaxpage()}')">
													<span aria-hidden="true">&raquo;</span>
											</a></li>
										</ul>
									</nav>
								</div>
								<div class="col"></div>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			<label class="col-form-label col-form-label-sm">매일 최초 출석 시
				50포인트를 지급합니다.</label>
			<c:if test="${mvo eq NULL}">
				<div class="input-group my-3">
					<span class="input-group-text">출석부</span>
					<textarea class="form-control" disabled>로그인이 필요합니다.</textarea>
					<button class="btn btn-outline-secondary" type="button"
						onclick="login_show();">로그인</button>
				</div>
			</c:if>
			<c:if test="${mvo ne NULL}">
				<div class="input-group my-3">
					<span class="input-group-text" id="writer">${mvo.getNickname()}</span>
					<textarea class="form-control" id="title">${svo.getSentense()}</textarea>
					<button class="btn btn-outline-secondary" type="button"
						onclick="awrite();">출석</button>
				</div>
			</c:if>
		</div>
		<div class="col"></div>
	</div>
</div>