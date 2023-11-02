function office() {
	if (!ispay('office')) {
		if (!ispoint(50)) {
			return false;
		}
	}
	$('#officebtn').css("display", "none");
	$('#loadingbtn').css("display", "block");
	$('#step1-text').css("display", "block");
	$('#default').attr("disabled", true);
	$('#default').attr("disabled", true);
	$('#defaultfile').attr("disabled", true);
	$('#customfile').attr("disabled", true);
	$('#txtfile').attr("disabled", true);

	let option = $("input[name='option']:checked").val();
	let file;
	let filename;
	let txt;
	let txtname;

	if (option == "default") {
		file = $("#defaultfile")[0].files[0];
		filename = $("#defaultfile")[0].files[0].name;

		var form = new FormData();
		form.append("file", file);

		$.ajax({
			url: '/project/upload',
			type: "post",
			enctype: 'multipart/form-data',
			async: false,
			processData: false,
			contentType: false,
			cache: false,
			data: form,
			success: function(result) {
				if (result == 200) {
					$('#step1-text').children('span').text('(1/3) 파일을 서버에 업로드 중입니다.. 완료!');
					$('#step1-text').children('.spinner-border').remove();
					$('#step2-text').css("display", "block");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})

	}

	if (option == "custom") {
		file = $("#customfile")[0].files[0];
		filename = $("#customfile")[0].files[0].name;
		txt = $("#txtfile")[0].files[0];
		txtname = $("#txtfile")[0].files[0].name;

		var form = new FormData();
		form.append("file", file);

		$.ajax({
			url: '/project/upload',
			type: "post",
			enctype: 'multipart/form-data',
			async: false,
			processData: false,
			contentType: false,
			cache: false,
			data: form,
			success: function(result) {
				if (result == 200) {
					var form2 = new FormData();
					form2.append("file", txt);

					$.ajax({
						url: '/project/upload',
						type: "post",
						enctype: 'multipart/form-data',
						async: false,
						processData: false,
						contentType: false,
						cache: false,
						data: form2,
						success: function(result) {
							if (result == 200) {
								$('#step1-text').children('span').text('(1/3) 파일을 서버에 업로드 중입니다.. 완료!');
								$('#step1-text').children('.spinner-border').remove();
								$('#step2-text').css("display", "block");
							}
						},
						error: function(xhr, status, error) {
							alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
						}
					})
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}

	setTimeout(function() {
		$.ajax({
			url: '/project/action',
			type: "post",
			data: {
				type: 'office',
				option: option,
				filename: filename,
				txtname: txtname
			},
			success: function(result) {
				$('#step2-text').children('span').text('(2/3) 파일을 분석중입니다.. 완료!');
				$('#step2-text').children('.spinner-border').remove();
				$('#step3-text').css("display", "block");
				$('#step3-text').children('.spinner-border').remove();
				$('#loadingbtn').css("display", "none");
				$('#successbtn').css("display", "block");
				$('#resultdiv').css("display", "block");
				$('#resulttext').text(result);
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);

}

function archive() {
	if (!ispay('archive')) {
		if (!ispoint(50)) {
			return false;
		}
	}
	$('#archivebtn').css("display", "none");
	$('#loadingbtn').css("display", "block");
	$('#step1-text').css("display", "block");
	$('#default').attr("disabled", true);
	$('#default').attr("disabled", true);
	$('#defaultfile').attr("disabled", true);
	$('#customfile').attr("disabled", true);
	$('#txtfile').attr("disabled", true);

	let option = $("input[name='option']:checked").val();
	let file;
	let filename;
	let txt;
	let txtname;
	if (option == "default") {
		file = $("#defaultfile")[0].files[0];
		filename = $("#defaultfile")[0].files[0].name;

		var form = new FormData();
		form.append("file", file);

		$.ajax({
			url: '/project/upload',
			type: "post",
			enctype: 'multipart/form-data',
			async: false,
			processData: false,
			contentType: false,
			cache: false,
			data: form,
			success: function(result) {
				if (result == 200) {
					$('#step1-text').children('span').text('(1/3) 파일을 서버에 업로드 중입니다.. 완료!');
					$('#step1-text').children('.spinner-border').remove();
					$('#step2-text').css("display", "block");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})

	}
	if (option == "custom") {
		file = $("#customfile")[0].files[0];
		filename = $("#customfile")[0].files[0].name;
		txt = $("#txtfile")[0].files[0];
		txtname = $("#txtfile")[0].files[0].name;

		var form = new FormData();
		form.append("file", file);

		$.ajax({
			url: '/project/upload',
			type: "post",
			enctype: 'multipart/form-data',
			async: false,
			processData: false,
			contentType: false,
			cache: false,
			data: form,
			success: function(result) {
				if (result == 200) {
					var form2 = new FormData();
					form2.append("file", txt);

					$.ajax({
						url: '/project/upload',
						type: "post",
						enctype: 'multipart/form-data',
						async: false,
						processData: false,
						contentType: false,
						cache: false,
						data: form2,
						success: function(result) {
							if (result == 200) {
								$('#step1-text').children('span').text('(1/3) 파일을 서버에 업로드 중입니다.. 완료!');
								$('#step1-text').children('.spinner-border').remove();
								$('#step2-text').css("display", "block");
							}
						},
						error: function(xhr, status, error) {
							alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
						}
					})
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})

	}

	setTimeout(function() {
		$.ajax({
			url: '/project/action',
			type: "post",
			data: {
				type: 'archive',
				option: option,
				filename: filename,
				txtname: txtname
			},
			success: function(result) {
				$('#step2-text').children('span').text('(2/3) 파일을 분석중입니다.. 완료!');
				$('#step2-text').children('.spinner-border').remove();
				$('#step3-text').css("display", "block");
				$('#step3-text').children('.spinner-border').remove();
				$('#loadingbtn').css("display", "none");
				$('#successbtn').css("display", "block");
				$('#resultdiv').css("display", "block");
				$('#resulttext').text(result);
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}

function officechk(fileName) {
	let ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length);
	if (ext != 'docx' && ext != 'ppt' && ext != 'pptx' && ext != 'xls' && ext != 'xlsx') {
		return false;
	}
	return true;
}

function archivechk(fileName) {
	let ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length);
	if (ext != 'zip' && ext != 'rar' && ext != '7z' && ext != 'egg' && ext != 'tar' && ext != 'gz') {
		return false;
	}
	return true;
}

function archivetxtchk(fileName) {
	let ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length);
	if (ext != 'txt') {
		return false;
	}
	return true;
}

function mirroring() {
	if (!ispay('mirroring')) {
		if (!ispoint(50)) {
			return false;
		}
	}
	$('#mirroringbtn').css("display", "none");
	$('#loadingbtn').css("display", "block");
	$('#step1-text').css("display", "block");
	$('#url').attr("disabled", true);
	$('#zip').attr("disabled", true);
	$('#tar').attr("disabled", true);
	setTimeout(function() {
		$.ajax({
			url: '/project/action',
			type: "post",
			async: false,
			data: {
				type: 'mirroring',
				step: '1',
				url: $('#url').val()
			},
			success: function(result) {
				if (result == 200) {
					$('#step1-text').children('span').text('(1/3) 사이트를 미러링하고 있습니다.. 완료!');
					$('#step1-text').children('.spinner-border').remove();
					$('#step2-text').css("display", "block");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
	setTimeout(function() {
		$.ajax({
			url: '/project/action',
			type: "post",
			data: {
				type: 'mirroring',
				step: '2',
				compress: $("input[name='compress']:checked").val()
			},
			async: false,
			success: function(result) {
				$('#step2-text').children('span').text('(2/3) 미러링한 사이트를 압축하고 있습니다.. 완료!');
				$('#step2-text').children('.spinner-border').remove();
				$('#step3-text').css("display", "block");
				$('#step3-text').children('span').text('(3/3) 완료!');
				$('#step3-text').children('.spinner-border').remove();
				$('#loadingbtn').css("display", "none");
				$('#downloadbtn').css("display", "block");
				if (result == 200) {
					$('#downloadbtn').attr("onclick", "zipdownload();");
				}
				if (result == 201) {
					$('#downloadbtn').attr("onclick", "gzipdownload();");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}

function scan() {
	let option = $("input[name='option']:checked").val();
	let ip;
	let port;
	if (option == 'all') {
		if (!ispay('scan')) {
			if (!ispoint(50)) {
				return false;
			}
		}
		ip = $('#aip').val();
	}
	if (option == 'port') {
		if (!ispoint(10)) {
			return false;
		}
		ip = $('#pip').val();
		port = $('#port').val();
	}
	$('#scanbtn').css("display", "none");
	$('#loadingbtn').css("display", "block");
	$('#aip').attr("disabled", true);
	$('#pip').attr("disabled", true);
	$('#port').attr("disabled", true);
	$('#allbtn').attr("disabled", true);
	$('#portbtn').attr("disabled", true);

	setTimeout(function() {
		$.ajax({
			url: '/project/action',
			type: "post",
			data: {
				type: 'scan',
				step: option,
				ip: ip,
				port: port
			},
			success: function(result) {
				let rjson = JSON.parse(result);
				$('#loadingbtn').css("display", "none");
				$('#successbtn').css("display", "block");
				$('#rsdiv').css("display", "flex");
				$('#rstarget').text(rjson[0]);
				$('#rstime').text(rjson[1]);
				for (var i = 2; i < rjson.length; i = i + 3) {
					var rs1 = rjson[i].split("/");
					$('#rstbl').append(
						`<tr>
								<td>`+ rs1[0] + `</td>
								<td>`+ rs1[1] + `</td>
								<td>`+ rjson[i + 1] + `</td>
								<td>`+ rjson[i + 2] + `</td>
							</tr>`
					);
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}


function dictionary() {
	if (!ispay('dictionary')) {
		if (!ispoint(20)) {
			return false;
		}
	}
	$('#dictionarybtn').css("display", "none");
	$('#loadingbtn').css("display", "block");
	$('#step1-text').css("display", "block");
	$('#num1').attr("disabled", true);
	$('#num2').attr("disabled", true);
	$('#str').attr("disabled", true);
	setTimeout(function() {
		$.ajax({
			url: '/project/action',
			type: "post",
			async: false,
			data: {
				type: 'dictionary',
				step: '1',
				num1: $('#num1').val(),
				num2: $('#num2').val(),
				str: $('#str').val()
			},
			success: function(result) {
				if (result == 200) {
					$('#step1-text').children('span').text('(1/2) 사전 파일을 생성하고 있습니다.. 완료!');
					$('#step1-text').children('.spinner-border').remove();
					$('#step2-text').css("display", "block");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
	setTimeout(function() {
		$('#step2-text').children('span').text('(2/2) 완료!');
		$('#step2-text').children('.spinner-border').remove();
		$('#loadingbtn').css("display", "none");
		$('#downloaddiv').css("display", "block");
	}, 500);
}

function clone() {
	if (!ispay('clone')) {
		if (!ispoint(50)) {
			return false;
		}
	}
	$('#clonebtn').css("display", "none");
	$('#loadingbtn').css("display", "block");
	$('#step1-text').css("display", "block");
	$('#url').attr("disabled", true);
	$('#level2').attr("disabled", true);
	$('#level3').attr("disabled", true);
	$('#zip').attr("disabled", true);
	$('#tar').attr("disabled", true);
	setTimeout(function() {
		$.ajax({
			url: '/project/action',
			type: "post",
			async: false,
			data: {
				type: 'clone',
				step: '1',
				level: $("input[name='level']:checked").val(),
				url: $('#url').val()
			},
			success: function(result) {
				if (result == 200) {
					$('#step1-text').children('span').text('(1/3) 사이트를 크롤링하고 있습니다.. 완료!');
					$('#step1-text').children('.spinner-border').remove();
					$('#step2-text').css("display", "block");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
	setTimeout(function() {
		$.ajax({
			url: '/project/action',
			type: "post",
			data: {
				type: 'clone',
				step: '2'
			},
			async: false,
			success: function(result) {
				if (result == 200) {
					$('#step2-text').children('span').text('(2/3) 크롤링한 사이트를 압축하고 있습니다.. 완료!');
					$('#step2-text').children('.spinner-border').remove();
					$('#step3-text').css("display", "block");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
	setTimeout(function() {
		$.ajax({
			url: '/project/action',
			type: "post",
			data: {
				type: 'clone',
				compress: $("input[name='compress']:checked").val(),
				step: '3'
			},
			async: false,
			success: function(result) {
				$('#step3-text').children('span').text('(3/3) 완료!');
				$('#step3-text').children('.spinner-border').remove();
				$('#loadingbtn').css("display", "none");
				$('#downloadbtn').css("display", "block");
				if (result == 200) {
					$('#downloadbtn').attr("onclick", "zipdownload();");
				}
				if (result == 201) {
					$('#downloadbtn').attr("onclick", "gzipdownload();");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}

function ispay(action) {
	let code;
	$.ajax({
		url: '/project/member',
		type: "post",
		async: false,
		data: {
			type: 'todaypay',
			action: action
		},
		success: function(result) {
			code = result;
		},
		error: function(xhr, status, error) {
			alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
		}
	})
	if (code == 200) {
		return true;
	} else {
		return false;
	}
}

function ispoint(point) {
	let code;
	$.ajax({
		url: '/project/member',
		type: "post",
		async: false,
		data: {
			type: 'ispoint',
			point: point
		},
		success: function(result) {
			code = result;
		},
		error: function(xhr, status, error) {
			alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
		}
	})

	if (code == 200) {
		if (confirm("사용 시 " + point + "포인트가 차감됩니다.\n기능에 따라 포인트 차감 후 금일 23:59까지 포인트 차감 없이\n사용할 수 있습니다. 진행하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	} else {
		alert("보유 포인트가 부족합니다.");
		return false;
	}
}


function newpage(url) {
	window.open(url, "_blank");
}

function zipdownload() {
	window.open("http://192.168.0.185/file/result.zip", "_blank");
}

function gzipdownload() {
	window.open("http://192.168.0.185/file/result.tar.gz", "_blank");
}

function loadmain(file) {
	$(".btn-close").trigger("click");
	$(".maincontent").fadeOut(500, function() {
		$(".maincontent").load(file, function() {
			$(".maincontent").fadeIn(500);
		});
	})
}

function logout() {
	$.ajax({
		url: '/project/member?type=logout',
		type: "post",
		data: {},
		success: function(result) {
			if (result == 'true') {
				alert("로그아웃 되었습니다.");
				location.href = "/project/";
			}
		},
		error: function(xhr, status, error) {
			alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
		}
	})
}

function login() {
	$.ajax({
		url: '/project/member?type=login',
		type: "post",
		data: {
			login_id: $('#login_id').val(),
			login_pw: $('#login_pw').val()
		},
		success: function(result) {
			if (result != 'false') {
				alert(result + "님 환영합니다.");
				location.href = "/project/";
			} else {
				alert("아이디 또는 비밀번호를 확인해주세요.");
			}
		},
		error: function(xhr, status, error) {
			alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
		}
	})
}

function register() {
	$.ajax({
		url: '/project/member?type=register',
		type: "post",
		data: {
			register_id: $('#register_id').val(),
			register_pw: $('#register_pw').val(),
			register_confirm_pw: $('#register_confirm_pw').val(),
			register_email: $('#register_email').val(),
			register_nickname: $('#register_nickname').val()
		},
		success: function(result) {
			if (result == 'true') {
				alert("회원가입 성공");
				location.href = "/project/";
			} else {
				alert("회원가입 실패");
			}
		},
		error: function(xhr, status, error) {
			alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
		}

	})
}

function login_show() {
	$(".navbar-toggler").trigger("click");
	$(".loginlabel").trigger("click");
}

$('.loginlabel').click(function() {
	$('.registerform').css("display", "none");
	$('.loginform').fadeIn(1000);
});

$('.registerlabel').click(function() {
	$('.loginform').css("display", "none");
	$('.registerform').fadeIn(1000);
});
