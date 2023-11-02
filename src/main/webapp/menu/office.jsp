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
			<p class="h3 mb-5">문서파일의 암호를 찾아보세요.</p>
			<div class="mb-3">
				<input class="form-check-input" type="radio" name="option"
					id="default" value="default" checked> <label
					class="form-check-label text-body" for="default">Default</label> <input
					class="form-check-input" type="radio" name="option" id="custom"
					value="custom"> <label class="form-check-label"
					for="custom">Custom</label> <a class="option_tooltip"
					data-toggle="tooltip" data-bs-placement="right"
					title="기본적으로 추측하여 암호를 찾아내지만, 사전파일을 통해 암호를 찾아낼수도 있습니다."> <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
  <path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
							d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
</svg>
				</a>
			</div>
			<div class="mb-5 option_default file_tooltip" data-toggle="tooltip"
				data-bs-placement="right"
				title="허용하는 확장자<br>한글 : docx<br>파워포인트 : ppt, pptx<br>엑셀 : xls, xlsx">
				<label for="defaultfile" class="form-label">문서파일 선택</label> <input
					class="form-control" type="file" id="defaultfile">
			</div>
			<div class="row mb-5 option_custom" style="display: none">
				<div class="col file_tooltip" data-toggle="tooltip"
					data-bs-placement="right"
					title="허용하는 확장자<br>한글 : docx<br>파워포인트 : ppt, pptx<br>엑셀 : xls, xlsxz">
					<label for="customfile" class="form-label">문서파일 선택</label> <input
						class="form-control" type="file" id="customfile">
				</div>
				<div class="col dictionary_tooltip" data-toggle="tooltip"
					data-bs-placement="right" title="허용하는 확장자<br>.txt">
					<label for="txtfile" class="form-label">사전파일 선택</label> <input
						class="form-control " type="file" id="txtfile">
				</div>
			</div>
			<div class="d-grid gap-2 col-6 mx-auto">
				<button id="officebtn" class="btn btn-outline-success" type="button"
					onclick="office();">Decryption</button>
				<button id="loadingbtn" style="display: none"
					class="btn btn-outline-success" type="button" disabled>
					<span class="spinner-border spinner-border-sm" role="status"
						aria-hidden="true"></span> 진행중...
				</button>
				<button id="successbtn" style="display: none"
					class="btn btn-outline-success" type="button" disabled>완료!</button>
			</div>
		</div>
		<div class="col"></div>
	</div>
	<div class="row mb-3 text-center">
		<div class="col"></div>
		<div class="col-8">
			<label class="col-form-label col-form-label-sm">사용 시 50포인트가
				차감됩니다. 포인트 차감 후 금일 23:59까지 포인트 차감 없이 사용할 수 있습니다.</label>
		</div>
		<div class="col"></div>
	</div>
	<div class="row mb-5">
		<div class="col"></div>
		<div class="col">
			<div id="step1-text" style="display: none">
				<div class="spinner-border spinner-border-sm text-info"
					role="status"></div>
				<span>(1/3) 파일을 서버에 업로드 중입니다..</span>
			</div>
			<div id="step2-text" style="display: none">
				<div class="spinner-border spinner-border-sm text-info"
					role="status"></div>
				<span>(2/3) 파일을 분석중입니다..</span>
			</div>
			<div id="step3-text" style="display: none">
				<div class="spinner-border spinner-border-sm text-info"
					role="status"></div>
				<span>(3/3) 완료!</span>
			</div>

		</div>
		<div class="col"></div>
	</div>
	<div class="row mb-5 text-center">
		<div class="col"></div>
		<div class="col" id="resultdiv" style="display: none">
			<p>
				해당 파일의 비밀번호는 "<span class="fw-bold" id="resulttext"></span>" 입니다.
			</p>
		</div>
		<div class="col"></div>
	</div>
</div>

<script>
	$(function() {
		$("#defaultfile").on("change", function() {
			let filename = this.files[0].name;
			if (!officechk(filename)) {
				alert("확장자가 .docx .ppt .pptx .xls .xlsx인\n파일만 업로드 할 수 있습니다.");
				$(this).val("");
				return false;
			}
		});

		$("#customfile").on("change", function() {
			let filename = this.files[0].name;
			if (!officechk(filename)) {
				alert("확장자가 .docx .ppt .pptx .xls .xlsx인\n파일만 업로드 할 수 있습니다.");
				$(this).val("");
				return false;
			}
		});

		$("#txtfile").on("change", function() {
			let filename = this.files[0].name;
			if (!archivetxtchk(filename)) {
				alert("확장자가 .txt인 파일만 업로드 할 수 있습니다.");
				$(this).val("");
				return false;
			}
		});

		$('.option_tooltip').tooltip({
			animation : true,
			container : false,
			html : true,
			selector : false,
			trigger : 'hover focus',
		});

		$('.file_tooltip').tooltip({
			animation : true,
			container : false,
			html : true,
			selector : false,
			trigger : 'hover focus',
		});

		$('.dictionary_tooltip').tooltip({
			animation : true,
			container : false,
			html : true,
			selector : false,
			trigger : 'hover focus',
		});

		$('#default').click(function() {
			$('.option_custom').css("display", "none");
			$('.option_default').css("display", "block");
		});

		$('#custom').click(function() {
			$('.option_default').css("display", "none");
			$('.option_custom').css("display", "flex");
		});
	});
</script>