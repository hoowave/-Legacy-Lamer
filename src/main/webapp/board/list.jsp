<%@page import="vo.PagingVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberVO mvo = (MemberVO) session.getAttribute("mvo");
ArrayList<BoardVO> blist = (ArrayList) request.getAttribute("blist");
PagingVO pvo = (PagingVO) request.getAttribute("pvo");
String type = (String) request.getAttribute("type");
String title = (String) request.getAttribute("title");
String needlogin = (String) request.getAttribute("needlogin");
%>

<c:if test="${needlogin eq 'on'}">
	<script>
		$(".navbar-toggler").trigger("click");
		$(".loginlabel").trigger("click");
	</script>
</c:if>

<div class="container-fluid mb-5">
	<div class="row">
		<div class="col"></div>
		<div class="col-6">
			<p class="h3 mb-5"><%=title%></p>
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th scope="col" class="w-20">번호</th>
						<th scope="col" class="w-50">제목</th>
						<th scope="col" class="w-20">작성자</th>
						<th scope="col" class="w-20">조회수</th>
					</tr>
				</thead>
				<tbody>

					<c:if test="${blist.isEmpty()}">
						<td colspan="4">작성된 게시글이 없습니다.</td>
					</c:if>

					<c:forEach var="bvo" items="${blist}" varStatus="status">

						<c:if test="${bvo.getDel_yn() eq 'Y'}">
							<tr>
								<td>${status.count}</td>
								<td class="text-secondary" colspan="3">삭제된 게시글 입니다.</td>
							</tr>
						</c:if>

						<c:if test="${bvo.getDel_yn() eq 'N'}">
							<tr onclick="loadmain('board?action=view&bno=${bvo.getBno()}')">
								<td>${status.count}</td>
								<td>${bvo.getTitle()}(${bvo.getCommentnum()})</td>
								<td>${bvo.getWriter()}</td>
								<td>${bvo.getHit()}</td>
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
								<div class="col">
									<c:if test="${type eq 'notice' && mvo.permit eq 9}">
										<button class="btn btn-outline-success float-end"
											type="button"
											onclick="loadmain('board?action=writepage&type=<%=type%>')">글쓰기</button>
									</c:if>
									<c:if test="${type ne 'notice'}">
										<button class="btn btn-outline-success float-end"
											type="button"
											onclick="loadmain('board?action=writepage&type=<%=type%>')">글쓰기</button>
									</c:if>
								</div>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="col"></div>
	</div>
</div>