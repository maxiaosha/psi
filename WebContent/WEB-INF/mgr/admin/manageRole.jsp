<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-wrapper">
	<section class="content">
	<div class="row">
                <div class="col-lg-12">
                      <div class="panel panel-primary" style="border-color:#3c8dbc;">
			<div class="panel-heading" style="background-color: #3c8dbc;border-color:#3c8dbc;">${requestScope.title}</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<a class="btn btn-success" onclick="addRoleDialog()"><i class="fa fa-plus"></i> 新增</a>
                            <a class="btn btn-info" onclick="_editRoleDialog()"><i class="fa fa-edit"></i> 修改</a>
                            <a class="btn btn-danger" onclick="_deleteRole()"><i class="fa fa-remove"></i> 删除</a>
                            <div class="dataTable_wrapper" style="margin-top:10px;">
                            	
                                <table id="table" class="table table-bordered table-striped table-hover">
                                   
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
<div class="modal fade" id="RoleDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <a class="close" onclick="cancel()" aria-label="Close"><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
        <div class="well" style='margin-top:25px;'>
        <form id="Role" class="form-horizontal">
            <div class="form-group">
                <label for="name" class="col-sm-3 control-label">角色名</label>
                <div class="col-sm-6">
                     <input type="text" class="form-control" id="name" name="name" placeholder="角色名" >          
                </div>
            </div>
            <div class="form-group">
                <label for="permission" class="col-sm-3 control-label">权限</label>
                <div class="col-sm-6">
                     <input type="text" class="form-control" id="permission" name="permission" placeholder="权限" maxlength="1">          
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
function UrlSearch() 
{
   var name,value; 
   var str=location.href; //取得整个地址栏
   var num=str.indexOf("?") 
   str=str.substr(num+1); //取得所有参数   stringvar.substr(start [, length ]

   var arr=str.split("&"); //各个参数放到数组里
   for(var i=0;i < arr.length;i++){ 
    num=arr[i].indexOf("="); 
    if(num>0){ 
     name=arr[i].substring(0,num);
     value=arr[i].substr(num+1);
     this[name]=value;
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
	$('#table').bootstrapTable({
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
 	                      align: 'center',
 	                      valign: 'middle'	                     
 	                  }, 
 	                  {
 	                      title: '权限',
 	                      field: 'permission',
 	                      align: 'center',
 	                      valign: 'middle',
 	                     
 	                  }, 
 	                  {
 	                	  title: '操作',
 	                	  field: '',
 	                	  align: 'center',
	                      valign: 'middle',
	                      formatter:function(value,row,index){  
	                          var e = '<a class="btn btn-info btn-xs" onclick="editRoleDialog(\''+ row.id + '\')"><i class="fa fa-edit"></i></a> ';  
	                          var d = '<a class="btn btn-danger btn-xs" onclick="deleteRole(\''+ row.id +'\')"><i class="fa fa-remove"></i></a> ';  
	                          return e+d;  
	                      } 
 	                  }
 	              ],
 	             onPageChange:function(number, size) {
 	            	window.history.pushState(null, null, "manageRole?page=" + number + "&pageSize=" + size); 	
 	             },
 	    		onLoadSuccess:function() {
 	        		$('#allCheckbox').iCheck({
 	   	         checkboxClass: 'icheckbox_minimal-blue',
 	   	 		});
 	        		$('.selCheckbox').iCheck({
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
			data: $("#Role").serialize(),
			dataType: "json",
			success: function(data) {
				if (data.status == 1) {
					$('#RoleDialog').modal("hide");
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

function validate() {
    if ($.trim($("#name").val()) == "") {
        $("#message").html("请选择角色名");  // 赋值
        $("#name").focus();           // 输入框获得焦点
        return false;
        }
        if ($.trim($("#permission").val()) == "") {
        $("#message").html("");
        $("#message").html("请输入权限");
        $("#permission").focus();
        return false;
        }
        return true;
}

function resetValue() {
	  $("#name").val("");
	  $("#permission").val("");
	  $("#message").html("");
}

function addRoleDialog() {
	$("#myModalLabel").html("新增角色");
	$('#RoleDialog').modal("show");
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/user/role/add"});
}

function cancel() {
	$('#RoleDialog').modal("hide");
	resetValue();
}

function _editRoleDialog() {
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
    $("#myModalLabel").html("修改角色信息");
    
    var rows =  $('#table').bootstrapTable("getRowByUniqueId",id);
 
    $("#name").val(rows.name);
	$("#permission").val(rows.permission);
	$("#id").val(rows.id);
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/user/role/modify"});
	$('#RoleDialog').modal("show");
}
    
function _deleteRole() {
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
		 message: "确认要删除这<font color=red>" + strIds.length + "</font>条角色记录吗？",
		 callback: function(result) {
			 if (result) {
				 $.post("${pageContext.request.contextPath}/mgr/user/role/delete",{ids:ids},function(data){
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
    
function editRoleDialog(id) {
    var row =  $('#table').bootstrapTable("getRowByUniqueId",id);
    $("#myModalLabel").html("修改角色信息");
    $("#name").val(row.name);
	$("#permission").val(row.permission);
	$("#id").val(row.id);
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/user/role/modify"});
	$('#RoleDialog').modal("show");
}
    
function deleteRole(id) {
	bootbox.confirm({
		 size: "small",
		 message: "确认要删除这条角色记录吗？",
		 callback: function(result) {
			 if (result) {
				 $.post("${pageContext.request.contextPath}/mgr/user/role/delete",{ids:id},function(data){
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