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
				웹 크롤링
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
				<input class="form-check-input" type="radio" name="level"
					id="level2" value="lv2" checked> <label
					class="form-check-label text-body" for="level2">Lv2(Default)</label>
				<input class="form-check-input" type="radio" name="level"
					id="level3" value="lv3"> <label class="form-check-label"
					for="level3">Lv3</label> <a class="lv_tooltip"
					data-toggle="tooltip" data-bs-placement="right"
					title="사이트의 규모와<br>Lv은 비례합니다.<br>사이트의 규모가 커질수록<br>작업 속도가 오래걸립니다.<br>너무 오래걸린다면<br>Lv을 낮춰서 시도해주세요.">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
  <path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
							d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
</svg>
				</a>
			</div>
			<div class="mb-3">
				<input class="form-check-input" type="radio" name="compress"
					id="zip" value="zip" checked> <label
					class="form-check-label text-body" for="zip">.zip</label> <input
					class="form-check-input" type="radio" name="compress" id="gzip"
					value="gzip"> <label class="form-check-label" for="gzip">.gzip</label>
			</div>
			<div class="d-grid gap-2 col-6 mx-auto">
				<button id="clonebtn" class="btn btn-outline-success" type="button"
					onclick="clone();">Crawling</button>
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
				<label class="col-form-label col-form-label-sm">- 웹 상의 데이터를
					수집하고 분석하기 위해 사용됩니다.</label> <label class="col-form-label col-form-label-sm">-
					웹 자동화된 방식으로 웹 페이지를 탐색하고, 필요한 정보를 추출하여 파일로 저장합니다.</label> <label
					class="col-form-label col-form-label-sm">- 웹 사이트의 정보를 주기적으로
					갱신하거나, 특정 데이터를 추출하기 위해 사용됩니다.</label> <label
					class="col-form-label col-form-label-sm">- 검색 엔진, 가격 비교
					사이트, 뉴스 수집 등 다양한 분야에서 활용됩니다.</label>
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
				<span>(1/3) 사이트를 크롤링하고 있습니다..</span>
			</div>
			<div id="step2-text" style="display: none">
				<div class="spinner-border spinner-border-sm text-info"
					role="status"></div>
				<span>(2/3) 크롤링한 사이트를 압축하고 있습니다..</span>
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
		$('.lv_tooltip').tooltip({
			animation : true,
			container : false,
			html : true,
			selector : false,
			trigger : 'hover focus',
		});

		$('.infosvg').hover(function() {
			$('.infodiv').fadeIn(250);
		}, function() {
			$('.infodiv').fadeOut(250);
		});
	});
</script>