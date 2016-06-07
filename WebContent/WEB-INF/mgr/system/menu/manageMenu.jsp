<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-wrapper">
	<section class="content">
	<div class="row">
                <div class="col-lg-12">
                      <div class="panel panel-primary" style="border-color:#3c8dbc;">
			<div class="panel-heading" style="background-color: #3c8dbc;border-color:#3c8dbc;">${requestScope.title }</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<a class="btn btn-success" onclick="addMenuDialog()"><i class="fa fa-plus"></i> 新增</a>
                            <a class="btn btn-info" onclick="_editMenuDialog()"><i class="fa fa-edit"></i> 修改</a>
                            <a class="btn btn-danger" onclick="_deleteMenu()"><i class="fa fa-remove"></i> 删除</a>
                            <div class="dataTable_wrapper" style="margin-top:10px;">
                            	
                                <table id="menuTable" class="table table-bordered table-striped table-hover">
                                   
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
 
	</section>
</div>

<div class="modal fade" id="MenuDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <a class="close" onclick="cancel()" aria-label="Close"><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
      	<div class="well" style='margin-top:25px;'>
        <form id="Menu" class="form-horizontal">
  			<div class="form-group">
    			<label for="name" class="col-sm-3 control-label">名称</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="name" name="name" placeholder="名称">
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="url" class="col-sm-3 control-label">URL</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="url" name="url" placeholder="URL">
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="parentId" class="col-sm-3 control-label">父级菜单</label>
    			<div class="col-sm-6">
    				<select class="form-control" id="parentId" name="parentId">
						<option value="">无</option>
							<c:forEach var="menu" items="${requestScope.menuList }">
						<option value="${menu.id }">${menu.name }</option>
							</c:forEach>
					</select>   				
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="authorization" class="col-sm-3 control-label">权限</label>
    			<div class="col-sm-6">
    				<select class="form-control" id="authorization" name="authorization">
    					<option value="1">管理员</option>
    					<option value="2">普通员工</option>
    				</select>				
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="orderFlag" class="col-sm-3 control-label">排序优先级</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="orderFlag" name="orderFlag" placeholder="排序优先级">
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="icon" class="col-sm-3 control-label">图标</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="icon" name="icon" placeholder="图标">
    			</div>
  			</div>  
  			<input type="hidden" id="id" name="id" />
  						 			
  		</form>
  		</div>
      </div>
      <div class="modal-footer">
      	<span id="message" style="color:red;"></span>&nbsp;
        <a class="btn btn-success" id="submit" action="">保存</a>
        <a class="btn btn-danger"  onclick="cancel()">取消</a>
      </div>
    </div>
  </div>
</div>
<script>
function UrlSearch() {
	   var name, value; 
	   var str = location.href; //取得整个地址栏
	   var num = str.indexOf("?") 
	   str = str.substr(num+1); //取得所有参数   stringvar.substr(start [, length ]

	   var arr = str.split("&"); //各个参数放到数组里
	   for(var i=0; i<arr.length; i++){ 
		   num = arr[i].indexOf("="); 
		   if(num > 0) { 
			   name = arr[i].substring(0,num);
			   value = arr[i].substr(num+1);
			   this[name] = value;
		} 
	} 
} 

$(document).ready(function() {
	bootbox.setDefaults({locale:"zh_CN"});
	 
	var request = new UrlSearch(); //实例化
	var page = 1;
	var pageSize = 10;
	if (request.page != null) {
		page = parseInt(request.page);
	}
	if (request.pageSize != null) {
		pageSize = parseInt(request.pageSize);
	}
	$('#menuTable').bootstrapTable({
 	 	url: "list", 
 	    dataType: "json",
 	    pagination: true, //分页
 	    singleSelect: false,
 	    uniqueId: "id",
 	    pageSize: pageSize,
 	    pageNumber: page,
 	    sidePagination: "server", //服务端处理分页
 	          columns: [
 	                    {
 	                    	title: '<input type="checkbox" id="allCheckbox" />',
   	                      	align: 'center',
   	                     	width: '3%',
   	                      	valign: 'middle',
   	                     	formatter:function(value,row,index){
	                    		 return "<input type='checkbox' class='selCheckbox' value='"+ row.id +"' />";
	                    	}
 	                    }, 
 	                  {
 	                    title: '名称',
 	                      field: 'name',
 	                      width: '10%',
 	                      align: 'center',
 	                      valign: 'middle'	                     
 	                  }, 
 	                  {
 	                      title: 'URL',
 	                      field: 'url',
 	                      width: '20%',
 	                      align: 'center',
 	                      valign: 'middle',
 	                     
 	                  }, 
 	                  {
 	                      title: '父级菜单',
 	                      field: 'parentName',
 	                      width: '10%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                      title: '层数',
 	                      field: 'level',
 	                      width: '5%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                      title: '权限',
 	                      field: 'authorization',
 	                      width: '10%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                      title: '排序优先级',
 	                      field: 'orderFlag',
 	                      width: '5%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                      title: '图标',
 	                      field: 'icon',
 	                      width: '20%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                	  title: '操作',
 	                	  field: '',
 	                	  width: '10%',
 	                	  align: 'center',
	                      valign: 'middle',
	                      formatter:function(value,row,index){  
	                          var e = '<a class="btn btn-info btn-xs" onclick="editMenuDialog(\''+ row.id + '\')"><i class="fa fa-edit"></i></a> ';  
	                          var d = '<a class="btn btn-danger btn-xs" onclick="deleteMenu(\''+ row.id +'\')"><i class="fa fa-remove"></i></a> ';  
	                          return e+d;  
	                      } 
 	                  }
 	              ],
 	             onPageChange:function(number, size) {
 	            	window.history.pushState(null, null, "manageMenu?page=" + number + "&pageSize=" + size); 	
 	             },
 	             onLoadSuccess:function() {
 	            	$('input[type="checkbox"]').iCheck({
 	       	         checkboxClass: 'icheckbox_minimal-blue',
 	       	 		});
 	      			$("#allCheckbox").on('ifChecked', function(event){  
 	      				$(".selCheckbox").iCheck('check');
 	      			}).on('ifUnchecked', function(event){
 	      				$(".selCheckbox").iCheck('uncheck');
 	      			});
 	             }
 	             
 	                   
 	   });
	

	
	
	$("#submit").click(function() {
		if (!validate($("#id").val())) {
			return false;
		}

		$.ajax({
			type: "POST",
			url: $(this).attr("action"),
			data: $("#Menu").serialize(),
			dataType: "json",
			success: function(data) {
				if (data.status == 1) {
					$('#MenuDialog').modal("hide");
					resetValue();				
					bootbox.alert({
						size:"small",
						message:data.message,
						callback:function() {
							location.reload(); 
						}
					});
					
				} else {
					$("#message").html("");
					$("#message").html(data.message);
				}
			},
			error:function(){
				$("#message").html("");
				$("#message").html("未知错误");
			}
		})
	})

})

function validate(id) {
	if ($.trim($("#name").val()) == "") {
		$("#message").html("");
		$("#message").html("请输入名称");
		$("#name").focus();
		return false;
	}
	if ($.trim($("#url").val()) == "") {
		$("#message").html("");
		$("#message").html("请输入URL");
		$("#url").focus();
		return false;
	}
	if ($.trim($("#parentId").val()) != "" && $.trim($("#parentId").val()) == id) {
		$("#message").html("");
		$("#message").html("非法的父级菜单");
		$("#parentId").focus();
		return false;
	}
	if ($.trim($("#orderFlag").val()) == "") {
		$("#message").html("");
		$("#message").html("请输入排序优先级");
		$("#orderFlag").focus();
		return false;
	}
	if ($.trim($("#orderFlag").val()).length > 2) {
		$("#message").html("");
		$("#message").html("限制2个字符");
		$("#orderFlag").focus();
		return false;
	}
		
	return true;
}

function resetValue() {
	$("#allCheckbox").iCheck('uncheck');
	$("#name").val("");
	$("#url").val("");
	$("#parentId").prop('selectedIndex', 0);
	$("#id").val("");
	$("#authorization").prop('selectedIndex', 0);
	$("#orderFlag").val("");
	$("#icon").val("");
	$("#message").html("");
}

function addMenuDialog() {
	$("#myModalLabel").html("新增菜单");
	$('#MenuDialog').modal("show");
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/system/menu/add"});
}

function cancel() {
	$('#MenuDialog').modal("hide");
	resetValue();
}

function _editMenuDialog() {
	var i = 0;
	var id;
	$(".selCheckbox:checked").each(function() {
		i++;
		id = $(this).val();
	})
		
    if (i != 1) {
    	bootbox.alert({
    		size:"small",
    		message:"请选择一行记录"
    	});
    	return;
    }
	
    $("#myModalLabel").html("修改菜单信息");
    
	var row =  $('#menuTable').bootstrapTable("getRowByUniqueId",id);
    $("#name").val(row.name);
	$("#url").val(row.url);
	$("#authorization option").map(function () {
		if ($(this).val() == row.authorization) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#orderFlag").val(row.orderFlag);
	$("#parentId option").map(function () {
		if ($(this).val() == row.parentId) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#icon").val(row.icon);
	$("#id").val(row.id);
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/system/menu/modify"});
	$('#MenuDialog').modal("show");
}
    
function _deleteMenu() {
	var strIds = new Array();
	$(".selCheckbox:checked").each(function() {
		strIds.push($(this).val());
	})
	
    if (strIds.length == 0) {
    	bootbox.alert({
    		size:"small",
    		message:"请选择要删除的记录"
    	});
    	return;
    }  
	 var ids=strIds.join(",");
	 
	 bootbox.confirm({
		 size: "small",
		 message: "确认要删除这<font color=red>" + strIds.length + "</font>条菜单记录吗？",
		 callback: function(result) {
			 if (result) {
				 $.post("${pageContext.request.contextPath}/mgr/system/menu/delete",{ids:ids},function(data){
						if(data.status == 1){
							bootbox.alert({
					    		size:"small",
					    		message:data.message,
					    		callback:function() {
					    			location.reload();
					    		}
					    	});
						} else{
							bootbox.alert({
					    		size: "small",
					    		message: data.message
					    	});
						}
					},"json");
			 }
		 }
	 })
	 
}
    
function editMenuDialog(id) {
    var row =  $('#menuTable').bootstrapTable("getRowByUniqueId",id);
    $("#myModalLabel").html("修改菜单信息");
    $("#name").val(row.name);
	$("#url").val(row.url);
	$("#authorization option").map(function () {
		if ($(this).val() == row.authorization) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#orderFlag").val(row.orderFlag);
	$("#parentId option").map(function () {
		if ($(this).val() == row.parentId) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#icon").val(row.icon);
	$("#id").val(row.id);
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/system/menu/modify"});
	$('#MenuDialog').modal("show");
}
    
function deleteMenu(id) {
	bootbox.confirm({
		 size: "small",
		 message: "确认要删除这条菜单记录吗？",
		 callback: function(result) {
			 if (result) {
				 $.post("${pageContext.request.contextPath}/mgr/system/menu/delete",{ids:id},function(data){
						if(data.status == 1){
							bootbox.alert({
					    		size:"small",
					    		message:data.message,
					    		callback:function() {
					    			location.reload();
					    		}
					    	});
						} else{
							bootbox.alert({
					    		size: "small",
					    		message: data.message
					    	});
						}
					},"json");
			 }
		 }
	 })
}


    	
</script>