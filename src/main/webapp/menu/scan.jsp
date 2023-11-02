<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberVO mvo = (MemberVO) session.getAttribute("mvo");
%>
<c:if test="${mvo eq null || mvo.permit eq 1}">
	<script>
		loadmain('include/index.jsp');
		$(".navbar-toggler").trigger("click");
		$(".loginlabel").trigger("click");
	</script>
</c:if>
<div class="container-fluid" style="min-height: 75%">
	<div class="row mb-3">
		<div class="col"></div>
		<div class="col text-center">
			<p class="h3 mb-5">포트를 확인해보세요.</p>
			<div class="row mb-3">
				<div class="col"></div>
				<div class="mb-3">
					<input class="form-check-input" type="radio" name="option"
						id="allbtn" value="all" checked> <label
						class="form-check-label text-body" for="allbtn">전체스캔</label> <input
						class="form-check-input" type="radio" name="option" id="portbtn"
						value="port"> <label class="form-check-label"
						for="portbtn">포트지정</label>
				</div>
				<div class="col"></div>
			</div>
			<div class="row mb-5 alldiv">
				<div class="col"></div>
				<div class="col-10">
					<label for="inputState" class="form-label">IP</label> <input
						type="text" class="form-control" placeholder="127.0.0.1" id="aip">
				</div>
				<div class="col"></div>
			</div>
			<div class="row mb-5 portdiv" style="display: none">
				<div class="col"></div>
				<div class="col-10">
					<div class="row">
						<div class="col">
							<label for="inputState" class="form-label">IP</label> <input
								type="text" class="form-control" placeholder="127.0.0.1"
								id="pip">
						</div>
						<div class="col-3">
							<label for="inputState" class="form-label">PORT</label> <input
								type="text" class="form-control" placeholder="8080" id="port">
						</div>
					</div>
				</div>
				<div class="col"></div>
			</div>
			<div class="d-grid gap-2 col-6 mx-auto">
				<button id="scanbtn" class="btn btn-outline-success" type="button"
					onclick="scan();">Scan</button>
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
	<div class="row mb-5 text-center">
		<div class="col"></div>
		<div class="col-8">
			<label class="col-form-label col-form-label-sm" id="pointinfo">사용
				시 50포인트가 차감됩니다. 포인트 차감 후 금일 23:59까지 포인트 차감 없이 사용할 수 있습니다.</label>
		</div>
		<div class="col"></div>
	</div>
	<div class="row mb-5" id="rsdiv" style="display: none">
		<div class="col"></div>
		<div class="col-4">
			<div class="row mb-1">
				<div class="col text-center">
					<label class="col-form-label col-form-label-sm float-start"
						id="rstarget"></label>
				</div>
				<div class="col">
					<label class="col-form-label col-form-label-sm float-end"
						id="rstime"></label>
				</div>
			</div>
			<table class="table text-center">
				<thead>
					<tr>
						<td>포트</td>
						<td>TCP/UDP</td>
						<td>상태</td>
						<td>서비스명</td>
					</tr>
				</thead>
				<tbody id="rstbl">
				</tbody>
			</table>
		</div>
		<div class="col"></div>
	</div>
</div>
<script>
	$('#allbtn')
			.click(
					function() {
						$('.portdiv').css("display", "none");
						$('.alldiv').css("display", "flex");
						$('#pointinfo')
								.text(
										"사용 시 50포인트가 차감됩니다. 포인트 차감 후 금일 23:59까지 포인트 차감 없이 사용할 수 있습니다.");
					});

	$('#portbtn').click(function() {
		$('.alldiv').css("display", "none");
		$('.portdiv').css("display", "flex");
		$('#pointinfo').text("사용 할 때 마다 10포인트가 차감됩니다.");
	});
</script>