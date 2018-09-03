<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
  	String basePath = request.getContextPath();
	String curPage = request.getRequestURI();
	String queryStr = request.getQueryString();
	// 如果有请求参数，则加上请求参数
	if (null != queryStr && queryStr.length() > 0) {
		queryStr = curPage + "?" + queryStr;
	} else {
		queryStr = curPage;
	}
%>

<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>中国邮政储蓄银行北京分行</title>
  <link rel="stylesheet" href="./css/libs/mobileSelect.css">
  <link rel="stylesheet" href="./css/index.css">
</head>

<body>

  <div class="app">
    <div class="form-wrapper">
      <form action="/" method="post" class="form" id="form">
        <div class="form-group">
          <!-- <label for="userName">姓名</label> -->
          <input type="text" name="user_name" id="userName" placeholder="姓名">
        </div>
        <div class="form-group">
          <!-- <label for="mobile">电话</label> -->
          <input type="number" name="mobile" id="mobile" placeholder="手机号码">
        </div>
        <div class="form-group">
          <!-- <label for="">开户所在区支行</label> -->
          <input type="text" placeholder="所在球迷会" id="subbranch" readonly>
        </div>
        <p style="color: rgba(255,255,255, .7);padding: 0 4px;transform: translateY(-12px);"> 请您选择就近办理业务的地区，我行工作人员会电话联系您</p>
        <div class="form-group btn-wrapper">
          <button class="submit-btn">确认提交</button>
        </div>
      </form>
    </div>
    <p style="position: absolute;bottom: 10px; left: 0;right: 0; text-align: center; color: rgba(255,255,255, .6);font-size: 10px;line-height: 20px;">本活动最终解释权归中国邮政储蓄银行北京分行所有</p>
  </div>
  <div class="tips">
  </div>


  <script src="./js/libs/jquery.min.js"></script>
  <script src="./js/libs/mobileSelect.min.js"></script>
  <script src="./js/index.js"></script>
</body>

</html>
