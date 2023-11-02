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
			<p class="h3 mb-5">
				웹 미러링
				<svg class="infosvg" xmlns="http://www.w3.org/2000/svg" width="16"
					height="16" fill="currentColor" class="bi bi-question-circle"
					viewBox="0 0 16 16">
  <path
						d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
						d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
</svg>
			</p>
			<div class="mb-3">
				<input type="text" class="form-control" placeholder="www.mysite.com"
					id="url">
			</div>
			<div class="mb-3">
				<input class="form-check-input" type="radio" name="compress"
					id="zip" value="zip" checked> <label
					class="form-check-label text-body" for="zip">.zip</label> <input
					class="form-check-input" type="radio" name="compress" id="gzip"
					value="gzip"> <label class="form-check-label" for="gzip">.gzip</label>
			</div>
			<div class="d-grid gap-2 col-6 mx-auto">
				<button id="mirroringbtn" class="btn btn-outline-success"
					type="button" onclick="mirroring();">Mirroring</button>
				<button id="loadingbtn" style="display: none"
					class="btn btn-outline-success" type="button" disabled>
					<span class="spinner-border spinner-border-sm" role="status"
						aria-hidden="true"></span> 진행중...
				</button>
				<button id="downloadbtn" style="display: none"
					class="btn btn-outline-success" type="button" onclick="">Download</button>
			</div>
		</div>
		<div class="col">
			<div class="infodiv" style="display: none">
				<label class="col-form-label col-form-label-sm">- 웹 사이트의 정적인
					내용을 로컬 환경에 복제하고 보관하기 위해 사용됩니다.</label> <label
					class="col-form-label col-form-label-sm">- 웹 사이트의 모든 페이지,
					이미지, 스크립트 등을 다운로드하여 로컬에 저장합니다.</label> <label
					class="col-form-label col-form-label-sm">- 웹 사이트의 모든 컨텐츠를
					오프라인으로 사용하거나 백업용으로 활용할 수 있습니다.</label> <label
					class="col-form-label col-form-label-sm">- 웹 사이트의 구조와 디자인을
					그대로 유지하면서 볼 수 있는 장점이 있습니다.</label>
			</div>
		</div>
	</div>
	<div class="row mb-3 text-center">
		<div class="col"></div>
		<div class="col-8">
			<label class="col-form-label col-form-label-sm">사용 시 50포인트가
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
				<span>(1/3) 사이트를 미러링하고 있습니다..</span>
			</div>
			<div id="step2-text" style="display: none">
				<div class="spinner-border spinner-border-sm text-info"
					role="status"></div>
				<span>(2/3) 미러링한 사이트를 압축하고 있습니다..</span>
			</div>
			<div id="step3-text" style="display: none">
				<div class="spinner-border spinner-border-sm text-info"
					role="status"></div>
				<span>(3/3) 완료!</span>
			</div>

		</div>
		<div class="col"></div>
	</div>
</div>
<script>
	$(function() {
		$('.infosvg').hover(function() {
			$('.infodiv').fadeIn(250);
		}, function() {
			$('.infodiv').fadeOut(250);
		});
	});
</script>