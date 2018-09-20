<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="../header.jsp"%>
<style type="text/css">
#searchdiv table {
	border-collapse: separate;
}

#searchdiv table tr {
	background-color: #FFFFFF
}

#searchdiv table tr td {
	background-color: #FFFFFF;
	width: 27%
}
</style>
<script type="text/javascript">
	var page = new Page();
	//page.pageSize=8;
	
    $(document).ready(function() {
        //$("#small-input").datepicker();
		var $start = $("#startSpan").ajaxStart(function(){  
	        $(this).html('正在执行...');  
	        $start.show();
	    }).ajaxStop(function(){  
	        $(this).html('');
	        $start.hide();
	    }); 
        $.ajaxSetup({
            cache:false,
            type:"POST",
            contentType:"application/json",
            dataType:"json"
        });
        //设置页签点击处理
        $("a[href=#tab1]").click(function(){
        	  $(".notification").hide();
              getPageData(page.pageNo);
        });
        $("a[href=#tab2]").click(function(){
        	 resetForm();
        	 $(".notification").hide();
        	 if(parent.document.all("myFrameId")!=null){
              	if(parseInt(parent.document.all("myFrameId").style.height)<2000){
                 	 parent.document.all("myFrameId").style.height=parent.document.getElementsByClassName("content-wrapper")[0].clientHeight+800;
         		}
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
		//调用初始查询
		getPageData();
		$("#saveBtn").click(function(){
             $.ajax({
             	url:serviceurl.baseurl+"/<%=busType%>/user/save",
             	data:'{'
             		+'"id":"'+$("#id").val()+'"'
             		+',"amount":"'+$("#amount").val()+'"'
             		+',"realName":"'+$("#realName").val()+'"' 
             		+',"centNo":"'+$("#centNo").val()+'"'
             		+',"bankName":"'+$("#bankName").val()+'"'
             		+',"bankNo":"'+$("#bankNo").val()+'"'
             		+',"operator":"<%=userid%>"'
             		+'}',
                 beforeSend:function(){
                     //执行提交前的提交信息验证
                    return validateForm();
                 },
                 error:function() {
                     ajaxAccessErrorProcess2();
                 },
                 success:function(info) {
                     //解析json数据,填充form并填充操作结果提示
                     formSubmitSuccesssTip2(info);
                     var resultObject=info;
                     if(resultObject.resultCode == 0) {
                      	$("a[href=#tab1]").click();
                     }
                 }
             });
        });

        $("input[value='搜索']").click(function(){
            //访问ajax,取分类信息,刷新表格
            getPageData();
        });
       
        //修改
        $("a[title='修改']").live("click",function(){
            //访问ajax,取分类信息
            $.ajax({
                url:serviceurl.baseurl+"/<%=busType%>/user/get/primarykey",
                type:"POST",
                data:{'id':$(this).parent().parent().attr("id"),'operator':'<%=userid%>'},
                beforeSend:function(){
                    //执行提交前的提交信息验证
                	$("a[href=#tab2]").click();
                },
                error:function() {},
                success:function(resultinfo) {
                    //解析json数据,填充form
                    var resultObject=resultinfo;
                    $("#id").val(resultObject.id);
                    $("#amount").val(resultObject.amount);
                    $("#realName").val(resultObject.realName);
                    $("#centNo").val(resultObject.centNo);
                    $("#bankName").val(resultObject.bankName);
                    $("#bankNo").val(resultObject.bankNo);
                }
            });
        });


        //单个删除
        $("a[title='删除']").live("click",function(){
            del($(this).parent().parent().attr("id"));
        });
        
        
         
        
    })
    
    
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

    //分页查询
    function  getPageData(pageNo){
        $.ajax({
            url:serviceurl.baseurl+"/<%=busType%>/user/get/page",
            type: 'POST',
            data: {'name':$('#searchname').val(),'pageNo':pageNo,'operator':'<%=userid%>'},
            success:dataFill
        });
    }

   //列表数据填充
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
          getPageData(page.pageNo);
        });
        $(".pagination").show();
        
        $("#datalist tbody tr").remove();
        //$("table tfoot").hide();
        var countNum=(page.pageNo-1)*page.pageSize;
        if(resultObject.totalPages > 0) {
            for(var i=0; i<resultObject.result.length;i++) {
                var resultData = resultObject.result[i];
                datatr+= "<tr id=\""+resultData.id+"\">"
                datatr+="<td><input type=\"checkbox\" /></td>";
                datatr+="<td>"+(countNum+i+1)+"</td>";
                datatr+="<td>"+resultData.id+"</td>";
                datatr+="<td>"+resultData.phone+"</td>";
                datatr+="<td>"+resultData.amount+"</td>";
                datatr+="<td>"+resultData.remdPhone+"</td>";
               // datatr+="<td>"+"<a href=\"#\" class=\"userpic\"><img style='width:40px;height:40px;' id='iconpath"+resultData.id+"'  src=\""+resultData.iconurl+"\"></a>"+"</td>"; // 店铺图标
                datatr+="<td>"+resultData.createtime+"</td>";
                datatr+="<td><a href=\"#\" title=\"修改\"><img src=\"../../resources/images/icons/pencil.png\" alt=\"修改\" /></a></a>";
                //datatr+="<a href=\"#\" title=\"删除\"><img src=\"../../resources/images/icons/cross.png\" alt=\"删除\" /></a> </td>";
                datatr+="</tr>";
            }
        }else{
            datatr = "<tr><td colspan=\"20\">很抱歉，没有找到相关的信息！</td><tr>";
        }
        $("#datalist tbody").append(datatr);
        //设置行背景
        $('#datalist tr:even').addClass("alt-row");
        parent.document.all("myFrameId").style.height=$(".wrapper").css("height");
    }
    
    //校验提交表单
    function validateForm() {
    	if ($("#id").val()==""){
    		alert("请通过列表页面点击修改图标,进行修改!");
    		return false;
    	}
       	return true;
    }
     // 清空form表单数据
     function resetForm(){
        $("#form1").resetForm();
    }
     
    function add(){
     	resetForm();
         $("a[href=#tab2]").click();
     }
     
    function IFrameResize(){
   	 	var obj = parent.document.getElementById("myFrameId"); //取得父页面IFrame对象
   	 	obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度
   	} 
--></script>
<body onload="IFrameResize();" class="skin-blue">
	<div class="wrapper" style="background: #fff;">
		<!-- Custom Tabs -->
		<div class="nav-tabs-custom">
			<h5>&nbsp;&nbsp;&nbsp;&nbsp;</h5>
			<h3>
				&nbsp;&nbsp;&nbsp;&nbsp;用户管理 <small>用户列表</small>
			</h3>
			<ul class="nav nav-tabs pull-right">
				<li><a href="#tab2" data-toggle="tab">表单</a></li>
				<li class="active"><a href="#tab1" data-toggle="tab">列表</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<section class="content">
						<div class="col-xs-12">
							<div class="box">
								<div class="box-header">
									<h3 class="box-title">用户检索</h3>
									<div class="box-tools">
										<div class="input-group">
											<input type="text" id="searchname" name="searchname"
												class="form-control input-sm pull-right"
												style="width: 150px;" placeholder="手机号" />
											<div class="input-group-btn">
												<button class="btn btn-sm btn-default" style="height: 30px;"
													onclick="getPageData();">
													<i class="fa fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="table-responsive mailbox-messages">
									<div class="mailbox-controls">
										
									</div>
									<table id="datalist" class="table table-hover table-striped">
										<thead>
											<tr>
												<th><input class="check-all" type="checkbox" /></th>
												<th>序号</th>
												<th>ID</th>
												<th>手机号</th>
												<th>余额</th>
												<th>推荐人手机号</th>
												<th>创建时间</th>
												<th>操作选择</th>
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
				<!-- Page Head -->
				<!-- End #tab1 -->
				<div class="tab-pane" id="tab2">
					<section class="content">
						<!-- left column -->
						<div class="col-md-12">
							<!-- general form elements -->
							<div class="box box-primary">
								<div class="box-header">
									<h3 class="box-title">编辑</h3>
								</div>
								<form name="form1" id="form1">
									<input type="hidden" id="id" name="id" value="" /> 
									<input type="hidden" id="createtime" name="createtime" value="" />
									<div class="box-body">
										<div class="form-group">
											<label>余额</label> <input type="text" id="amount" name="amount"
												class="form-control" style="width: 40%;"
												placeholder="*必须项 数字" />
										</div>
										<div class="form-group">
											<label>真实姓名</label> <input type="text" id="realName" name="realName"
												class="form-control" style="width: 40%;"/>
										</div>
										<div class="form-group">
											<label>身份证号</label> <input type="text" id="centNo" name="centNo"
												class="form-control" style="width: 40%;"/>
										</div>
										<div class="form-group">
											<label>银行开户行</label> <input type="text" id="bankName" name="bankName"
												class="form-control" style="width: 40%;"/>
										</div>
										<div class="form-group">
											<label>银行帐号</label> <input type="text" id="bankNo" name="bankNo"
												class="form-control" style="width: 40%;"/>
										</div>
										<div class="box-footer">
											<button type="button" class="btn btn-primary" id="saveBtn">提交</button>
										</div>
								</form>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>