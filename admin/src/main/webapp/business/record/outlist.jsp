<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="../header.jsp"%>
<script type="text/javascript">
    var page = new Page();
    page.pageSize = 10;
    var manu="";
    var validateFlag=true;
    var operator="<%=userid%>";
    //page.pageSize=3;
     var CRUD_DIV_ID = ["tab2"];
    $(document).ready(function() {
        $.ajaxSetup({
            cache:false,
            type:"POST",
            contentType:"application/json",
            dataType:"json"
        });

        //设置页签点击处理
        $("a[href=#tab1]").click(function(){
        	$(".notification").hide();
        	getPageData();
        });
        
        //设置页签点击处理
        $("a[href=#tab2]").click(function(){
        	 $(".notification").hide();
        	 $("#account").next().hide();
        	 $("#password").next().hide();
        	
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
        

    });
    
    function getPageData(){
    	$.ajax({
        	contentType:"application/x-www-form-urlencoded",
            url:serviceurl.baseurl+"/<%=busType%>/outrecord/get/page",
            dataType:"json",
            data:"pageNo=" + page.pageNo+"&pageSize="+page.pageSize+"&phone="+$("#searchphone").val()+"&status="+$("#searchstatus").val()+ "&operator=" + operator,
            success:dataFill
        });
    }
		
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
        if(resultObject.totalPages > 0&&resultObject.result!=undefined) {
            var countNum=(page.pageNo-1)*page.pageSize;
            for(var i=0; i<resultObject.result.length;i++) {
                var adaptor = resultObject.result[i];
                datatr+= "<tr id=\""+adaptor.id+"\">"
                datatr+="<td><input name=\"devcheckbox\" type=\"checkbox\" /></td>";
                datatr+="<td>"+(countNum+i+1)+"</td>";
                datatr+="<td>"+adaptor.phone+"</td>";
                datatr+="<td>"+adaptor.amount+"</td>";
                datatr+="<td>"+adaptor.statusStr+"</td>";
                datatr+="<td>"+adaptor.createtime+"</td>";
                //datatr+="<td><a href=\"#\" title=\"修改\"><img src=\"../../resources/images/icons/pencil.png\" alt=\"修改\" /></a>";
                //datatr+="<td><a href=\"#\" title=\"删除\"><img src=\"../../resources/images/icons/cross.png\" alt=\"删除\" /></a> </td>";
                datatr+="</tr>";
            }
        }else{
            datatr = "<tr><td colspan=\"6\">抱歉，没有查询到符合条件的记录</td><tr>";
        }
        $("#datalist tbody").append(datatr);
        $('#datalist tr:even').addClass("alt-row");
        parent.document.all("myFrameId").style.height=$(".wrapper").css("height");
    }
    
    //获取应用列表中被选中的应用id集合，返回为数组
    function getSelectedIds(){
        var ret = new Array();
        $("#datalist tbody input:checkbox").each(function(){
            if($(this).attr("checked")){
                ret.push($(this).parent().parent().attr("id"));
            }
        });
        return ret;
    }
    
    function del(ids){
        if(!confirm('该记录确认更新?')){
            return;
        }
        //ajax 
        $.ajax({
            url: serviceurl.baseurl+'/<%=busType%>/outrecord/update/list',
            type: 'POST',
            traditional :true,//使数组直接变成同一名字的查询字段
            data: {'ids':ids,'operator':'<%=userid%>'},
            success: function(data){
            	alert("更新状态成功!");
                getPageData(page.pageNo);
            }
        });
    } 
    
    function batchDel(){
    	var ids = getSelectedIds();
        if(ids.length==0){
            alert("您还没有选择要更新的记录！");
            return;
        }
        if(ids){
            del(ids);
        }
    }
</script>

</head>
<body class="skin-blue">
	<div class="wrapper" style="background: #fff;">
		<!-- Custom Tabs -->
		<div class="nav-tabs-custom">
			<h5>&nbsp;&nbsp;&nbsp;&nbsp;</h5>
			<h3>
				&nbsp;&nbsp;&nbsp;&nbsp;记录管理 <small>出金列表</small>
			</h3>
			<ul class="nav nav-tabs pull-right">
				<!-- 
				<li><a href="#tab2" data-toggle="tab">表单</a></li>
				-->
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
											<select id="searchstatus" name="searchstatus"  class="form-control input-sm pull-right" style="width: 180px;">
												<option value="-1">--靖选择处理状态--</option>
												<option value="0">未处理</option>
												<option value="1">已处理</option>
											</select>
											<input type="text" id="searchphone" name="searchphone"  class="form-control input-sm pull-right"  style="width: 150px;" placeholder="电话" />
											<div class="input-group-btn">
												<button class="btn btn-sm btn-default" style="height: 30px;" onclick="getPageData()">
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
											<button class="btn btn-default btn-sm"  title="批量更新" onclick="batchDel();">
												<i class="fa fa-trash-o">&nbsp;批量更新</i>
											</button>
											
										</div>
										<!-- <button class="btn btn-default btn-sm" onclick="location.reload();" title="刷新">
											<i class="fa fa-refresh">&nbsp;刷新</i>
										</button> -->
									</div>
									<table id="datalist" class="table table-hover table-striped">
										<thead>
											<tr>
												<!-- Check all button -->
												<th>选择</th>
												<th>序号</th>
												<th>手机号</th>
												<th>金额</th>
												<th>状态</th>
												<th>时间</th>
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
            					<form action="#" method="post" id="fileForm" name="fileForm">
               						<input type="hidden" id="id" name="id" value="" />
									<div class="box-body">
										<div class="form-group">
											<label><span style='margin-right: 4px; color: #c00;'>*</span>帐号</label> 
											<input type="text" id="account" name="account" maxlength="50" class="form-control" style="width: 40%;" placeholder="*必须项" />

										</div>
										<div class="form-group">
											<label><span style='margin-right: 4px; color: #c00;'>*</span>密码</label> 
											<input type="text"  id="password" name="password"   maxlength="45" class="form-control" style="width: 40%;" placeholder="*必须项（修改可以不填默认密码不变）" />
										</div>
										
									</div>
									<!-- /.box-body -->
									<div class="box-footer">
										<button type="button" class="btn btn-primary" title='提交' id="saveBtn">提交</button>
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
    
</script>
</html>

