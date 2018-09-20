<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String preplaceAdmin="huanadmin";
	String basePath = request.getContextPath();
	String curPage = request.getRequestURI();
	String queryStr = request.getQueryString();
	// 如果有请求参数，则加上请求参数
	if (null != queryStr && queryStr.length() > 0) {
	    queryStr = curPage + "?" + queryStr;
	} else {
	    queryStr =  curPage;
	}  
	
	
	String userid = (String)session.getAttribute("account");
	String busType = (String)session.getAttribute("type");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>配资管理系统</title>
        <!-- =============================== CSS ================================== -->

<link rel="stylesheet" href="<%=basePath%>/resources/css/gridster/jquery.gridster.css" type="text/css" media="screen" /> 
<link rel="stylesheet" href="<%=basePath%>/resources/css/gridster/demo.css" type="text/css" media="screen" />

<link href="<%=basePath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/resources/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/resources/bootstrap/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="<%=basePath%>/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link href="<%=basePath%>/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- fullCalendar 2.2.5-->
<link href="<%=basePath%>/resources/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/resources/plugins/fullcalendar/fullcalendar.print.css" rel="stylesheet" type="text/css" media='print' />
<link href="<%=basePath%>/resources/dist/css/foot.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
<!-- 专用定义checkbox、radio的css，与其他css不重复 -->
<link href="<%=basePath%>/resources/plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/resources/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
<!-- file uploader -->
<link rel="stylesheet" href="<%=basePath%>/resources/css/fileuploader.css" type="text/css" media="screen" />
<!-- uploadify 跨域上传 -->
<link rel="stylesheet" href="<%=basePath%>/resources/css/uploadify.css" type="text/css" media="screen" />
<!-- autocomplete -->
<link rel="stylesheet" href="<%=basePath%>/resources/css/jquery.autocomplete.css" type="text/css" media="screen" />
<!-- shortcut-button -->
<link rel="stylesheet" href="<%=basePath%>/resources/css/shortcut-button.css" type="text/css" media="screen" />
<!-- jquery.ui.all.css 内部 加载多个css  -->
<link rel="stylesheet" href="<%=basePath%>/resources/themes/base/jquery.ui.all.css" type="text/css" media="screen" />
<!-- daterange picker -->
<link rel="stylesheet" href="<%=basePath%>/resources/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />

<!-- =================================== SCRIPT JS ======================================== -->
<!-- jQuery 2.1.3 -->
<script src="<%=basePath%>/resources/plugins/jQuery/jQuery-2.1.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/resources/plugins/gridster/jquery.gridster.js"></script>
<!-- $.browser在jQuery1.9里被删除 ，造成有些插件无法使用，需要引用jquery-migrate进行修复-->
<script src="<%=basePath%>/resources/plugins/jQuery/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="<%=basePath%>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- jQuery UI 1.11.2 -->
<script src="<%=basePath%>/resources/plugins/jQueryUI/jquery-ui.min-1.11.2.js" type="text/javascript"></script>
<!-- jQuery Datepicker Plugin -->
<script type="text/javascript" src="<%=basePath%>/resources/plugins/datepicker/locales/jquery.ui.datepicker-zh-CN.js"></script>
<!-- Morris.js charts -->
<script src="<%=basePath%>/resources/plugins/raphael/raphael-min.js"></script>
<script src="<%=basePath%>/resources/plugins/morris/morris.min.js" type="text/javascript"></script>
<!-- Sparkline -->
<script src="<%=basePath%>/resources/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- jvectormap -->
<script src="<%=basePath%>/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
<!-- jQuery Knob Chart -->
<script src="<%=basePath%>/resources/plugins/knob/jquery.knob.js" type="text/javascript"></script>
<!-- method tools -->
<script src="<%=basePath%>/resources/util/tools.js" type="text/javascript"></script>
<!-- page -->
<script src="<%=basePath%>/resources/util/page.js" type="text/javascript"></script>
<!-- Slimscroll -->
<script src="<%=basePath%>/resources/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src="<%=basePath%>/resources/plugins/fastclick/fastclick.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=basePath%>/resources/dist/js/app.min.js" type="text/javascript"></script>
<!-- iCheck -->
<script src="<%=basePath%>/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<!-- form -->
<script src="<%=basePath%>/resources/plugins/jQuery/jquery.form.js"></script>
<!-- 自定义congfirm、alert -->
<script src="<%=basePath%>/resources/msgBox/MsgBox.js"></script>
<!-- form 表单验证 -->
<script src='<%=basePath%>/resources/plugins/jQuery/jquery.validate.js'></script>
<script src='<%=basePath%>/resources/plugins/jQuery/messages_zh.js'></script>
<!-- file uploader -->
<script src='<%=basePath%>/resources/plugins/fileuploader/fileuploader.js'></script>
<!-- uploadify 实现跨域上传 -->
<script src='<%=basePath%>/resources/plugins/jQuery/jquery.uploadify.min.js'></script>
<!-- autocomplete -->
<script src="<%=basePath%>/resources/plugins/jQuery/jquery.autocomplete.js"></script>
<!-- date-range-picker -->
<script src="<%=basePath%>/resources/plugins/daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/resources/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<!-- dynatree -->
<script src="<%=basePath%>/resources/dynatree/jquery/jquery-ui.custom.js" type="text/javascript"></script>
<script src="<%=basePath%>/resources/dynatree/jquery/jquery.cookie.js" type="text/javascript"></script>
<link href="<%=basePath%>/resources/dynatree/jquery/ui.dynatree.css" rel="stylesheet" type="text/css" id="skinSheet">
<script src="<%=basePath%>/resources/dynatree/jquery/jquery.dynatree.js" type="text/javascript"></script>
<!-- 时间控件 -->
<script src="<%=basePath%>/resources/My97DatePicker/WdatePicker.js" type="text/javascript"></script> 
<!-- 编辑器控件 -->
<script src="<%=basePath%>/resources/ueditor/ueditor.config.js" charset="utf-8" type="text/javascript"></script> 
<script src="<%=basePath%>/resources/ueditor/ueditor.all.min.js" charset="utf-8" type="text/javascript"></script> 
<!-- InputMask -->
<script src="<%=basePath%>/resources/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
<script src="<%=basePath%>/resources/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
<script src="<%=basePath%>/resources/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<!-- tooltip -->
<script src="<%=basePath%>/resources/plugins/bootstrap-tooltip/tooltip.js" type="text/javascript"></script>
<script src="<%=basePath%>/resources/plugins/bootstrap-popover/popover.js" type="text/javascript"></script>
<!-- JSON的序列化和反序列化方法 -->
<script src="<%=basePath%>/resources/plugins/Json/json2.js" type="text/javascript"></script>
<!-- 对数组，字符串，object操作的函数库 -->
<script src="<%=basePath%>/resources/plugins/sugar/sugar.js" type="text/javascript"></script>
        <script type="text/javascript">
            var RESTFUL_BASE = serviceurl.baseurl;
            $(document).ready(function(){
        		//初始化自定义 alert、confirm插件
        		$.MsgBox.Init();
        		//定义checkbox、iradio样式
        		$('input[type="checkbox"]').iCheck({
        			checkboxClass : 'icheckbox_flat-blue',
        			radioClass : 'iradio_flat-blue'
        		});
        		
               //  parent.document.all("myFrameId").style.width=document.body.scrollWidth; 

        		//定义全选按钮
        		$(".checkbox-toggle").click(function() {
        			var clicks = $(this).data('clicks');
        			if (clicks) {
        				//全不选
        				$('input[type="checkbox"]', '.mailbox-messages').iCheck("uncheck");
        			} else {
        				//全选
        				$('input[type="checkbox"]', '.mailbox-messages').iCheck("check");
        			}
        			$(this).data("clicks", !clicks);
        		});
            	
            	<% if(userid  ==  null) { %>
            		 window.parent.location="<%=basePath%>/login.jsp";
            	 <%} else {%>
            	
                 // 取得权限数据
                 <% if (!preplaceAdmin.equalsIgnoreCase(userid)) {%>
                 $.ajax({
                     url: RESTFUL_BASE+"/<%=busType%>/managerAuth/queryAuth/<%=userid %>",
                     type: 'GET',
                     dataType: 'json',
                     success: function(data){
                    	
                         // 显示菜单
                         showMenu(data);
                     }
                 });
                <%} else {%>
               	  $(".sidebar-menu").show();
                <%}%> 
  

			//不做权限验证。
  			//$("#main-nav").show();
  			<%}%> 
            })
            /*
             *	对各个菜单的现实进行控制
             */
            function showMenu(data) {
                if (data.length == 0) {
                	$(".sidebar-menu").hide();
                    return;
                }
                $(".sidebar-menu").show();
                // 遍历所有菜单
                $(".sidebar-menu").children('li').each(function() {
                    // 没有子菜单的菜单
                    var menuhref = $(this).children("a").attr("href");
                    if (menuhref == "<%=basePath%>/<%=busType%>/index.jsp"){
                        $(this).show();
                    } else if (menuhref != "#") {
                        menuhref = menuhref.replace("<%=basePath%>/<%=busType%>","");
                        if (isUrlExit(menuhref,data)) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    // 有子菜单的情况
                    } else {
                        var submenushow = false;
                        $(this).children("ul").children("li").each(function() {
                            var submenuhref = $(this).children("a").attr("href");
                            submenuhref = submenuhref.replace("<%=basePath%>/<%=busType%>","");
                            if (isUrlExit(submenuhref, data)) {
                                $(this).show();
                                submenushow = true;
                            } else {
                                $(this).hide();
                            }
                        });
                        if (submenushow) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    }
                });

                // 如果为初始页面，则退出
                if ('<%=curPage%>' == '<%=basePath%>/<%=busType%>/index.jsp') {
                    return;
                }
                // 如果为修改密码页面，也退出
                if ('<%=curPage%>' == '<%=basePath%>/<%=busType%>/managerauth/editpassword.jsp') {
                    return;
                }
                // 判断是否有权限登录页面，没权限则转到初始页面
                var curPage = '<%=queryStr.replace(basePath,"")%>';
                if (!isUrlExit(curPage,data)) {
                    $("#mywork").click();
                }
            }
            /*
             *	判断URL是否存在，既是否有权限
             */
            function isUrlExit(urlstr,data) {
                if (data.length == 0) {
                    return false;
                }

                // 判断URL是否在权限列表中
                for (var i = 0; i < data.length; i++) {
                    var authconfig = data[i];
                    if(urlstr.indexOf('appid=') != -1){//由于其他页面访问app.jsp时候url为/app/app.jsp?appid=**，不能与数据库权限路径统一
                        return true;
                    }
                    if (authconfig.url != "" && authconfig.url != undefined && urlstr == authconfig.url) {
                        return true;
                    }
                }
                return false;
            }
            
           
        </script>
        <meta charset="UTF-8">
		<title>配资管理平台</title>
		<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    </head>
  
