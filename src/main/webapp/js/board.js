function commentdelete(num) {
	setTimeout(function() {
		$.ajax({
			url: '/project/comment',
			type: "post",
			data: {
				action: 'delete',
				cno: num,
			},
			success: function(result) {
				if (result == '200') {
					alert("댓글 삭제가 완료되었습니다.");
					loadcomment($("#comment_load").attr("bno"), 1);
				} else {
					alert("ERROR! 관리자에게 문의주세요.");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}

function commentmodify() {
	setTimeout(function() {
		$.ajax({
			url: '/project/comment',
			type: "post",
			data: {
				action: 'modify',
				cno: $(".modifydiv").attr("id"),
				modifycontent: $("#modifycontent").val()
			},
			success: function(result) {
				if (result == '200') {
					alert("댓글 수정이 완료되었습니다.");
					loadcomment($("#comment_load").attr("bno"), 1);
				} else {
					alert("ERROR! 관리자에게 문의주세요.");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}

function replywrite() {
	setTimeout(function() {
		$.ajax({
			url: '/project/comment',
			type: "post",
			data: {
				action: 'replywrite',
				bno: $("#comment_load").attr("bno"),
				groupno: $(".replydiv").attr("id"),
				replycontent: $("#replycontent").val()
			},
			success: function(result) {
				if (result == '200') {
					alert("답글 작성이 완료되었습니다.");
					loadcomment($("#comment_load").attr("bno"), 1);
				} else {
					alert("ERROR! 관리자에게 문의주세요.");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}

function commentwrite() {
	setTimeout(function() {
		$.ajax({
			url: '/project/comment',
			type: "post",
			data: {
				action: 'write',
				bno: $("#comment_load").attr("bno"),
				content: $("#commentcontent").val()
			},
			success: function(result) {
				if (result == '200') {
					alert("댓글 작성이 완료되었습니다.");
					loadcomment($("#comment_load").attr("bno"), 1);
				} else {
					alert("ERROR! 관리자에게 문의주세요.");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}

function loadcomment(bno, page) {
	$(".btn-close").trigger("click");
	$("#comment_load").fadeOut(300, function() {
		$("#comment_load").load("comment?action=view&bno=" + bno + "&page=" + page, function() {
			$("#comment_load").fadeIn(300);
		});
	})
}

function bdelete(type, bno) {
	setTimeout(function() {
		$.ajax({
			url: '/project/board',
			type: "post",
			data: {
				action: 'delete',
				type: type,
				bno: bno
			},
			success: function(result) {
				if (result != 'false') {
					alert("게시글 삭제가 완료되었습니다.");
					loadmain('board?action=list&type=' + result + '&page=1');
				} else {
					alert("ERROR! 관리자에게 문의주세요.");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}

function bmodify(bno) {
	setTimeout(function() {
		$.ajax({
			url: '/project/board',
			type: "post",
			data: {
				action: 'modify',
				bno: bno,
				type: $("#type option:selected").val(),
				title: $("#title").val(),
				content: $("#content").val()
			},
			success: function(result) {
				if (result != 'false') {
					alert("게시글 수정이 완료되었습니다.");
					loadmain('board?action=list&type=' + result + '&page=1');
				} else {
					alert("ERROR! 관리자에게 문의주세요.");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}

function awrite() {
	setTimeout(function() {
		$.ajax({
			url: '/project/board',
			type: "post",
			data: {
				action: 'awrite',
				type: 'attendance',
				title: $("#title").val(),
				writer: $("#writer").text()
			},
			success: function(result) {
				if (result != 'false') {
					alert("출석하고 50포인트를 받았습니다.");
					loadmain('board?action=list&type=' + result + '&page=1');
				} else {
					alert("오늘 이미 출석을 했습니다.");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}

function bwrite() {
	setTimeout(function() {
		$.ajax({
			url: '/project/board',
			type: "post",
			data: {
				action: 'bwrite',
				type: $("#type option:selected").val(),
				title: $("#title").val(),
				content: $("#content").val(),
				writer: $("#writer").val()
			},
			success: function(result) {
				if (result != 'false') {
					alert("게시글 작성이 완료되었습니다.");
					loadmain('board?action=list&type=' + result + '&page=1');
				} else {
					alert("ERROR! 관리자에게 문의주세요.");
				}
			},
			error: function(xhr, status, error) {
				alert("ERROR xhr :" + xhr + ", status : " + status + ", error :" + error);
			}
		})
	}, 500);
}