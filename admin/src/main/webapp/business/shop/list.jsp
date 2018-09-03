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
            var msg = $("#shopDesci").val();
     		//过滤 回车、空格等
     		msg=msg.replace(/\r/g,'\\r').replace(/\n/g,'\\n');;
             // 修改 
             $.ajax({
             	url:serviceurl.baseurl+"/<%=busType%>/shop/save",
             	data:'{'
             		+'"id":"'+$("#id").val()+'"'
             		+',"name":"'+$("#name").val()+'"'
             		+',"shopDesci":"'+msg+'"'
             		+',"prior":"'+$("#prior").val()+'"' 
             		+',"icon":"'+$("#icon").val()+'"'
             		+',"type":"'+$("#type").val()+'"'
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
                url:serviceurl.baseurl+"/<%=busType%>/shop/get/primarykey",
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
                    $("#name").val(resultObject.name);
                    $("#shopDesci").val(resultObject.shopDesci);
                    $("#prior").val(resultObject.prior);
                    $("#type").val(resultObject.type);
                    $("#createtime").val(resultObject.createtime);
                    $("#icon").val(resultObject.icon);
                    $("#icon-img").attr("src",resultObject.iconurl);
                	$("#icon-view").attr("href",resultObject.iconurl);
                }
            });
        });


        //单个删除
        $("a[title='删除']").live("click",function(){
            del($(this).parent().parent().attr("id"));
        });
        
        //图片上传
        var icon_uploader3 = new qq.FileUploader({
            allowedExtensions: ["jpg","png","gif"],
            multiple: false,
            params: {type:"shop" },//class表示货架图标的上传
            element: document.getElementById("styleIcon_uploader"),
            action: RESTFUL_BASE + '/<%=busType%>/upload/picture',
            template: '<div class="qq-uploader">' +
                '<div class="qq-upload-drop-area"><span>Drop files here to upload</span></div>' +
                '<div class="qq-upload-button">文件上传</div>' +
                '<ul class="qq-upload-list"></ul>' +
                '</div>',
            fileTemplate: '<li>' +
                '<span class="qq-upload-file"></span>' +
                '<span class="qq-upload-spinner"></span>' +
                '<span class="qq-upload-size"></span>' +
                '<a class="qq-upload-cancel" href="#">取消</a>' +//中文显示
            '<span class="qq-upload-failed-text">上传失败!</span>' +//中文显示
            '</li>',
            onSubmit: function(id, fileName){
            
                this.params.createtime = $("#createtime").val();//设置createtimeurl
            },
            onComplete: function(id, fileName, responseJSON){
                if(responseJSON.success){//上传成功
                    var filename = responseJSON.filename;
                    var url = responseJSON.filepath;
                    var fn = responseJSON.filename;
                    $("#icon").val(fn);
                    var picpath = responseJSON.filepath;
                    $("#icon-view").attr("href",picpath);
                    $("#icon-img").attr("src",picpath);
                }else{//上传失败
                    var msg = "上传图标失败！原因："+((!responseJSON.error|| responseJSON.error=="")?"服务错误！":responseJSON.error);

                    if(msg.length>100){
                        msg = msg.substring(0, 99)+"......";
                    }
                    $("#operateresult").show();
                    if($("#operateresult").hasClass("success")){
                        $("#operateresult").removeClass("success").addClass("error").html(msg);
                    } else {
                        $("#operateresult").addClass("error").html(msg);
                    }
                }
            }
        });
        icon_uploader3._onSubmit=function(id, fileName){
            this._listElement.innerHTML="";//只有一个列表项
            qq.FileUploaderBasic.prototype._onSubmit.apply(this, arguments);
            this._addToList(id, fileName);
        };
        
         
        
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
            url:serviceurl.baseurl+"/<%=busType%>/shop/get/page",
            type: 'POST',
            data: {'name':$('#searchname').val(),'pageNo':pageNo,'operator':'<%=userid%>'},
            success:dataFill
        });
    }
    //删除方法
    function del(ids){
        if(!confirm('该删除将不可恢复,确认删除?')){
            return;
        }
        //ajax 
        $.ajax({
            url: serviceurl.baseurl+'/<%=busType%>/shop/delete/list',
            type: 'POST',
            traditional :true,//使数组直接变成同一名字的查询字段
            data: {'ids':ids,'operator':'<%=userid%>'},
            success: function(data){
                //解析json数据,填充form并填充操作结果提示
                formSubmitSuccesssTip2(data);
                getPageData(page.pageNo);
            }
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
                datatr+="<td>"+resultData.name+"</td>";
                datatr+="<td>"+"<a href=\"#\" class=\"userpic\"><img style='width:40px;height:40px;' id='iconpath"+resultData.id+"'  src=\""+resultData.iconurl+"\"></a>"+"</td>"; // 店铺图标
                datatr+="<td>"+resultData.createtime+"</td>";
                datatr+="<td>"+resultData.operator+"</td>";
                datatr+="<td><a href=\"#\" title=\"修改\"><img src=\"../../resources/images/icons/pencil.png\" alt=\"修改\" /></a></a>";
                datatr+="<a href=\"#\" title=\"删除\"><img src=\"../../resources/images/icons/cross.png\" alt=\"删除\" /></a> </td>";
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
    	 if(!isEmpty($("#name"),"请填写店铺名称!")) {
             return false;
         }    	 
    	 if(!isEmpty($("#type"),"请选择店铺类型!")) {
             return false;
         }  
    	 if(!isEmpty2($("#prior"),"请填写排序!")){
              return false;
         }
         　	 var r = /^\+?[1-9][0-9]*$/;　　//正整数
         if(!r.test($("#prior").val())){
          	alert("排序只能输入数字") ; 
          	return false ;
         }
         　	 if($("#icon").val()==''){
            alert("请上传图标！") ;
            return  false ; 
         }
     	 
       	 return true;
    }
     // 清空form表单数据
     function resetForm(){
        $("#form1").resetForm();
        $("#icon-img").attr("src","../../resources/images/zanque.jpg");
        $("#icon-view").attr("href","../../resources/images/zanque.jpg");
    }
     
    function add(){
     	resetForm();
         $("a[href=#tab2]").click();
     }
     
    //批量操作
    function batchDel(){
    	var ids = getSelectedIds();
        if(ids.length==0){
            alert("您还没有选择要删除的记录！");
            return;
        }
        if(ids){
            del(ids);
        }
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
				&nbsp;&nbsp;&nbsp;&nbsp;店铺菜单管理 <small>店铺管理</small>
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
									<h3 class="box-title">店铺检索</h3>
									<div class="box-tools">
										<div class="input-group">
											<input type="text" id="searchname" name="searchname"
												class="form-control input-sm pull-right"
												style="width: 150px;" placeholder="店铺名称" />
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
										<button class="btn btn-default btn-sm checkbox-toggle"
											title="全选/全不选">
											<i class="fa fa-square-o">&nbsp;全选</i>
										</button>
										<div class="btn-group">
											<button class="btn btn-default btn-sm"  title="新增" onclick="add();">
												<i class="fa fa-plus">&nbsp;新增</i>
											</button>
											<button class="btn btn-default btn-sm" title="批量删除" onclick="batchDel();">
												<i class="fa fa-trash-o">&nbsp;批量删除</i>
											</button>
										</div>
									</div>
									<table id="datalist" class="table table-hover table-striped">
										<thead>
											<tr>
												<th><input class="check-all" type="checkbox" /></th>
												<th>序号</th>
												<th>ID</th>
												<th>店铺名称</th>
												<th>店铺图标</th>
												<th>创建时间</th>
												<th>操作者</th>
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
											<label>店铺名称</label> <input type="text" id="name" name="name"
												class="form-control" style="width: 40%;"
												placeholder="*必须项（长度1-60位）" />
										</div>
										<div class="form-group">
											<label>店铺类型</label> <select id="type" name="type"
												class="form-control" style="width: 40%;">
												<option value="">--请选择--</option>
												<option value="SIMPLE">简洁版</option>
												<option value="NORMAL">标准版</option>
											</select>
										</div>
										<div class="form-group">
											<label>店铺排序</label> <input type="text" type="text" id="prior"
												name="prior" maxlength="11" placeholder="*必须项（输入数字）"
												style="width: 40%; display: inline;" class="form-control" />
											</br>
										</div>
										<div class="form-group">
											<label>店铺icon</label> <input type="text" id="icon"
												name="icon" style="display: none"> <span
												class="input-notification success png_bg"></span>
											<div>
												<table style="width: 45%;" border="0">
													<tr>
														<td>

															<div id="styleIcon_uploader" title="上传店铺图片">
																<noscript>
																	<p>请启用javascript.</p>
																</noscript>
															</div>
														</td>
														<td>
															<div id="styleIcon_uploader-pic">
																<ul class="shortcut-buttons-set">
																	<li><a class="shortcut-button" target="blank"
																		href="<%=basePath%>/resources/images/zanque.jpg"
																		id="icon-view"> <span> <img
																				src="<%=basePath%>/resources/images/zanque.jpg"
																				id="icon-img" /> <br /> 展现图片
																		</span>
																	</a></li>
																</ul>
															</div>
														</td>
													</tr>
												</table>
											</div>
										</div>
										<div class="form-group">
											<label>店铺介绍</label>
											<textarea cols="3" rows="3" id="shopDesci"
												style="width: 40%;" name="shopDesci" class="form-control"
												placeholder="(长度0-500位)" maxlength="1000"></textarea>
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