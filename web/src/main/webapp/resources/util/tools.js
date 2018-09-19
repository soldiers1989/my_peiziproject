/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */;
serviceurl = {
	baseurl : "/service",
};
//空验证
function isEmpty(verifyObj, errorMessage) {
	if (isNullStr(verifyObj.val())) {
		verifyObj.focus();
		$.MsgBox.Alert("温馨提示",errorMessage);
		return false;
	} else {
		return true;
	}
}

//下拉框未选择验证
function isNotSelected(verifyObj, errorMessage) {
	if (isNullStr(verifyObj.val()) || verifyObj.val() == '0') {
		verifyObj.focus();
		$.MsgBox.Alert("温馨提示",errorMessage);
		return false;
	} else {
		return true;
	}
}

function isEmpty2(verifyObj, errorMessage) {
	if (isNullStr2(verifyObj.val())) {
		verifyObj.focus();
		$.MsgBox.Alert("温馨提示",errorMessage);
		return false;
	} else {
		return true;
	}
}

function isNullStr(str) {
	if (null == str || str == 'undefined' || str == undefined) {
		return true;
	}
	return ($.trim(str + "") == "");
}
// 比较isNullStr添加 ：0也认为是空的判断
function isNullStr2(str) {
	if (null == str || str == 'undefined' || str == undefined || str == '0') {
		return true;
	}
	return ($.trim(str + "") == "");
}

/**
 * 新建日期（yyyy/MM/dd）
 */
function newDate() {
	try {
		var myDate = new Date();
		year = myDate.getFullYear(); // 获取完整的年份(4位,1970-????)
		month = myDate.getMonth() + 1; // 获取当前月份(0-11,0代表1月),必须+1
		day = myDate.getDate(); // 获取当前日(1-31)
		return year + "/" + (month < 10 ? "0" + month : month) + "/" + (day < 10 ? "0" + day : day) + "/";
	} catch (e) {
		$.MsgBox.Alert("操作结果", "时间建立异常newDate:" + e.description);
	}
}
/**
 * 存储路径时间格式部分处理
 * 
 * @param 必须至少具备年月日如2012-12-03或者
 *            2012-12-03 12：23：20格式
 */
function getDateURL(createtimeStr) {
	try {
		if (createtimeStr.indexOf("/") >= 0) {// 已经是合法路径不需要额外转换
			return createtimeStr;
		}
		var dateArr = createtimeStr.substring(0, 10).split("-");
		var yearStr = dateArr[0];
		var monthStr = dateArr[1];
		var dayStr = dateArr[2];
		return yearStr + "/" + monthStr + "/" + dayStr + "/";
	} catch (e) {
		$.MsgBox.Alert("操作结果", "时间转换异常getDateURL:" + e.description);
	}
}

/**
 * 根据url、date字符串、文件专有名，获取完整的下载地址
 * 
 * @param dateStr必须至少具备年月日如2012-12-03或者
 *            2012-12-03 12：23：20格式 url 文件名
 */
function getFileUrl(url, dateStr, name) {
	if (!url || url == "") {// url未设置
		return "";
	}
	// 如果是不是文件或者 下载文件不受服务器托管，下载地址为完整的url
	if (url.indexOf(".") < 0 || url.indexOf("/") >= 0) {
		return url;
	}
	var extendName = url.substring(url.lastIndexOf(".")).toUpperCase();
	if (".APK" != extendName && ".CHA" != extendName && ".CHS" != extendName && ".JPG" != extendName && ".PNG" != extendName && ".GIF" != extendName) {// 网址
		return url;
	}
	if (url.indexOf("/") < 0) {// 下载文件受服务器托管，其下载地址为相对地址--即文件名
		if (name == '' || name == undefined) {
			return (BASE_URL + getDateURL(dateStr) + url);
		}
		return (BASE_URL + getDateURL(dateStr) + name + "/" + url);
	}
}

// 空验证
function isEmpty(verifyObj, errorMessage) {
	if (isNullStr(verifyObj.val())) {
		$.MsgBox.Alert("温馨提示", errorMessage);
		verifyObj.focus();
		return false;
	} else {
		return true;
	}
}
// 空验证2,认为0也是空
function isEmpty2(verifyObj, errorMessage) {
	if (isNullStr2(verifyObj.val())) {
		$.MsgBox.Alert("温馨提示", errorMessage);
		verifyObj.focus();
		return false;
	} else {
		return true;
	}
}

// 验证url
/**
 * 检查是否为网址
 * 
 * @param {}
 *            str_url
 * @return {Boolean} true：是网址，false:<b>不是</b>网址;
 */
function isURL(verifyObj, errorMessage) {// 验证url
	var re = new RegExp("((^http)|(^https)|(^ftp)):\/\/(\\w)+\.(\\w)+");
	if (!re.test(verifyObj.val())) {
		$.MsgBox.Alert("温馨提示", errorMessage);
		verifyObj.focus();
		return false
	} else {
		return true;
	}
}
/**
 * 检查是否为数字
 * 
 * @return {Boolean} true：是数字，false:不是数字;
 */
function isNumber(verifyObj, errorMessage) {
	var reg = /^\d*$/;
	if (!reg.test(verifyObj.val())) {
		$.MsgBox.Alert("温馨提示", errorMessage);
		verifyObj.focus();
		verifyObj.val('');
		return false
	} else {
		return true;
	}
}

function isPinyin(str) {
	var reg = /^[a-z]+$/;
	return reg.test(str);
}

function isNullStr(str) {
	if (null == str || str == 'undefined' || str == undefined) {
		return true;
	}
	return ($.trim(str + "") == "");
}
// 比较isNullStr添加 ：0也认为是空的判断
function isNullStr2(str) {
	if (null == str || str == 'undefined' || str == undefined || str == '0') {
		return true;
	}
	return ($.trim(str + "") == "");
}

// 判断一个字符串是否是正整数或者为0，是ture；否false
function isPositiveInteger(str) {
	return /^([1-9]\d*|0)$/.test(str);
}

// 判断一个字符串是否是有效的分辨率
function isResratio(str) {
	return /^([1-9]\d*|0)\*([1-9]\d*|0)$/.test(str);
}

// 验证版本号是否符合应用商店版本管理要求，主版本号.子版本号[修正版本号[.编译版本号]]。各个版本号均为非负整数
function isVersionNo(str) {
	return /^([0-9]\d*|0)\.([0-9]\d*|0)(\.[0-9]\d*|\.0){0,2}$/.test(str);
}

// 验证是否非负浮点数（正浮点数 + 0）：
function isOSVersionNo(str) {
	return /^\d+(\.\d+)?$/.test(str);
}

/**
 * ajax访问失败处理 采用alert提醒
 * 
 * @author niejm
 */
function ajaxAccessErrorProcess() {
	$.MsgBox.Alert("操作结果", "请求失败,请检查后,重新提交!");
}
/**
 * 分类编辑成功提交后结果处理 采用alert提醒
 * 
 * @author niejm
 */
function formSubmitTip(cateinfo) {
	var resultObj;
	if (cateinfo.length) {
		resultObj = eval("(" + cateinfo + ")");
	} else {
		resultObj = cateinfo;
	}
	$.MsgBox.Alert("操作结果", resultObj.resultMessage);
}

function formSubmitSuccesssTip2(cateinfo){
	var resultObj;
	if (cateinfo.length) {
		resultObj = eval("(" + cateinfo + ")");
	} else {
		resultObj = cateinfo;
	}
	$.MsgBox.Alert("操作结果", resultObj.resultMessage);
	
}

/**
 * 获取应用列表中被选中的应用id集合，返回为数组
 * 
 * @author niejm
 */
function getSelectedIds(obj) {
	var ret = new Array();
	$("#" + obj + " input:checkbox").each(function() {
		if ($(this).parent().attr("aria-checked") == 'true') {
			ret.push($(this).parent().parent().parent().attr("id"));
		}
	});
	return ret;
}

/**
 * 获取应用列表中被选中的【指定字段】集合，返回为数组
 * 
 * @author niejm
 */
function getSelectedObjsByKey(obj,key) {
	var ret = new Array();
	$("#" + obj + " input:checkbox").each(function() {
		if ($(this).parent().attr("aria-checked") == 'true') {
			ret.push($(this).parent().parent().parent().attr(key));
		}
	});
	return ret;
}

function checkIdcard(idcard) {
	var Errors = new Array(1,// "验证通过!",
	-100,// "身份证号码位数不对!",
	-200,// "身份证号码出生日期超出范围或含有非法字符!",
	-300,// "身份证号码校验错误!",
	-400// "身份证地区非法!"
	);
	var area = {
		11 : "北京",
		12 : "天津",
		13 : "河北",
		14 : "山西",
		15 : "内蒙古",
		21 : "辽宁",
		22 : "吉林",
		23 : "黑龙江",
		31 : "上海",
		32 : "江苏",
		33 : "浙江",
		34 : "安徽",
		35 : "福建",
		36 : "江西",
		37 : "山东",
		41 : "河南",
		42 : "湖北",
		43 : "湖南",
		44 : "广东",
		45 : "广西",
		46 : "海南",
		50 : "重庆",
		51 : "四川",
		52 : "贵州",
		53 : "云南",
		54 : "西藏",
		61 : "陕西",
		62 : "甘肃",
		63 : "青海",
		64 : "宁夏",
		65 : "新疆",
		71 : "台湾",
		81 : "香港",
		82 : "澳门",
		91 : "国外"
	}
	var idcard, Y, JYM;
	var S, M;
	var idcard_array = new Array();
	idcard_array = idcard.split("");
	// 地区检验
	if (area[parseInt(idcard.substr(0, 2))] == null)
		return Errors[4];
	// 身份号码位数及格式检验
	switch (idcard.length) {
		case 15 :
			if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0 || ((parseInt(idcard.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0)) {
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;// 测试出生日期的合法性
			} else {
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;// 测试出生日期的合法性
			}
			if (ereg.test(idcard))
				return Errors[0];
			else
				return Errors[2];
			break;
		case 18 :
			// 18位身份号码检测
			// 出生日期的合法性检查
			// 闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
			// 平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
			if (parseInt(idcard.substr(6, 4)) % 4 == 0 || (parseInt(idcard.substr(6, 4)) % 100 == 0 && parseInt(idcard.substr(6, 4)) % 4 == 0)) {
				ereg = /^[1-9][0-9]{5}(19[0-9]{2}|20[0-1][0-1])((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;// 闰年出生日期的合法性正则表达式
			} else {
				ereg = /^[1-9][0-9]{5}(19[0-9]{2}|20[0-1][0-1])((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;// 平年出生日期的合法性正则表达式
			}
			if (ereg.test(idcard)) {// 测试出生日期的合法性
				// 计算校验位
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7 + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9 + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10 + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5 + (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8 + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4 + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2 + parseInt(idcard_array[7]) * 1 + parseInt(idcard_array[8]) * 6 + parseInt(idcard_array[9]) * 3;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				M = JYM.substr(Y, 1);// 判断校验位
				if (M == idcard_array[17])
					return Errors[0]; // 检测ID的校验位
				else
					return Errors[3];
			} else
				return Errors[2];
			break;
		default :
			return Errors[1];
			break;
	}
}

/**
 * 对象转换成字符串
 * 
 * @author niejm
 */
function obj2Str(obj) {
	switch (typeof (obj)) {
		case 'object' :
			var ret = [];
			if (obj instanceof Array) {
				for ( var i = 0, len = obj.length; i < len; i++) {
					ret.push(obj2Str(obj[i]));
				}
				return '[' + ret.join(',') + ']';
			} else if (obj instanceof RegExp) {
				return obj.toString();
			} else {
				for ( var a in obj) {
					ret.push(a + ':' + obj2Str(obj[a]));
				}
				return '{' + ret.join(',') + '}';
			}
		case 'function' :
			return 'function() {}';
		case 'number' :
			return obj.toString();
		case 'string' :
			return "\"" + obj.replace(/(\\|\")/g, "\\$1").replace(/\n|\r|\t/g, function(a) {
				return ("\n" == a) ? "\\n" : ("\r" == a) ? "\\r" : ("\t" == a) ? "\\t" : "";
			}) + "\"";
		case 'boolean' :
			return obj.toString();
		default :
			return obj.toString();
	}
}


/**
 * 获取cookie   
 * cName   key  
 * @author chenghao
 */
function getCookie(cName){  
    var cookies = document.cookie;  
    if(cookies.length>0){  
        var cStart = cookies.indexOf(cName+'=');  
        if(cStart!=-1){  
            cStart = cStart + cName.length + 1;  
            cEnd = cookies.indexOf(';',cStart);  
            if(cEnd==-1)  
                cEnd = cookies.length;  
            return unescape(cookies.substring(cStart,cEnd)) ; 
        }  
    }else{  
        return null;  
    }  
}

/**
 * 获取cookie   
 * cName key   cValue value   cExpire  time  60*24*30 代表 一个月 
 * @author chenghao
 */
function setCookie(cName,cValue,cExpire){  
    var now = new Date();  
    now.setMinutes(now.getMinutes()+cExpire);  
    document.cookie = cName + "=" + escape(cValue) + ";expires=" + now.toGMTString()+";path=/" ;
} 


/**
 * js  模拟 java  hashMap    
 *  
 * @author chenghao
 */
function HashMap() {
	/** Map大小* */
	var size = 0;
	/** 对象* */
	var entry = new Object();
	/** Map的存put方法* */
	this.put = function(key, value) {
		if (!this.containsKey(key)) {
			size++;
			entry[key] = value;
		}
	}
	/** Map取get方法* */
	this.get = function(key) {
		return this.containsKey(key) ? entry[key] : null;
	}
	/** Map删除remove方法* */
	this.remove = function(key) {
		if (this.containsKey(key) && (delete entry[key])) {
			size--;
		}
	}
	/** 是否包含Key* */
	this.containsKey = function(key) {
		return (key in entry);
	}
	/** 是否包含Value* */
	this.containsValue = function(value) {
		for ( var prop in entry) {
			if (entry[prop] == value) {
				return true;
			}
		}
		return false;
	}
	/** 所有的Value* */
	this.values = function() {
		var values = new Array();
		for ( var prop in entry) {
			values.push(entry[prop]);
		}
		return values;
	}
	/** 所有的 Key* */
	this.keys = function() {
		var keys = new Array();
		for ( var prop in entry) {
			keys.push(prop);
		}
		return keys;
	}
	/** Map size* */
	this.size = function() {
		return size;
	}
	/** 清空Map* */
	this.clear = function() {
		size = 0;
		entry = new Object();
	}

}

/**
 * 获取 上传图片的 服务器地址 
 * @returns {String}
 */
function getPicPath(){
	var _picPath=''  ; 
	$.ajax({
		url : serviceurl.baseurl + "/cdata/get/picpath",
		type : 'GET',
		async: false,
		dataType : 'text',
		success : function(data) {
			_picPath  = data;
		}
	});
	return _picPath ; 
}

/**
 * 根据url、date字符串、文件专有名，获取完整的下载地址
 * 
 * @param dateStr必须至少具备年月日如2012-12-03或者
 *            2012-12-03 12：23：20格式 url 文件名
 */
function getFileUrl(url, dateStr, name) {
	if (!url || url == "") {// url未设置
		return "";
	}
	// 如果是不是文件或者 下载文件不受服务器托管，下载地址为完整的url
	if (url.indexOf(".") < 0 || url.indexOf("/") >= 0) {
		return url;
	}
	var extendName = url.substring(url.lastIndexOf(".")).toUpperCase();
	if (".APK" != extendName && ".CHA" != extendName && ".CHS" != extendName && ".JPG" != extendName && ".PNG" != extendName && ".GIF" != extendName) {// 网址
		return url;
	}
	if (url.indexOf("/") < 0) {// 下载文件受服务器托管，其下载地址为相对地址--即文件名
		if (name == '' || name == undefined) {
			return (BASE_URL + getDateURL(dateStr) + url);
		}
		return (BASE_URL + getDateURL(dateStr) + name + "/" + url);
	}
}
