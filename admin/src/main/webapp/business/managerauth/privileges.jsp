
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="../header.jsp"%>
<script type="text/javascript">
//设置facebox提示窗口图片位置

var page = new Page();
	page.pageSize=10;
	var LOGINNAME_IS_EXIST = 1;
	var validateFlag = true;
    var IS_EDIT = 0;//1 :YES ;0:NO
    var operator="<%=userid%>";
    $(document).ready(function() {
 
			//初始化树形菜单
          $.ajax({
        	   url: serviceurl.baseurl+"/<%=busType%>/authConfig/getAll",
        	   dataType:"json",
               success:  function(data){
			     $("#tree3").dynatree({
				     checkbox: true,
				     selectMode: 3,
					 children: data,
				     onSelect: function(select, node) {
					// Get a list of all selected nodes, and convert to a key array:
						var selKeys = $.map(node.tree.getSelectedNodes(), function(node){
						    return node.data.key;
					 });
					 $("#echoSelection3").text(selKeys.join(", "));
					 // Get a list of all selected TOP nodes
					 var selRootNodes = node.tree.getSelectedNodes(true);
				     // ... and convert to a key array:
					 var selRootKeys = $.map(selRootNodes, function(node){
						return node.data.key;
					 });
					 var selRootKeyAndTitles = $.map(selRootNodes, function(node){
						return node.data.key+node.data.title;
					 });
					 $("#echoSelectionRootKeys3").text(selRootKeys.join(", "));
					 $("#selectKeys").val(selKeys.join(", "));
					 $("#echoSelectionRoots3").text(selRootNodes.join(", "));
					 },
					 onDblClick: function(node, event) {
						 node.toggleSelect();
					 },
					 onKeydown: function(node, event) {
						 if( event.which == 32 ) {
						 node.toggleSelect();
						 return false;
						 }
					 },
					 // The following options are only required, if we have more than one tree on one page:
				//				initId: "treeData",
					cookieId: "dynatree-Cb3",
					idPrefix: "dynatree-Cb3-"
				    });
                }
        });

    	//日期
		var dates = $( "#BEG_DT, #END_DT" ).datepicker({
		 defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 2,
			onSelect: function( selectedDate ) {
				var option = this.id == "BEG_DT" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
			}
		});


        $("#account").autocomplete(serviceurl.baseurl+"/<%=busType%>/manager/query/account",{
            autoFill:false,
            width: 320,
            max: 4,
            highlight: false,
            multiple: false,
            dataType:"json",
            multipleSeparator: " ",
            scroll: true,
            scrollHeight: 300,
            pathparam:true,
            delay:10000,
            parse:function(data) {
                var parsed = [];
                var result=data;
                if(result.length > 0) {
                    for (var i=0; i < result.length; i++) {
                        var row = result[i];
                        if (row) {
                            parsed[parsed.length] = {
                                data: [row.account,row.id],
                                value: row.account,
                                result: this.formatResult && this.formatResult(data) || row.account
                            };
                        }
                    }
                } else {
                    parsed[parsed.length] = {
                        data: ["不存在此用户",0],
                        value: "不存在此用户",
                        result: this.formatResult && this.formatResult(data) || "不存在此用户"
                    };
                }
                return parsed;
            }
        });

        $.ajaxSetup({
            cache:false,
            type:"POST",
            contentType:"application/json",
            dataType:"json"
        });
        //设置页签点击处理
        $("a[href=#tab1]").click(function(){
        	getPageData();
        	
        });

        $("a[href=#tab2]").click(function(){
        	 $(".notification").hide();
        	 $("#addbutton").show();
        	 $("#account").next().hide();
        	 if(parent.document.all("myFrameId")!=null){
               	if(parseInt(parent.document.all("myFrameId").style.height)<2000){
                  	 parent.document.all("myFrameId").style.height=parent.document.getElementsByClassName("content-wrapper")[0].clientHeight+800;
          		}
              } 
        });

        $("button[title='提交']").click(function(){
      //      formSubmitPreProcess();
            //防止双击确认重复提交的情况。
            var userid = "<%=userid%>";
           
            if($("#id").val()== 0 || $("#id").val() == ""||!$("#id").val()) {
                //新增 
                $.ajax({
                    url:serviceurl.baseurl+"/<%=busType%>/managerAuth/save",
                	data:"{\"account\":\""+$("#account").val() +"\",\"password\":\""+$("#password").val()+ "\",\"selectKeys\":\""
					+ $("#selectKeys").val() +"\",\"operator\":\""+operator+"\"}",
					dataType:"json", 
                    beforeSend:function(){
                    	//提交信息前验证信息
                    	 return validateForm();
                    },
                    error:function() {
                        ajaxAccessErrorProcess();
                    },
                    success:function(managerauthinfo) {
                    	 var resultObject=managerauthinfo;
                        //解析json数据,清除form并填充操作结果提示
                        formSubmitTip(resultObject);
                        if(resultObject.resultCode == 0) {
                        	 $(".notification").hide();
                             $("#id").val("");
                             $("#managerauthForm").resetForm();
                             $("#account").attr("disabled",false)
                             $("#tree3").dynatree("getRoot").visit(function(node){
                          	   node.select(false);
                             })
                             $("a[href=#tab1]").click();
                        }
                    }
                }) 
            }else {
                // 修改 
                $.ajax({
                	url:serviceurl.baseurl+"/<%=busType%>/managerAuth/update",
                	data:"{\"account\":\""+$("#account").val() +"\",\"password\":\""+$("#password").val()+ "\",\"selectKeys\":\""
					+ $("#selectKeys").val() +"\",\"operator\":\""+operator+"\"}",
					dataType:"json", 
                    beforeSend:function(){
                        //执行提交前的提交信息验证
                    	 return validateForm();
                    },
                    error:function() {
                        ajaxAccessErrorProcess();
                    },
                    success:function(managerauthinfo) {
                        //解析json数据,填充form并填充操作结果提示
                      //  formSubmitSuccesssTip(managerauthinfo);
                          alert(resultObject.resultMessage);
                          $("#account").next().hide();
                        if(resultObject.resultCode == 0) {
                        $(".notification").hide();
                        $("#id").val("");
                        $("#managerauthForm").resetForm();
                        $("#account").attr("disabled",false)
                        $("#tree3").dynatree("getRoot").visit(function(node){
                     	   node.select(false);
                    })
                    $("a[href=#tab1]").click();
                 }
                        $("#addbutton").show();   
               }
              })
            }
        });
        //设置翻页工具栏中的首页、尾页、上一页、下一页
        $("ul.pagination a:not(.number)").each(function(index){
           $(this).click(function(){
               switch(index){
                   case 0://首页
                       page.gotoFirst();
                       break;
                   case 1://上一页
                       page.gotoPre();
                       break;
                   case 2://下一页
                       page.gotoNext();
                       break;
                   case 3://尾页
                       page.gotoLast();
                       break;
               }
         
             //访问ajax,取分类信息,刷新表格
               getPageData(page.pageNo);
           });
       });
        getPageData();
        
        $("input[value='取消']").click(function(){
        	  // $("a[href='#tab2']").click();
        	   IS_EDIT =0;
        	   $("#account").attr("disabled",false);
        	   $("#account").val("");
        	   $("#account").next().hide();
        	   $("#managerauthForm").resetForm();
               $("#id").val("");
               $("#selectKeys").val("");
      //         $("#addbutton").attr("disabled",false);
               $("#addbutton").show();
               $("#tree3").dynatree("getRoot").visit(function(node){
            	   node.select(false);
               }); 
        });
        
    	//=================================
		$("button[title='新增']").click(function(){
			$("a[href=#tab2]").click();
			$(".notification").hide();
			$("#account").next().hide();
            $("#id").val("");
            $("#managerauthForm").resetForm();
            $("#account").attr("disabled",false);
          //  $("#addbutton").attr("disabled",false);
            $("#addbutton").show();
            $("#tree3").dynatree("getRoot").visit(function(node){
         	   node.select(false);
            }); 
        });
		
     	//=================================   
      	//点击批量删除操作
        $("button[title='批量删除']").click(function(){
            if($(":checkbox:checked").length == 0) {
                alert("请选择要删除的记录");
                return false;
            }
            var userid = "<%=userid%>";
            var dataparam= "userId=" + userid + "&";
            for(var i=0; i<$(":checkbox:checked").length-1;i++){
                if($(":checkbox:checked").eq(i).parent().parent().attr("id") != "") {
                    dataparam+="id="+$(":checkbox:checked").eq(i).parent().parent().attr("id")+"&";
                }
            }
            if($(":checkbox:checked").eq($(":checkbox:checked").length-1).parent().parent().attr("id")!="") {
                dataparam+="id="+$(":checkbox:checked").eq($(":checkbox:checked").length-1).parent().parent().attr("id");
            }
            if(!confirm("确认删除吗？")) return false;
            //访问ajax,删除选中的分类记录
            $.ajax({
                contentType:"application/x-www-form-urlencoded",
                url:serviceurl.baseurl+"/<%=busType%>/managerAuth/delete/list",
                data:dataparam,
                beforeSend:function(){
                    //执行提交前的提交信息验证
                },
                error:function() {},
                success:function(manageauthinfo) {
                	getPageData();
                }
            });
        });
		
            
       
        $("input[value='搜索']").click(function(){
            //访问ajax,取分类信息,刷新表格
        	getPageData();
        });

         $("table a[title='修改']").live("click",function(){
        	 var dataparam="operator=<%=userid == null ? "" : userid%>";
            //访问ajax,取分类信息
            $.ajax({
                url:serviceurl.baseurl+"/<%=busType%>/managerAuth/query/"+$(this).parent().parent().attr("id"),
                type:"GET",
	            data:dataparam,
                dataType:"json",
                beforeSend:function(){
                    //提交信息前刷新页面
               //     $('.content-box ul.content-box-tabs li a').trigger("click");
                    $("a[href=#tab2]").click();
                    
                },
                error:function() {},
                success:function(manageauthinfo) {
                //      $("#addbutton").attr("disabled",false);
                    	IS_EDIT =1;
                        //解析json数据,填充form
                        var resultObject=manageauthinfo;
                        $("#id").val(resultObject.managerid);
                        $("#account").val(resultObject.account);
                        $("#account").attr("disabled",true);
                        $("#selectKeys").val(resultObject.selectKeys);
                        var rootNode = $("#tree3").dynatree("getRoot");
                        rootNode.visit(function(node){node.remove();});
                        rootNode.addChild(eval('(' + resultObject.dynatrees + ')') );
                }
            });
        });
          
       
        $("table a[title='删除']").live("click",function(){
        	 var userid = "<%=userid%>";
         var  param = "id="+$(this).parent().parent().attr("id") + "&userId=" + userid;
         if(!confirm("确认删除吗？")) return false;
        //访问ajax,删除选中的分类记录
        $.ajax({
            url:serviceurl.baseurl+"/<%=busType%>/managerAuth/delete/list",
            contentType:"application/x-www-form-urlencoded",
            data:param,
            beforeSend:function(){},
            error:function() {},
            success:function(manageauthinfo) {
            	getPageData();
            }
        });
    });
        
        
        //绑定表单验证
    	  $("#account").blur(function(){
            if(!$(this).val()){
          	  // showError($(this).parent().children("span.input-notification"),"请输入管理员账号!");
          	  validateFlag = false;
          	   return false;
            }
            if($(this).val().length>20){
              //  showError($(this).parent().children("span.input-notification").eq(0),"管理员账号不允许超过20个字符!");
                validateFlag = false;
                return false;
            }
            return true;
        	});
    })
//end ready

      function validateForm(){
    	if(!validateFlag){
            return false;
    	}
        if(!$("#account").val()){
            alert("请输入管理员账号!");
            $("#account").focus();
            return false;
        } else if($("#account").val().length>20){
            alert("管理员账号请输入0-20个字符!");
            $("#account").focus();
            return false;
        }
        if(LOGINNAME_IS_EXIST==-1){
            alert("该管理员账号已存在,请重新输入!");
            $("#account").focus();
            return false;
        }
	if($("#tree3").html()!="")
	 {    if($("#tree3").dynatree("getTree").getSelectedNodes(true)=="")
		 {
			    alert("请赋予权限!");
			   
			    return false;
		  }
	 }
    }
    
    function getPageData(){
    	$.ajax({
        	contentType:"application/x-www-form-urlencoded",
            url:serviceurl.baseurl+"/<%=busType%>/managerAuth/get/page",
            data:"pageNo="+page.pageNo+"&pageSize="+page.pageSize+"&account="+$("#searchaccount").val()+"&startTime="+$("#BEG_DT").val()+"&endTime="+$("#END_DT").val()+ "&operator=" + operator,
            dataType:"json",
            success:dataFill
        });
    }
    
   /**
     * 列表数据填充
     */
    function dataFill(data) {
        var datatr = "";
        var resultObject=data;
        
        $("ul.pagination [id='number']").remove();
        page.pageNo = resultObject.pageNo;//从data中获取当前页码
        page.totalPage = resultObject.totalPages;//从data中获取总页数
        var pageRegion = page.getPageRegion();
        var pageLink = "";
        for(var i=pageRegion[0];i<=pageRegion[1];i++){
            pageLink += " <li id='number' class='number "+ (i==page.pageNo ? 'active':'') +"' title='"+i+"'><a href='#'>"+i+"</a></li>";
        }
        $("ul.pagination").children().eq(1).after($(pageLink));
        $("ul.pagination [id='number']").click(function(){
            page.gotoIndex(parseInt($(this).attr("title")));
          //访问ajax,取分类信息,刷新表格
          getPageData(page.pageNo);
        });
        $(".pagination").show();
        //设置翻页相关信息结束
         $("#datalist tbody tr").remove();
        //$("table tfoot").hide();
        if(resultObject.totalPages > 0) {
            var countNum=(page.pageNo-1)*page.pageSize;
            for(var i=0; i<resultObject.result.length;i++) {
                var manageauth = resultObject.result[i];
                datatr+= "<tr id=\""+manageauth.managerid+"\">"
                datatr+="<td><input type=\"checkbox\" /></td>";
                datatr+="<td>"+(countNum+i+1)+"</td>";
                datatr+="<td>"+manageauth.account+"</td>";
                datatr+="<td>"+manageauth.authnames+"</td>";
                datatr+="<td>"+manageauth.operator+"</td>";
                datatr+="<td>"+manageauth.createtime+"</td>";
                datatr+="<td>"+manageauth.operatetime+"</td>";
                datatr+="<td><a href=\"#\" title=\"修改\"><img src=\"../../resources/images/icons/pencil.png\" alt=\"修改\" /></a>";
                datatr+="<a href=\"#\" title=\"删除\"><img src=\"../../resources/images/icons/cross.png\" alt=\"删除\" /></a> </td>";
                datatr+="</tr>";
            }
        }else{
            datatr = "<tr><td colspan=\"10\">抱歉，没有查询到符合条件的记录</td><tr>";
        }
        $("#datalist tbody").append(datatr);
        //设置行背景
        $('#datalist tr:even').addClass("alt-row");
        parent.document.all("myFrameId").style.height=$(".wrapper").css("height");
    }
   
	function checkDat(){
	    var rs =checkMess(document.getElementById("BEG_DT"));
	    rs =checkMess(document.getElementById("END_DT"))&&rs;
	    if(!rs){
	       return false;
	    }else{
	       return true;
	    }
	 }

     function checkMess(input){
	    var id = input.id;
	    var value = input.value;
	    var label = input.label;
	    
	    if(id=="BEG_DT"){
	       if(!isDate(value)){
	          alert("格式不正确，格式为'2008-08-08'");
	          return false;
	       }
	       
	       var checkEndTime =  document.getElementById("END_DT").value;
	       var checkBegTime = value;
	       if(checkBegTime>checkEndTime){
	          alert("开始时间不能晚于结束时间！");
	          return false;
	        }
	    }     
 
	    if(id=="END_DT"){
	       if(!isDate(value)){
	          alert("格式不正确，格式为'2008-08-08'");
	          return false;
	       }
	    
	    }     
	           
	     return true;
	 }

 
function isDate(dateStr) {
if(dateStr==""){
	return true;
}
   // var datePat = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/;
 //  var datePat = /^(\d{4})(-)(\d{1,2})(-)(\d{1,2})$/;

  //var   datePat   =   /^(\d{4})-(\d{2})-(\d{2})$/; 

     var datePat = /^(\d{4})(-)(\d{2})(-)(\d{2})$/;
    var matchArray = dateStr.match(datePat); // is the format ok?
   
    if (matchArray == null) {
     // alert("Please enter date as either mm/dd/yyyy or mm-dd-yyyy.");
        return false;
    }

    month = matchArray[3]; // parse date into variables
    day = matchArray[5];
    year = matchArray[1];

    if (month < 1 || month > 12) { // check month range
//alert("Month must be between 1 and 12.");
        return false;
    }

    if (day < 1 || day > 31) {
    //    alert("Day must be between 1 and 31.");
        return false;
    }

    if ((month==4 || month==6 || month==9 || month==11) && day==31) {
     //   alert("Month "+month+" doesn't have 31 days!")
        return false;
    }

    if (month == 2) { // check for february 29th
        var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
        if (day > 29 || (day==29 && !isleap)) {
       //     alert("February " + year + " doesn't have " + day + " days!");
            return false;
        }
    }
    return true; // date is valid
}  

function checkpass(str) {
	var pwdValidat =/^[a-z,A-Z,0-9,~,!,@,#,¥,$,%,^,&,*,(,),-,+,|]{6,30}$/;
	  // return (/^[\x00-\x7F]+$/).test(str) && (/[0-9]+/).test(str) && (/[a-zA-Z]+/).test(str);
	return pwdValidat.test(str);
}
	function IFrameResize(){
	 	var obj = parent.document.getElementById("myFrameId"); //取得父页面IFrame对象
	 	obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度
	} 
</script>
</head>
<body onload="FrameResize();" class="skin-blue">
	<div class="wrapper" style="background: #fff;">
		<!-- Custom Tabs -->
		<div class="nav-tabs-custom">
			<h5>&nbsp;&nbsp;&nbsp;&nbsp;</h5>
			<h3>
				&nbsp;&nbsp;&nbsp;&nbsp;权限管理 <small>权限分配</small>
			</h3>
			<ul class="nav nav-tabs pull-right">
			<li><a href="#tab2" data-toggle="tab">表单</a></li>
				<li class="active"><a href="#tab1" data-toggle="tab">列表</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<!-- Main content -->
					<section class="content">
						<div class="col-xs-12">
							<div class="box">
								<div class="box-header">
									<div class="box-tools">
										<div class="input-group">
										<input type="text" id="END_DT" name="END_DT"  class="form-control input-sm pull-right"  style="width: 150px;" placeholder="到" />
											<input type="text" id="BEG_DT" name="BEG_DT" class="form-control input-sm pull-right"  style="width: 150px;" placeholder="从" />
											<input type="text"id="searchaccount"
									name="searchaccount"   class="form-control input-sm pull-right"  style="width: 150px;" placeholder="帐号" />
											<div class="input-group-btn">
												<button class="btn btn-sm btn-default" style="height: 30px;" onclick="getPageData();">
													<i class="fa fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
								<!-- /.box-header -->
								<div class="table-responsive mailbox-messages">
									<div class="mailbox-controls">
										<button class="btn btn-default btn-sm checkbox-toggle" title="全选/全不选">
											<i class="fa fa-square-o">&nbsp;全选</i>
										</button>
										<div class="btn-group">
											<button class="btn btn-default btn-sm"  title="新增">
												<i class="fa fa-plus">&nbsp;新增</i>
											</button>
											<button class="btn btn-default btn-sm"  title="批量删除">
												<i class="fa fa-trash-o">&nbsp;删除</i>
											</button>
									
										</div>
										<!-- /.btn-group -->
										<!-- <button class="btn btn-default btn-sm" onclick="location.reload();" title="刷新">
											<i class="fa fa-refresh">&nbsp;刷新</i>
										</button> -->
									</div>
									<br/><br/>
									<table id="datalist" class="table table-hover table-striped">
										<thead>
											<tr>
												<!-- Check all button -->
												<th>选择</th>
												<th>序号</th>
											<th >账号</th>
						<th>拥有权限</th>
						<th style="width: 7%;">操作者</th>
						<th style="width: 9%;">创建时间</th>
						<th style="width: 9%;">修改时间</th>
						<th style="width: 6%;">操作</th>
							
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
								<!-- /.box-body -->
								<div class="box-footer clearfix">
									<ul class="pagination pagination-sm no-margin pull-right">
										<li><a href="#" title="首页">&laquo; 首页</a></li>
										<li><a href="#" title="上一页">&laquo; 上一页</a></li>
										<li><a href="#" title="下一页">下一页 &raquo;</a></li>
										<li><a href="#" title="尾页">尾页 &raquo;</a></li>
									</ul>
								</div>
							</div>
							<!-- /.box -->
						</div>
					</section>
				</div>
				
						<div class="tab-pane" id="tab2">
					<!-- Main content -->
					<section class="content">
						<!-- left column -->
						<div class="col-md-12">
							<!-- general form elements -->
							<div class="box box-primary">
								<div class="box-header">
									<h3 class="box-title">编辑</h3>
								</div>
								<!-- /.box-header -->
								<!-- form start -->
            <form action="#" method="post"d="managerauthForm"
				name="managerauthForm">
               	<input type="hidden" id="id" name="id" value="" />  
					 <input type="hidden" id="selectKeys" name="selectKeys" value="" />
									<div class="box-body">
										<div class="form-group">
											<label>管理员帐号</label> 
											<input type="text" id="account" name="account"  maxlength="10" class="form-control" style="width: 40%;" placeholder="*必须项" />

										</div>
										<div class="form-group">
											<label>权限设置</label> 
											<table>
						<div id="tree3"></div>
                    <div id="tree4"></div>
					</table>
										</div>
										
									</div>
									<!-- /.box-body -->
									<div class="box-footer">
										<button type="button" class="btn btn-primary" title='提交' id="savebtnid">提交</button>
									</div>
								</form>
							</div>
							<!-- /.box -->
						</div>
						<!--/.col (left) -->
					</section>
					<!-- /.content -->
				</div>
				
			</div>
			<!-- /.tab-content -->
		</div>
		<!-- nav-tabs-custom -->
		<!-- /.content -->
	</div>
</body>
</html>


