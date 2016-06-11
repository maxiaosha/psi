<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-wrapper">
	<section class="content">
	<div class="row">
                <div class="col-lg-12">
                      <div class="panel panel-primary" ">
			<div class="panel-heading" ">${requestScope.title }</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<a class="btn btn-danger" onclick="resetPassword()"><i class="fa fa-remove"></i> 重置密码</a>
                        	<a class="btn btn-success" onclick="addUserDialog()"><i class="fa fa-plus"></i> 新增</a>
                        	<a class="btn btn-warning" onclick="searchUserToggle()"><i class="fa fa-search"></i> 查询</a>
                            <a class="btn btn-info" onclick="_editUserDialog()"><i class="fa fa-edit"></i> 修改</a>
                            <a class="btn btn-danger" onclick="_deleteUser()"><i class="fa fa-remove"></i> 删除</a>
                           
                            
                            <div id="searchUser" style="margin-top:15px;">
                            <form class="form-horizontal" id="searchUserForm">
                            <div class="row">
                            	<div class="col-sm-3">
                            	<div class="form-group">
    								<label for="searchAccount" class="col-sm-4 control-label" style="text-align:left;">账号</label>
    								<div class="col-sm-8">
    									<input type="text" class="form-control" id="searchAccount" name="searchAccount" placeholder="账号">
    								</div>    				
  								</div>
  								</div>          	
                            	<div class="col-sm-3">
                            	<div class="form-group">
    								<label for="searchUserName" class="col-sm-4 control-label" style="text-align:left;">用户姓名</label>
    								<div class="col-sm-8">
    									<input type="text" class="form-control" id="searchUserName" name="searchUserName" placeholder="用户名">
    								</div>    				
  								</div>
  								</div>
  								<div class="col-sm-3">
  								<div class="form-group">
    								<label for="searchUserSex" class="col-sm-4 control-label" style="text-align:left;">用户性别</label>
    								<div class="col-sm-8">
      									<select class="form-control" id="searchUserSex" name="searchUserSex" >
      									
      									<option value="">请选择</option>
      									<option value="男">男</option>
										<option value="女">女</option>
      								</select>
    								</div>
  								</div>
  								</div>
  								<div class="col-sm-3">
  								<div class="form-group">
    								<label for="searchRoleId" class="col-sm-4 control-label" style="text-align:left;">用户角色</label>
    								<div class="col-sm-8">
      									<select class="form-control" id="searchRoleId" name="searchRoleId">
											<option value="">请选择</option>
										<c:forEach var="role" items="${requestScope.roleList }">
											<option value="${role.id }">${role.name }</option>
										</c:forEach>
										</select>
    								</div>
  								</div>
  								</div>
  								</div>
  								<div class="row">
  									<div class="col-sm-3">
  										<a class="btn btn-primary" onclick="searchUserFormSubmit()">确认</a>
  										<a class="btn btn-default" onclick="searchUserToggle()">取消</a>
  									</div>
  								</div>
  								</form>
                            </div>
                            
                            
                            <div class="dataTable_wrapper" style="margin-top:10px;">
                            	
                                <table id="userTable" class="table table-bordered table-striped table-hover">
                                   
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


<div class="modal fade" id="UserDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" style="width:1020px;">
    <div class="modal-content">
      <div class="modal-header">
        <a class="close" onclick="cancel()" aria-label="Close"><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
      	<div class="well" style='margin-top:25px;'>
        <form id="User" class="form-horizontal">

        	<div class="row">
        	<div class="col-sm-6">
 
  				<div class="form-group">
  				 
    			<label for="account" class="col-sm-3 control-label">账户</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="account" name="account" placeholder="账户">
      				
    			</div>
    			<div class="need col-sm-1">
					*
    			</div>
    			
  				</div>
  				<div class="form-group">
    			<label for="roleId" class="col-sm-3 control-label">角色</label>
    			<div class="col-sm-6">
    				<select class="form-control" id="roleId" name="role.id">
						<option value="">请选择</option>
							<c:forEach var="role" items="${requestScope.roleList }">
						<option value="${role.id }">${role.name }</option>
							</c:forEach>
					</select>  
    			</div>
    			<div class="need col-sm-1">
					*
    			</div>
  				</div>
  				<div class="form-group">
    			<label for="name" class="col-sm-3 control-label">用户姓名</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="name" name="name" placeholder="用户名">
    			</div>
    			<div class="need col-sm-1">
					*
    			</div>
  				</div>
  				<div class="form-group">
    			<label for="idCard" class="col-sm-3 control-label">身份证</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="idCard" name="idCard" placeholder="身份证编号">
    			</div>
    			<div class="need col-sm-1">
					*
    			</div>
  				</div>
  				
  				<div class="form-group">
    			<label for="sex" class="col-sm-3 control-label">性别</label>
    			<div class="col-sm-6">
      		<select class="form-control" id="sex" name="sex" >		
      			<option value="">请选择</option>
      			 <option value="男">男</option>
					<option value="女">女</option>
      				</select>
    			</div>
    			<div class="need col-sm-1">
					*
    			</div>
  				</div>
        	</div>
        	
        	<div class="col-sm-6">

  				<div class="form-group">
    			<label for="age" class="col-sm-3 control-label">年龄</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="age" name="age" placeholder="年龄">
    			</div>
    			    <div class="need col-sm-1">
					*
    			</div>
  				</div>
  			
  				<div class="form-group">
    			<label for="phone" class="col-sm-3 control-label">手机</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="phone" name="phone" placeholder="手机">
    			</div>
  				</div>
  				<div class="form-group">
    			<label for="email" class="col-sm-3 control-label">邮箱</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="email" name="email" placeholder="邮箱">
    			</div>
    			</div>
    			<div class="form-group">
    			<label for="address" class="col-sm-3 control-label">地址</label>
    			<div class="col-sm-6">
    				<input type="text" class="form-control" id="address" name="address" placeholder="地址">
    			</div>
  				</div>
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
	$("#searchUser").hide();			// 隐藏查询DIV
	 
	var request = new UrlSearch(); //实例化
	var page = 1;
	var pageSize = 10;
	if (request.page != null) {
		page = parseInt(request.page);
	}
	if (request.pageSize != null) {
		pageSize = parseInt(request.pageSize);
	}
	$('#userTable').bootstrapTable({
 	 	url: "list", 
 	    dataType: "json",
 	    pagination: true, //分页
 	    singleSelect: false,
 	    uniqueId: "id",
 	    queryParams: queryParams,
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
 	                    	title: '序号',
 	                    	align: 'center',
 	                    	width: '1%',
 	                    	valign: 'middle',
 	                    	formatter:function(value,row,index){
 	                    		return index+1;
 	                    	}
 	                    },
 	                   {
 	 	                      title: '账号',
 	 	                      field: 'account',
 	 	                      width: '17%',
 	 	                      align: 'center',
 	 	                      valign: 'middle',
 	 	                     
 	 	                 }, 
/*  	                  {
 	                      title: '密码',
 	                      field: 'password',
 	                      align: 'center',
 	                      valign: 'middle'	                     
 	                  },  */
 	                  
 	                  {
 	                      title: '用户姓名',
 	                      field: 'name',
 	                      width: '11%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },

 	                  {
 	                      title: '身份证',
 	                      field: 'idCard',
 	                      width: '20%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  
 	                  {
 	                      title: '性别',
 	                      field: 'sex',
 	                      width: '7%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  
 	                  {
 	                	  title: '年龄',
 	                	  field: 'age',
 	                	  width: '7%',
 	                	  align: 'center',
 	                	  valign: 'middle'
 	                  },
 	                  
/*  	                  {
 	                	  title: '手机',
 	                	  field: 'phone',
 	                	  align: 'center',
 	                	  valign: 'middle'
 	                  },
 	                  
 	                  {
 	                	  title: '邮箱',
 	                	  field: 'email',
 	                	  align: 'center',
 	                	  valign: 'middle'
 	                  },
 	                  
 	                  {
 	                	  title: '地址',
 	                	  field: 'address',
 	                	  align: 'center',
 	                	  valign: 'middle'
 	                  }, */
 	                  
 	                  {
 	                      title: '角色名',
 	                      field: 'role.name',
 	                      width: '10%',
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
	                    	  var v = '<a class="btn btn-warning btn-xs" onclick="viewUserDialog(\''+ row.id + '\')"><i class="fa fa-eye"></i></a> '; 
	                          var e = '<a class="btn btn-info btn-xs" onclick="editUserDialog(\''+ row.id + '\')"><i class="fa fa-edit"></i></a> ';  
	                          var d = '<a class="btn btn-danger btn-xs" onclick="deleteUser(\''+ row.id +'\')"><i class="fa fa-remove"></i></a> ';  
	                          return v + e + d;  
	                      } 
 	                  }
 	              ],
 	             onPageChange:function(number, size) {
 	            	window.history.pushState(null, null, "manageUser?page=" + number + "&pageSize=" + size); 	
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
			data: $("#User").serialize(),
			dataType: "json",
			success: function(data) {
				if (data.status == 1) {
					$('#UserDialog').modal("hide");
					resetValue();				
					bootbox.alert({
						size:"small",
						message:data.message,
						callback:function() {
							$('#userTable').bootstrapTable("refresh");
							resetValue();
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


function searchUserToggle() {
	$("#searchUser").toggle(500);
}

function searchUserFormSubmit() {
	$('#userTable').bootstrapTable("refresh");
}

function queryParams(params) {  //配置参数
    var return_params = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
      limit: params.limit,   //页面大小
      offset: params.offset,  //bootstrap分页偏移量
      searchAccount:$("#searchAccount").val(),
      searchUserName:$("#searchUserName").val(),	//查询传商品名到服务器
      searchUserSex:$("#searchUserSex").val(),
      searchRoleId:$("#searchRoleId").val(),
    };
    return return_params;
}

function validate() {
	if ($.trim($("#account").val()) == "") {
		$("#message").html("请输入账号");
		$("#account").focus();
		return false;
	}
	//role.id
	if ($.trim($("#roleId").val()) == "") {
		$("#message").html("请选择角色");
		$("#roleId").focus();
		return false;
	}
	
	if ($.trim($("#name").val()) == "") {
		$("#message").html("请输入姓名");
		$("#name").focus();
		return false;
	}
	if ($.trim($("#idCard").val()) == "") {
		$("#message").html("请输入身份证编号");
		$("#idCard").focus();
		return false;
	}
	if ($.trim($("#sex").val()) == "") {
		$("#message").html("请输入性别");
		$("#sex").focus();
		return false;
	}
	if ($.trim($("#age").val()) == "") {
		$("#message").html("请输入年龄");
		$("#age").focus();
		return false;
	}
	//验证邮箱地址
	   
	if ($.trim($("#email").val()) != "") {
	if(!$("#email").val().match( /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)){ 
		$("#message").html("邮箱地址格式不正确！请重新输入！"); 
		$("#email").focus(); 
		return false; 
		} 
	}
			
			
	 //验证电话号码
		  
	if ($.trim($("#phone").val()) != "") {
	if(!$("#phone").val().match( /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/)){ 
	   $("#message").html("手机号码格式不正确！请重新输入！"); 
	   $("#phone").focus(); 
	   return false; 
		} 
	}
	return true;
}

function resetValue() {
	$("#allCheckbox").iCheck('uncheck');
	$("#account").val("");
	$("#roleId").prop('selectedIndex', 0);
	$("#name").val("");
	$("#idCard").val("");
	$("#sex").val("");
	$("#age").val("");
	$("#phone").val("");
	$("#email").val("");
	$("#address").val("");
	$("#message").html("");
	$("#submit").show(500);
}

function addUserDialog() {
	$("#myModalLabel").html("新增用户");
	$('#UserDialog').modal("show");
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/user/add"});
}

function cancel() {
	$('#UserDialog').modal("hide");
	resetValue();
}



function _editUserDialog() {
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
	
	$("#myModalLabel").html("修改用户信息");
    
    var row =  $('#userTable').bootstrapTable("getRowByUniqueId",id);
    $("#account").val(row.account);
	$("#roleId option").map(function () {
		if ($(this).val() == row.role.id) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#name").val(row.name);
	$("#idCard").val(row.idCard);
	$("#age").val(row.age);
	$("#sex").val(row.sex);
	$("#phone").val(row.phone);
	$("#email").val(row.email);
	$("#address").val(row.address);
	
	/*  */
	
	$("#id").val(id);
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/user/modify"});
	$('#UserDialog').modal("show");
}
    
function _deleteUser() {
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
		 message: "确认要删除这<font color=red>" + strIds.length + "</font>条商品记录吗？",
		 callback: function(result) {
			 if (result) {
				 $.post("${pageContext.request.contextPath}/mgr/user/delete",{ids:ids},function(data){
						if(data.status == 1){
							bootbox.alert({
					    		size:"small",
					    		message:data.message,
					    		callback:function() {
					    			$('#userTable').bootstrapTable("refresh");
					    			resetValue();
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

//查看用户详细信息
function viewUserDialog(id) {
    var row =  $('#userTable').bootstrapTable("getRowByUniqueId",id);
    $("#myModalLabel").html("用户详细信息");
    $("#submit").hide();
    $("#account").val(row.account);
	$("#roleId option").map(function () {
		if ($(this).val() == row.role.id) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#name").val(row.name);
	$("#idCard").val(row.idCard);
	$("#age").val(row.age);
	$("#sex").val(row.sex);
	$("#phone").val(row.phone);
	$("#email").val(row.email);
	$("#address").val(row.address);
	$('#UserDialog').modal("show");
}


function editUserDialog(id) {
    var row =  $('#userTable').bootstrapTable("getRowByUniqueId",id);
    $("#myModalLabel").html("修改用户信息");
    $("#account").val(row.account);
	$("#roleId option").map(function () {
		if ($(this).val() == row.role.id) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#name").val(row.name);
	$("#idCard").val(row.idCard);
	$("#age").val(row.age);
	$("#sex").val(row.sex);
	$("#phone").val(row.phone);
	$("#email").val(row.email);
	$("#address").val(row.address);
	$("#id").val(id);
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/user/modify"});
	$('#UserDialog').modal("show");
}
    
function deleteUser(id) {
	bootbox.confirm({
		 size: "small",
		 message: "确认要删除这条用户记录吗？",
		 callback: function(result) {
			 if (result) {
				 $.post("${pageContext.request.contextPath}/mgr/user/delete",{ids:id},function(data){
						if(data.status == 1){
							bootbox.alert({
					    		size:"small",
					    		message:data.message,
					    		callback:function() {
					    			$('#userTable').bootstrapTable("refresh");
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

//以下为重置密码函数

//单击重置密码按钮
function resetPassword() {
	var strIds = new Array();
	$(".selCheckbox:checked").each(function() {
		strIds.push($(this).val());
	})
	
    if (strIds.length == 0) {
    	bootbox.alert({
    		size:"small",
    		message:"请选择要重置的密码"
    	});
    	return;
    }  
	
	 var ids=strIds.join(",");
	 bootbox.confirm({
		 size: "small",
		 message: "确认要重置这<font color=red>" + strIds.length + "</font>条记录的密码吗？",
		 callback: function(result) {
			 if (result) {
				 $.post("${pageContext.request.contextPath}/mgr/user/resetPassword",{ids:ids},function(data){
						if(data.status == 1){
							bootbox.alert({
					    		size:"small",
					    		message:data.message,
					    		callback:function() {
					    			$('#userTable').bootstrapTable("refresh");
					    			resetValue();
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