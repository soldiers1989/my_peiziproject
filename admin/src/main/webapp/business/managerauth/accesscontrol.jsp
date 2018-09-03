<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="../header.jsp"%>
<script type="text/javascript">
    var page = new Page();
    page.pageSize = 10;
    var validateFlag=true;
    var operator="<%=userid%>";
     var CRUD_DIV_ID = ["tab2"];
    $(document).ready(function() {
        $.ajaxSetup({
            cache:false,
            type:"POST",
            contentType:"application/json",
            dataType:"json"
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
     	//=================================   
   	//***********************查询列表页按单条记录进行删除****************************
       $("table a[title='删除']").live("click",function(){
       	var operator="<%=userid%>";
           var dataparam="";
           if(!confirm('删除将不能恢复，确定要继续吗？'))
                    return;
           //访问ajax,删除选中的分类记录
           $.ajax({
               contentType:"application/x-www-form-urlencoded",
               url:serviceurl.baseurl+"/<%=busType%>/authConfig/delete/list",
               data:dataparam+"id="+$(this).parent().parent().attr("id") + "&operator=" + operator,
               beforeSend:function(){},
               error:function() {},
               success:function(cateinfo) {
               	getPageData();
               }
           });
       });
      	
        //设置页签点击处理
        $("a[href=#tab1]").click(function(){
        	$(".notification").hide();
        	getPageData();
        });
        //设置页签点击处理
        $("a[href=#tab2]").click(function(){
        	 $(".notification").hide();
        	 $("#name").next().hide();
             $("#pid").next().hide();
             $("#url").next().hide();
        });
        
      //初始进入页面
      getPageData();
      
      //验证PID
        $("#pid").blur(function(){   
            if(!isEmpty($(this),"请填写pid!")) {
                $(this).focus();
                validateFlag = false;
                return false;
            } else {
         	  validateFlag = true;
              return true;
            }
        });
        function validateForm() {
        	if(!validateFlag){
                return false;
        	}
            if(!isEmpty($("#name"),"权限名字不能为空!")){
                $("#name").focus();
                return false;
            }
            if(!isEmpty($("#pid"),"pid不能为空!")) {
            	$("#pid").focus();
                return false;
            }
            return true;
        }
      	//=================================
 		$("button[title='提交']").click(function(){
            var operator="<%=userid%>";
          	//新增或修改分类调用
          	if ($("#id").val()==""){
	            $.ajax({
	                url:serviceurl.baseurl+"/<%=busType%>/authConfig/save",
	                data:"{\"name\":\""+$("#name").val()+"\",\"pid\":\""+$("#pid").val()+"\",\"url\":\""+$("#url").val()+"\",\"operator\":\""+operator+"\"}",
	                dataType:"json",
	                beforeSend:function(){
	                    //执行提交前的提交信息验证
	                    return validateForm();
	                },
	                error:function() {
	                    ajaxAccessErrorProcess();
	                },
	                success:function(cateinfo) {
	                    //解析json数据,清除form并填充操作结果提示
	                    var resultObject=cateinfo;
	                    alert(resultObject.resultMessage);
	                    $("#name").next().hide();
	                    $("#pid").next().hide();
	                    $("#url").next().hide();
	                    if (resultObject.resultCode == 0){
	                    	$("#fileForm").resetForm();
	                    	 $("a[href=#tab1]").click();
	                    }
	                   
	                }
	            });
          	} else {
          		$.ajax({
	                url:serviceurl.baseurl+"/<%=busType%>/authConfig/update",
	                data:"{\"id\":\""+$("#id").val()+"\",\"name\":\""+$("#name").val()+"\",\"pid\":\""+$("#pid").val()+"\",\"url\":\""+$("#url").val()+"\",\"operator\":\""+operator+"\"}",
	                dataType:"json",
	                beforeSend:function(){
	                    //执行提交前的提交信息验证
	                    return validateForm();
	                },
	                error:function() {
	                    ajaxAccessErrorProcess();
	                },
	                success:function(cateinfo) {
	                    //解析json数据,清除form并填充操作结果提示
	                    var resultObject=cateinfo;
	                    alert(resultObject.resultMessage);
	                    $("#name").next().hide();
	                    $("#pid").next().hide();
	                    $("#url").next().hide();
	                    if (resultObject.resultCode == 0){
		                    $("#fileForm").resetForm();
		                    $("#id").val("");
		                    $("#name").attr("disabled",false);
		                    $("a[href=#tab1]").click();
	                    }
	                }
	            });
          	}
        });
		//=================================
		$("button[title='新增']").click(function(){
			$("a[href=#tab2]").click();
		    $("#name").next().hide();
            $("#pid").next().hide();
            $("#url").next().hide();
            $("#id").val("");
            $("#fileForm").resetForm();
            $("#name").attr("disabled",false)
        });
 		//=================================
	  
     	//=================================    
     	$("a[title='修改']").live("click",function(){
	        var dataparam="operator=<%=userid == null ? "" : userid%>";
	        //访问ajax,取分类信息
	        $.ajax({
	            url:serviceurl.baseurl+"/<%=busType%>/authConfig/query/"+$(this).parent().parent().attr("id"),
	            type:"GET",
	            data:dataparam,
	            dataType:"json",
	            beforeSend:function(){
	                //执行提交前的提交信息验证
	               // $('.content-box ul.content-box-tabs li a').trigger("click");
	                $("a[href=#tab2]").click();
	            },
	            error:function() {},
	            success:function(cateinfo) {
	                //解析json数据,填充form
	                var resultObject=cateinfo;
	                $.each(resultObject,function(key,value){//设置每个字段值
				    $("#"+key).val(value);
				    });
	            }
	        });
	    });
     	//=================================    
        //设置翻页工具栏中的首页、尾页、上一页、下一页
       
     	//=================================   
      	//点击批量删除操作
        $("button[title='批量删除']").click(function(){
            if($(":checkbox[name=devcheckbox]:checked").length == 0) {
                alert("请选择要删除的记录");
                return false;
            }
            var operator="<%=userid%>";
            var dataparam="operator=" + operator + "&";
            for(var i=0; i<$(":checkbox:checked").length-1;i++){
                if($(":checkbox:checked").eq(i).parent().parent().attr("id") != "") {
                    dataparam+="id="+$(":checkbox:checked").eq(i).parent().parent().attr("id")+"&";
                }
            }
            if($(":checkbox:checked").eq($(":checkbox:checked").length-1).parent().parent().attr("id")!="") {
                dataparam+="id="+$(":checkbox:checked").eq($(":checkbox:checked").length-1).parent().parent().attr("id");
            }
           if(!confirm('删除将不能恢复，确定要继续吗？'))
                 return;
             //访问ajax,删除选中的分类记录
           $.ajax({
               contentType:"application/x-www-form-urlencoded",
               url:serviceurl.baseurl+"/<%=busType%>/authConfig/delete/list",
               data:dataparam,
               beforeSend:function(){},
               error:function() {},
               success:function(cateinfo) {
            	   getPageData();
               }
           });
        });
      //=================================   
    });
    
    
    //根据条件检索相关数据
		
    function getPageData(){
    	$.ajax({
            contentType:"application/x-www-form-urlencoded",
            url:serviceurl.baseurl+"/<%=busType%>/authConfig/get/page",
            dataType:"json",
            data:"pageNo="+page.pageNo+"&pageSize="+page.pageSize+"&name="+$("#searchname").val()+"&startTime="+$("#startTime").val()+"&endTime="+$("#endTime").val() + "&operator=" + operator,
            success:dataFill
        });
    }
    
    function dataFill(data) {
    	var datatr = "";
        var resultObject=data;
        //TODO 设置翻页相关信息
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
        //设置翻页相关信息结束

         $("#datalist tbody tr").remove();
        //$("table tfoot").hide();
        if(resultObject.totalPages > 0&&resultObject.result!=undefined) {
            var countNum=(page.pageNo-1)*page.pageSize;
            for(var i=0; i<resultObject.result.length;i++) {
                var adaptor = resultObject.result[i];
                datatr+= "<tr id=\""+adaptor.id+"\">"
                datatr+="<td><input name=\"devcheckbox\" type=\"checkbox\" /></td>";
                datatr+="<td>"+(countNum+i+1)+"</td>";
                datatr+="<td>"+adaptor.id+"</td>";
                datatr+="<td>"+adaptor.name+"</td>";
                datatr+="<td>"+adaptor.pid+"</td>";
                datatr+="<td>"+adaptor.url+"</td>";
                datatr+="<td>"+adaptor.createtime+"</td>";
                datatr+="<td>"+adaptor.operator+"</td>";
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
</script>

</head>
<body class="skin-blue">
	<div class="wrapper" style="background: #fff;">
		<!-- Custom Tabs -->
		<div class="nav-tabs-custom">
			<h5>&nbsp;&nbsp;&nbsp;&nbsp;</h5>
			<h3>
				&nbsp;&nbsp;&nbsp;&nbsp;权限管理<small>权限设置</small>
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
									<h3 class="box-title">权限检索</h3>
									<div class="box-tools">
										<div class="input-group">
										<input type="text" id="endTime" name="endTime" class="form-control input-sm pull-right"  style="width: 150px;" placeholder="到" />
											<input type="text" id="startTime" name="startTime" class="form-control input-sm pull-right"  style="width: 150px;" placeholder="从" />
											<input type="text" id="searchname"
									name="searchname" class="form-control input-sm pull-right" style="width: 150px;" placeholder="权限名称" /> 
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
											<i class="fa fa-square-o"> 全选</i>
										</button>
										<div class="btn-group">
											<button class="btn btn-default btn-sm"  title="新增">
												<i class="fa fa-plus"> 新增</i>
											</button>
											<button class="btn btn-default btn-sm"  title="批量删除">
												<i class="fa fa-trash-o"> 删除</i>
											</button>
										</div>
										<!-- /.btn-group -->
									</div>
									<table id="datalist" class="table table-hover table-striped">
										<thead>
											<tr>
												<!-- Check all button -->
												<th>选择</th>
												<th>序号</th>
												<th>ID</th>
												<th>名称</th>
												<th>PID</th>
												<th>URL</th>
												<th>创建时间</th>
												<th>操作者</th>
												<th style="width: 8%">操作</th>
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
				<!-- /.tab-pane -->
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
								<form role="form" id="fileForm">
									<div class="box-body">
										<!-- text input -->
										<div class="form-group" style="display: none;">
											<label>权限ID</label> <input type="text" id="id" class="form-control" style="width: 40%;" placeholder="请输入 ..." disabled />
										</div>
										<div class="form-group">
											<label>权限名称</label> <input type="text" id="name" name="name" class="form-control" style="width: 40%;" placeholder="*必须项(长度1-100位)" />
										</div>
										<div class="form-group">
											<label>PID</label> <input type="text" id="pid" name="pid" class="form-control" style="width: 40%;" placeholder="长度1-100位" />
										</div>
										<div class="form-group">
											<label>URL</label> <input type="text" id="url" name="url" class="form-control" style="width: 40%;" placeholder="长度1-100位" />
										</div>
										<div class="form-group" id="showCreatedTime" style="display: none;">
											<label>创建时间</label> <input type="text" id="createdTime" name="createdTime" class="form-control" style="width: 40%;" />
										</div>
										<div class="form-group" id="showOperatorTime" style="display: none;">
											<label>操作时间</label> <input type="text" id="operatorTime" name="operatorTime" class="form-control" style="width: 40%;" />
										</div>
										<div class="form-group" id="showOperator" style="display: none;">
											<label>操作者</label> <input type="text" id="operator" name="operator" class="form-control" style="width: 40%;" />
										</div>
									</div>
									<!-- /.box-body -->
									<div class="box-footer">
										<button type="button" class="btn btn-primary" title="提交">提交</button>
									</div>
								</form>
							</div>
							<!-- /.box -->
						</div>
						<!--/.col (left) -->
					</section>
					<!-- /.content -->
				</div>
				<!-- /.tab-pane -->
			</div>
			<!-- /.tab-content -->
		</div>
		<!-- nav-tabs-custom -->
		<!-- /.content -->
	</div>
</body>
<script type="text/javascript">
    //日期
    var dates = $( "#startTime, #endTime" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        onSelect: function( selectedDate ) {
            var option = this.id == "startTime" ? "minDate" : "maxDate",
            instance = $( this ).data( "datepicker" ),
            date = $.datepicker.parseDate(
            instance.settings.dateFormat ||
                $.datepicker._defaults.dateFormat,
            selectedDate, instance.settings );
            dates.not( this ).datepicker( "option", option, date );
        }
    });
    function chkStartTime()
    { 
        if($("#startTime").val()=="")
       {
           var inst=$("#startTime").data("datepicker");
          $.datepicker._clearDate(inst.input);
       }
    }
    function checkDat(){
        var rs =checkMess(document.getElementById("startTime"));
        rs =checkMess(document.getElementById("endTime"))&&rs;
        return rs;
    }
    function checkMess(input){
        var id = input.id;
        var value = input.value;
        var label = input.label;

        if(id=="startTime"){
            if(!isDate(value)){
                alert("格式不正确，格式为'2008-08-08'");
                return "false";
            }

            var checkEndTime =  document.getElementById("endTime").value;
            var checkBegTime = value;
            if(checkBegTime>checkEndTime&&checkEndTime!=""){
                alert("开始时间不能晚于结束时间！");
                return "false";
            }
        }
        if(id=="endTime"){
            if(!isDate(value)){
                alert("格式不正确，格式为'2008-08-08'");
                return "false";
            }
        }

        return "true";
    }
    function isDate(dateStr) {
        if(dateStr==""){
            return "true";
        }
        var datePat = /^(\d{4})(-)(\d{2})(-)(\d{2})$/;
        var matchArray = dateStr.match(datePat); // is the format ok?

        if (matchArray == null) {
            // alert("Please enter date as either mm/dd/yyyy or mm-dd-yyyy.");
            return "false";
        }

        month = matchArray[3]; // parse date into variables
        day = matchArray[5];
        year = matchArray[1];

        if (month < 1 || month > 12) { // check month range
            //alert("Month must be between 1 and 12.");
            return "false";
        }

        if (day < 1 || day > 31) {
            //    alert("Day must be between 1 and 31.");
            return "false";
        }

        if ((month==4 || month==6 || month==9 || month==11) && day==31) {
            //   alert("Month "+month+" doesn't have 31 days!")
            return "false";
        }

        if (month == 2) { // check for february 29th
            var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
            if (day > 29 || (day==29 && !isleap)) {
                //     alert("February " + year + " doesn't have " + day + " days!");
                return "false";
            }
        }
        return "true"; // date is valid
    }
    $("#prior").keyup(function(){
        $(this).val($(this).val().replace(/[^0-9|]$/,""));
    }).blur(function(){
        $(this).val($(this).val().replace(/[^0-9]$/,""));
    });
    //替换字符
    function replaceAll(str,oldstr,newstr)
    {
        if(str!=""&&str!=undefined)
        {
            while(str.indexOf(oldstr)>=0)
            {
                str=str.replace(oldstr,newstr);
            }
            return str;
        }
        return "";
    }
    
    $("#deviceseq").blur(function(){
        //还需要验证文件后缀
        if(!isEmpty($(this),"请选择设备!")){
            $(this).focus();
            return false;
        }
    });
    
</script>
</html>
