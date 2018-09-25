/*!
 * 自定义 congfirm、alert
 * ver1.0
 * =================================
 * author 聂建明
 *
 * (c) 2015.03.03
 * MIT Licensed
 */

(function($) {

	// 自定义alert、confirm start ==============================================
	$.MsgBox = {
		Alert : function(title, msg) {
			SetMsg("alert", title, msg);
			btnOk(); // alert只是弹出消息，因此没必要用到回调函数callback
			btnNo();
		},
		Confirm : function(title, msg, callback) {
			SetMsg("confirm", title, msg);
			btnOk(callback);
			btnNo();
		},
		AlertBySize : function(title, width, height, msg) {
			SetMsg("alert", title, msg, width, height);
			btnOk(); // alert只是弹出消息，因此没必要用到回调函数callback
			btnNo();
		},
		ConfirmBySize : function(title, msg, width, height, callback) {
			SetMsg("confirm", title, msg, width, height);
			btnOk(callback);
			btnNo();
		},
		InfoSubmit : function(title, length, callback) {
			SetMsgInfo("infoSubmit", length, title);
			btnInfo(callback);
		},
		WindowSubmit : function(title, htm, callback) {
			SetMsgWindow(htm, title);
			WindowSubmitBtnOk(callback);
		},
		Init : function() {
			GenerateHtml();
		}
	}

	var btnInfo = function(callback) {
		$("#njm_mb_btn_ok").click(function() {
			if (typeof (callback) == 'function') {
				var message = $("#msginfo_edit").val();
				if (message == '' || message == undefined) {
					alert("不能为空！");
				} else {
					$("#njm_mb_btn_close").click();
					callback(message);
				}
			}
		});
	}

	// 确定按钮事件
	var btnOk = function(callback) {
		$("#njm_mb_btn_ok").click(function() {
			$("#njm_mb_btn_close").click();
			if (typeof (callback) == 'function') {
				callback();
			}
		});
	}

	// 定制窗口 确定按钮事件
	var WindowSubmitBtnOk = function(callback) {
		$("#njm_mb_btn_ok").click(function() {
			if (typeof (callback) == 'function') {
				if (callback()) {
					$("#njm_mb_btn_close").click();
				}
			} else {
				$("#njm_mb_btn_close").click();
			}
		});
	}
	// 取消按钮事件
	var btnNo = function() {
		$("#njm_mb_btn_no").click(function() {
			$("#njm_mb_btn_close").click();
		});
	}

	// 设置每次显示的信息
	var SetMsg = function(type, title, msg, width, height) {
		$("#njm_mb_tit").empty();
		$("#njm_mb_msg").empty();
		$("#njm-modal-footer").empty();
		if (width && width > 0) {
			$("#njm_mb_con").width(width + "px");
		} else {
			$("#njm_mb_con").width("300px");
		}
		if (height && height > 0) {
			$("#njm_mb_con").height(height + "px");
		} else {
			$("#njm_mb_con").height("");
		}
		$("#njm_mb_tit").append(title);
		$("#njm_mb_msg").append("<p>" + msg + "</p>");
		if (type == "alert") {
			$("#njm-modal-footer").append("<button id='njm_mb_btn_ok' type='button' class='btn btn-default'>确定</button>");
		}
		if (type == "confirm") {
			var but_html = "";
			but_html += "<button id='njm_mb_btn_ok' type='button' class='btn btn-default'>确定</button>";
			but_html += "<button id='njm_mb_btn_no' type='button' class='btn btn-primary' data-dismiss='modal'>取消</button>";
			$("#njm-modal-footer").append(but_html);
		}
		$("#njm_mb_box").modal();
	}

	// 设置每次显示的信息
	var SetMsgInfo = function(type, length, title) {
		$("#njm_mb_tit").empty();
		$("#njm_mb_msg").empty();
		$("#njm-modal-footer").empty();
		$("#njm_mb_tit").append(title);
		$("#njm_mb_msg").append("<textarea style='width:260px;heigh:60px;resize: none' maxLength='" + length + "' id='msginfo_edit' name='msginfo_edit'></textarea>");
		if (type == "infoSubmit") {
			var but_html = "";
			but_html += "<button id='njm_mb_btn_ok' type='button' class='btn btn-default'>确定</button>";
			but_html += "<button id='njm_mb_btn_no' type='button' class='btn btn-primary' data-dismiss='modal'>取消</button>";
			$("#njm-modal-footer").append(but_html);
		}
		$("#njm_mb_box").modal();
	}
	// 设置 定制窗口
	var SetMsgWindow = function(htm, title) {
		$("#njm_mb_tit").empty();
		$("#njm_mb_msg").empty();
		$("#njm-modal-footer").empty();
		$("#njm_mb_tit").append(title);
		$("#njm_mb_msg").append(htm);

		var but_html = "";
		but_html += "<button id='njm_mb_btn_ok' type='button' class='btn btn-default'>确定</button>";
		but_html += "<button id='njm_mb_btn_no' type='button' class='btn btn-primary' data-dismiss='modal'>取消</button>";

		$("#njm-modal-footer").append(but_html);
		$("#njm_mb_box").modal();
	}

	// 生成Html
	var GenerateHtml = function() {

		var _html = "";

		_html += "<div id='njm_mb_box' class='modal' tabindex='-1' role='dialog' aria-labelledby='mySmallModalLabel'>";
		_html += "<div id='njm_mb_con' class='modal-dialog modal-sm'>";
		_html += "<div class='modal-content'>";
		_html += "<div class='modal-header'>";
		_html += "<button id='njm_mb_btn_close' type='button' class='close' data-dismiss='modal' aria-label='Close'>";
		_html += "<span aria-hidden='true'>&times;</span>";
		_html += "</button>";
		_html += "<h4 class='modal-title' id='njm_mb_tit'></h4>";
		_html += "</div>";
		_html += "<div class='modal-body' id='njm_mb_msg'></div>";
		_html += "<div id='njm-modal-footer' class='modal-footer'></div>";
		_html += "</div>";
		_html += "</div>";
		_html += "</div>";
		// 将_html添加到body
		$("body").append(_html);
	}
	// 自定义alert、confirm end ==============================================

	// END document.ready
})(window.jQuery || window.Zepto);
