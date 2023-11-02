<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberVO mvo = (MemberVO) session.getAttribute("mvo");
%>
<c:if test="${mvo eq null}">
	<script>
		loadmain('include/index.jsp');
		$(".navbar-toggler").trigger("click");
		$(".loginlabel").trigger("click");
	</script>
</c:if>
<div class="container-fluid h-75">
	<div class="row mb-3">
		<div class="col"></div>
		<div class="col text-center">
			<p class="h3 mb-5">사전 파일을 만들어보세요.</p>
			<div class="row mb-3">
				<div class="col"></div>
				<div class="col-md-4">
					<label for="inputState" class="form-label">최소 자리 수</label> <input
						type="text" class="form-control" placeholder="1~8" id="num1">
				</div>
				<div class="col"></div>
				<div class="col-md-4">
					<label for="inputState" class="form-label">최대 자리 수</label> <input
						type="text" class="form-control" placeholder="1~8" id="num2">
				</div>
				<div class="col"></div>
			</div>
			<div class="row mb-5">
				<div class="col"></div>
				<div class="col-10">
					<label for="inputState" class="form-label">문자</label> <input
						type="text" class="form-control"
						placeholder="0123456789abcdefghijklmnopqrstuvwxyz" id="str">
				</div>
				<div class="col"></div>
			</div>
			<div class="d-grid gap-2 col-6 mx-auto">
				<button id="dictionarybtn" class="btn btn-outline-success"
					type="button" onclick="dictionary();">Make Dictionary</button>
				<button id="loadingbtn" style="display: none"
					class="btn btn-outline-success" type="button" disabled>
					<span class="spinner-border spinner-border-sm" role="status"
						aria-hidden="true"></span> 진행중...
				</button>
			</div>
			<div class="mb-5" id="downloaddiv" style="display: none">
				<div class="d-grid gap-2 col-6 mx-auto">
					<a href="http://192.168.0.185/file/result.txt"
						class="btn btn-outline-success" type="button">Link</a> <label
						class="col-form-label col-form-label-sm">"다른 이름으로 링크 저장"
						하세요.</label>
				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>
	<div class="row mb-3 text-center">
		<div class="col"></div>
		<div class="col-8">
			<label class="col-form-label col-form-label-sm">사용 시 20포인트가
				차감됩니다. 포인트 차감 후 금일 23:59까지 포인트 차감 없이 사용할 수 있습니다.</label>
		</div>
		<div class="col"></div>
	</div>
	<div class="row">
		<div class="col"></div>
		<div class="col">
			<div id="step1-text" style="display: none">
				<div class="spinner-border spinner-border-sm text-info"
					role="status"></div>
				<span>(1/2) 사전 파일을 생성하고 있습니다..</span>
			</div>
			<div id="step2-text" style="display: none">
				<div class="spinner-border spinner-border-sm text-info"
					role="status"></div>
				<span>(2/2) 완료!</span>
			</div>
		</div>
		<div class="col"></div>
	</div>

</div>