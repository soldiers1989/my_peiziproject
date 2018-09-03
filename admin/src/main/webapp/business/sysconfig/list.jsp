<%-- 
    Document   : list
    Created on : 2011-1-12, 19:20:51
    Author     : admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file ="../header.jsp" %>
<style type="text/css">
    #searchappdiv table{border-collapse:separate;}
    #searchappdiv table tr{background-color: #FFFFFF}
    #searchappdiv table tr td{width: 27%;background-color: #FFFFFF}

</style>
<script type="text/javascript"><!--

	var page = new Page();
	//page.pageSize=10;
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
                $(".notification").hide();
                
            });
        });
      //调用初始查询
		getPageData();
        //设置页签点击处理
        // 内容列表 TAB
        $("a[href=#tab1]").click(function(){
        	$(".notification").hide();
        	getPageData();
        });

     	// 表单 TAB
        $("a[href=#tab2]").click(function(){
        	 clearFormData();
        	 if(parent.document.all("myFrameId")!=null){
               	if(parseInt(parent.document.all("myFrameId").style.height)<2000){
                  	 parent.document.all("myFrameId").style.height=parent.document.getElementsByClassName("content-wrapper")[0].clientHeight+800;
          		}
              } 
        });
		
     	// 表单确认按钮事件
        $("#saveBtn").click(function(){
            if($("#id").val()=="") {
                //新增确认 
                $.ajax({
                    url:serviceurl.baseurl+"/<%=busType%>/systemConfig/save",
                	data:"{\"code\":\""+$("#code").val() +"\",\"name\":\""+$("#name").val()+"\",\"value\":\""+$("#value").val()+"\",\"memo\":\""+$("#memo").val()+"\",\"operator\":\""+'<%=userid%>'+"\""+"}",
                    beforeSend:function(){
                    	 return validateForm();
                    },
                    error:function() {
                        ajaxAccessErrorProcess();
                    },
                    success:function(sysconfigino) {
                        var resultObject=sysconfigino
                        alert(resultObject.resultMessage);
                        if(resultObject.resultCode == 0) {
                        	clearFormData();
	                    	$("a[href=#tab1]").click();
                        }
                    }
                });
            } else {
            	alert($("#id").val());
                // 修改确认 
                $.ajax({
                	url:serviceurl.baseurl+"/<%=busType%>/systemConfig/save",
                	data:"{\"code\":\""+$("#code").val() +"\",\"name\":\""+$("#name").val()+"\",\"id\":\""+$("#id").val()+"\",\"value\":\""+$("#value").val()+"\",\"memo\":\""+$("#memo").val()+"\",\"operator\":\""+'<%=userid%>'+"\""+"}",
                    beforeSend:function(){
                        //执行提交前的提交信息验证
                    	return validateForm();
                    },
                    error:function() {
                        ajaxAccessErrorProcess();
                    },
                    success:function(sysconfigino) {
                        var resultObject=sysconfigino
                        alert(resultObject.resultMessage);
                        if(resultObject.resultCode == 0) {
                        	clearFormData();
	                    	$("a[href=#tab1]").click();
                        }
                    }
                });
            }
        });
        

  

       // 点击修改按钮
        $("a[title='修改']").live("click",function(){
        	var  param = "id="+$(this).parent().parent().attr("id")+"&operator="+'<%=userid%>';
            //访问ajax,取分类信息
            $.ajax({
                url:serviceurl.baseurl+"/<%=busType%>/systemConfig/get/id",
                contentType:"application/x-www-form-urlencoded",
                data:param,
                beforeSend:function(){
                	$("a[href=#tab2]").click();
                },
                error:function() {
                	ajaxAccessErrorProcess();
                },
                success:function(sysconfiginfo) {
                    //解析json数据,填充form
                    var resultObject=sysconfiginfo;
                    $("#id").val(resultObject.id);
                    $("#code").val(resultObject.code);
                    $("#code").attr("disabled","disabled").css("color","grey");
                    $("#name").val(resultObject.name);
                    $("#value").val(resultObject.value);
                    $("#memo").val(resultObject.memo);
                    $("#status").val(resultObject.status);
                    $("#createtime").val(resultObject.createtime);
                }
            });
        });
        
        // 点击删除按钮
        $("a[title='删除']").live("click",function(){
            var  param = "id="+$(this).parent().parent().attr("id")+"&operator="+'<%=userid%>';
            if(!confirm("删除将不能恢复，确定要继续吗？")) return false;
           //访问ajax,删除选中的分类记录
           $.ajax({
               url:serviceurl.baseurl+"/<%=busType%>/systemConfig/delete/list",
               contentType:"application/x-www-form-urlencoded",
               data:param,
               beforeSend:function(){
                   //执行提交前的提交信息验证
               },
               error:function() {

               },
               success:function(sysconfigino) {
                   var resultObject=sysconfigino;
               	   alert(resultObject.resultMessage);
               	$("a[href=#tab1]").click();
               }
           });
       });
        
       
    })

   /**
     * 列表数据填充
     */
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
        
        $("#datalist tbody tr").remove();
        //$("table tfoot").hide();
        var countNum=(page.pageNo-1)*page.pageSize;
        if(resultObject.totalPages > 0) {
            for(var i=0; i<resultObject.result.length;i++) {
                var sysconfig = resultObject.result[i];
                datatr+= "<tr id=\""+sysconfig.id+"\">"
                datatr+="<td><input type=\"checkbox\" /></td>";
                datatr+="<td style='width:40px'>"+(countNum+i+1)+"</td>";
                datatr+="<td style='width:40px'>"+sysconfig.id+"</td>";
                datatr+="<td style='width:80px'>"+sysconfig.code+"</td>";
                datatr+="<td style='width:150px'>"+sysconfig.name+"</td>";
                datatr+="<td style='width:220px'>"+sysconfig.value+"</td>";
                datatr+="<td style='width:220px'>"+sysconfig.memo+"</td>";
                datatr+="<td style='width:80px'>"+sysconfig.operator+"</td>";
                datatr+="<td style='width:150px'>"+sysconfig.operatetime+"</td>";
                datatr+="<td><a href=\"#\" title=\"修改\"><img src=\"../../resources/images/icons/pencil.png\" alt=\"修改\" /></a>";
                datatr+="<a href=\"#\" title=\"删除\"><img src=\"../../resources/images/icons/cross.png\" alt=\"删除\" /></a> </td>";
                datatr+="</tr>";
            }
        }else{
            datatr = "<tr><td colspan=\"99\">很抱歉，没有找到相关的信息！</td><tr>";
        }
        $("#datalist tbody").append(datatr);
        //设置行背景
        $('#datalist tr:even').addClass("alt-row");
        parent.document.all("myFrameId").style.height=$(".wrapper").css("height");
    }
    
    
    function  getPageData(pageNo){
    	
     	//清空列表历史数据
     	$("#datalist tbody tr").remove();
     	$(".notification").hide();
        $.ajax({
            contentType:"application/x-www-form-urlencoded",
            url:serviceurl.baseurl+"/<%=busType%>/systemConfig/get/page",
            data:"pageNo="+page.pageNo+"&code="+$("#searchcode").val()+"&name="+$("#searchname").val()+"&value="+$("#searchvalue").val()+"&operator="+'<%=userid%>',
            success:dataFill
        });
     }
    
    function formatDate(date) {
    	if(date =='') {
    		return '';
    	}
    	date = date.replace('T', ' ');
    	date = date.substring(0, date.length-6);
    	return date;
    }
    
    function validateForm() {
        if(!isEmpty($("#code"),"请填写键值!")) {
            return false;
        } 
        if(!isEmpty($("#name"),"请填写名称!")){
            return false;
        } 
        if(!isEmpty($("#value"),"请填写内容!")){
            return false;
        } 
        return true;
    }
    
    function doSelAction(type) {
        if($(":checkbox:checked").length == 0) {
            alert("请选择要操作的记录");
            return false;
        }
        var dataparam="operator="+'<%=userid%>'+"&";
        for(var i=0; i<$(":checkbox:checked").length-1;i++){
            if($(":checkbox:checked").eq(i).parent().parent().attr("id") != "") {
                dataparam+="id="+$(":checkbox:checked").eq(i).parent().parent().attr("id")+"&";
            }
        }
        if($(":checkbox:checked").eq($(":checkbox:checked").length-1).parent().parent().attr("id")!="") {
            dataparam+="id="+$(":checkbox:checked").eq($(":checkbox:checked").length-1).parent().parent().attr("id");
        }
        if(type == 'delete') {
        	deletelist(dataparam);
        }
    }
    
    
    
    function deletelist(dataparam) {
        if(!confirm("删除将不能恢复，确定要继续吗？")) return false;
        //访问ajax,删除选中的分类记录
        $.ajax({
            contentType:"application/x-www-form-urlencoded",
            url:serviceurl.baseurl+"/<%=busType%>/systemConfig/delete/list",
            data:dataparam,
            beforeSend:function(){
                //$("input[value='批量删除']").hide();
                //执行提交前的提交信息验证
            },
            error:function() {

            },
            success:function(sysconfigino) {
                var resultObject=sysconfigino;
               	alert(resultObject.resultMessage);
               	$("a[href=#tab1]").click();
            }
        });
    }
    function addnew() {
    	$("a[href=#tab2]").click();
    	clearFormData();
    }
    function clearFormData() {
    	$("#code").removeAttr("disabled","disabled").css("color","");
    	$("#id").val();
    	$("#code").val();
    	$("#name").val();
    	$("#value").val();
    	$("#memo").val();
        $("#form1").resetForm();
    }
    function IFrameResize(){
   	 	var obj = parent.document.getElementById("myFrameId"); //取得父页面IFrame对象
   	 	obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度
   	}
    
--></script>
<body onload="IFrameResize();" class="skin-blue">
	<div class="wrapper" style="background: #fff;">
		<!-- Left side column. contains the logo and sidebar -->
		<!-- Right side column. Contains the navbar and content of the page -->
              <!-- Custom Tabs -->
              <div class="nav-tabs-custom">
				<h5>&nbsp;&nbsp;&nbsp;&nbsp;</h5>
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;系统管理 <small>系统配置</small></h3>
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
										<h3 class="box-title">系统配置检索</h3>
										<div class="box-tools">
											<div class="input-group">
												<input type="text" id="searchvalue" name="searchvalue" class="form-control input-sm pull-right" style="width: 150px;" placeholder="内容"/>
												<input type="text" id="searchname" name="searchname" class="form-control input-sm pull-right" style="width: 150px;" placeholder="名称"/>
												<input type="text" id="searchcode" name="searchcode"  class="form-control input-sm pull-right" style="width: 150px;" placeholder="键值"/>
												<div class="input-group-btn">
													<button class="btn btn-sm btn-default" style="height: 30px;"
													onclick="getPageData();">
													<i class="fa fa-search"></i>
												</button>
												</div>
											</div>
										</div>
									</div>
									<!-- /.box-header -->
				                    <div class="table-responsive mailbox-messages">
										<div class="mailbox-controls">
      										<button class="btn btn-default btn-sm checkbox-toggle" title="全选/全不选"><i class="fa fa-square-o"> 全选</i></button>
										  <div class="btn-group">
										  	<button class="btn btn-default btn-sm" onclick="addnew();" title="新增"><i class="fa fa-plus"> 新增</i></button>
										    <button class="btn btn-default btn-sm" onclick="doSelAction('delete');" title="批量删除"><i class="fa fa-trash-o"> 批量删除</i></button>
										  </div><!-- /.btn-group -->
                    						<button class="btn btn-default btn-sm" onclick="location.reload();" title="刷新"><i class="fa fa-refresh"> 刷新</i></button>
										</div> 
										<table id="datalist" class="table table-hover table-striped">
											<thead>
							                    <tr>
							                        <th>选择	</th>
							                        <th>序号</th>
							                        <th>ID</th>
							                        <th>键值</th>
							                        <th>名称</th>
							                        <th>内容</th>
							                        <th>描述</th>
							                        <th>操作人</th>
							                        <th>操作时间</th>
							                        <th style="width: 15%">操作</th>
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
					                <!-- Loading (remove the following to stop the loading)-->
<!-- 					                <div class="overlay">
					                  <i class="fa fa-refresh fa-spin">正在执行...</i>
					                </div> -->
					                <!-- end loading -->
								</div>
								<!-- /.box -->
							</div>
					</section>
                  </div><!-- /.tab-pane -->
                  
                  <div class="tab-pane" id="tab2">
				        <!-- Main content -->
				        <section class="content">
				          <div class="row">
				            <!-- left column -->
				            <div class="col-md-12">
				              <!-- general form elements -->
				              <div class="box box-primary">
				                <div class="box-header">
				                  <h3 class="box-title">编辑</h3>
				                </div><!-- /.box-header -->
				                <!-- form start -->
				                <form name="form1" id="form1">
				                  <div class="box-body">
				                    <!-- text input -->
				                    <div class="form-group" style="display: none;">
				                      <label>配置ID</label>
				                      <input type="text" id="id" name="id" class="form-control" style="width: 40%;" placeholder="请输入 ..." disabled/>
				                    </div>
				                    <div class="form-group">
				                      <label>键值</label>
				                      <input type="text" id="code" name="code" class="form-control" style="width: 40%;" placeholder="*必须项(1-45位)" />
				                    </div>
				                    <div class="form-group">
				                      <label>名称</label>
				                      <input type="text" id="name" name="name" class="form-control" style="width: 40%;" placeholder="*必须项(1-100位)" />
				                    </div>
				                    <div class="form-group">
				                      <label>内容</label>
				                      <textarea id="value" name="value" class="form-control" style="width: 40%;" placeholder="请输入 ..." ></textarea>
				                    </div>
				                    <div class="form-group">
				                      <label>扩展</label>
				                      <textarea id="memo" name="memo" class="form-control" style="width: 40%;" placeholder="请输入 ..." ></textarea>
				                    </div>
				                  </div><!-- /.box-body -->
				
				                  <div class="box-footer">
				                    <button type="button" class="btn btn-primary" id="saveBtn">提交</button>
				                  </div>
				                </form>
				              </div><!-- /.box -->
				            </div><!--/.col (left) -->
				          </div>   <!-- /.row -->
				        </section><!-- /.content -->
                  </div><!-- /.tab-pane -->
                </div><!-- /.tab-content -->
              </div><!-- nav-tabs-custom -->
			<!-- /.content -->
	</div>
