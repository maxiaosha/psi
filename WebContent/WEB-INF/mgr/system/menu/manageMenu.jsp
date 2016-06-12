<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="content-wrapper">
	<section class="content">
	<div class="row">
                <div class="col-lg-12">
                      <div class="panel">
			<div class="panel-heading">${requestScope.title }</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<a class="btn btn-success" onclick="addMenuDialog()"><i class="fa fa-plus"></i> 新增</a>
                            <a class="btn btn-info" onclick="_editMenuDialog()"><i class="fa fa-edit"></i> 修改</a>
                            <a class="btn btn-danger" onclick="_deleteMenu()"><i class="fa fa-remove"></i> 删除</a>
                            <div class="dataTable_wrapper" style="margin-top:10px;">
                            	
                                <table id="menuTable1" class="table table-bordered table-striped table-hover">
                                    <thead>
                                   <tr>
                                   <th class="t_center" style="width:1%;">
                                   		<div class="th-inner"><input type="checkbox" id="allCheckbox" /></div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                    <th class="t_center" style="width:3%;">
                                   		<div class="th-inner">序号</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:5%;">
                                   		<div class="th-inner">等级</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">名称</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                               
                                   	<th class="t_center" style="width:6%;">
                                   		<div class="th-inner">URL</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">父级菜单</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	
                                   	<th class="t_center" style="width:6%;">
                                   		<div class="th-inner">权限</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:3%;">
                                   		<div class="th-inner">排序</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">图标</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:5%;">
                                   		<div class="th-inner">操作</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	</tr>
                                   </thead>
                                   <tbody>
                                   <c:forEach var="menu1" items="${requestScope.list }" varStatus="status1">
                                   <c:set var="size1" value="${fn:length(menu1.childList) }" />                                 
                                   	<tr id="${menu1.id }">
                                   		<td class="t_center">
                                   			<input type="checkbox" class="selCheckbox" value="${menu1.id }" />
                                   		</td>
                                   		<td class="t_center">
                                   			
                                   			<c:if test="${size1 > 0 }">
                                   				<a class="btn btn-default btn-xs" onclick="menuToggle('${menu1.id}')"><i id="i${menu1.id}" class="fa fa-minus"></i></a>
                                   			</c:if>
                                   		</td>
                                   		<td class="t_center">一级菜单</td>
                                   		<td class="t_center">${menu1.name }</td>
                                   		<td class="t_center">${menu1.url }</td>
                                   		<td class="t_center"></td>
                                   		
                                   		<td class="t_center">
                                   			<c:if test="${menu1.role.permission == '1' }">超级管理员</c:if>
                                   			<c:if test="${menu1.role.permission == '2' }">普通管理员</c:if>
                                   			<c:if test="${menu1.role.permission == '3' }">普通员工</c:if>
                                   		</td>
                                   		<td class="t_center">${menu1.orderFlag }</td>
                                   		<td class="t_center">${menu1.icon }</td>
                                   		<td class="t_center">
                                   			<a class="btn btn-info btn-xs" onclick="editMenuDialog('${menu1.id}')"><i class="fa fa-edit"></i></a>
                                   			<a class="btn btn-danger btn-xs" onclick="deleteMenu('${menu1.id}')"><i class="fa fa-remove"></i></a>
                                   		</td>
                                   	</tr>
                                   	
                                   	<c:if test="${size1 > 0 }">
                                   		<c:forEach var="menu2" items="${menu1.childList }" varStatus="status2">
                                   			<c:set var="size2" value="${fn:length(menu2.childList) }" />
                                   		
                                   			<tr id="${menu2.id }" class="${menu1.id }">
                                   				<td class="t_center">
                                   					<input type="checkbox" class="selCheckbox ${menu1.id }" value="${menu2.id }" />
                                   				</td>
                                   				<td class="t_center">
                                   					${status2.count}
                                   					<c:if test="${size2 > 0 }">
                                   						<a class="btn btn-default btn-xs" onclick="menuToggle('${menu2.id}')"><i id="i${menu2.id}" class="fa fa-minus"></i></a>
                                   					</c:if>
                                   				</td>
                                   				<td class="t_center">二级菜单</td>
                                   				<td class="t_center">${menu2.name }</td>
                                   				<td class="t_center">${menu2.url }</td>
                                   				<td class="t_center">${menu2.parentMenu.name }</td>
                                   				<td class="t_center">
                                   					<c:if test="${menu2.role.permission == '1' }">超级管理员</c:if>
                                   					<c:if test="${menu2.role.permission == '2' }">普通管理员</c:if>
                                   					<c:if test="${menu2.role.permission == '3' }">普通员工</c:if>
                                   				</td>
                                   				<td class="t_center">${menu2.orderFlag }</td>
                                   				<td class="t_center">${menu2.icon }</td>
                                   				<td class="t_center">
                                   					<a class="btn btn-info btn-xs" onclick="editMenuDialog('${menu2.id}')"><i class="fa fa-edit"></i></a>
                                   					<a class="btn btn-danger btn-xs" onclick="deleteMenu('${menu2.id}')"><i class="fa fa-remove"></i></a>
                                   				</td>
                                   			</tr>
                                   		
                                   			<c:if test="${size2 >0 }">
                                   				<c:forEach var="menu3" items="${menu2.childList }" varStatus="status3">
                                   					<tr id="${menu3.id }" class="${menu2.id }">
                                   						<td class="t_center">
                                   							<input type="checkbox" class="selCheckbox ${menu2.id }" value="${menu3.id }" />
                                   						</td>
                                   						<td class="t_center">${status3.count}</td>
                                   						<td class="t_center">三级菜单</td>
                                   						<td class="t_center">${menu3.name }</td>
                                   						<td class="t_center">${menu3.url }</td>
                                   						<td class="t_center">${menu3.parentMenu.name }</td>
                                   						<td class="t_center">
                                   							<c:if test="${menu3.role.permission == '1' }">超级管理员</c:if>
                                   							<c:if test="${menu3.role.permission == '2' }">普通管理员</c:if>
                                   							<c:if test="${menu3.role.permission == '3' }">普通员工</c:if>
                                   						</td>
                                   						<td class="t_center">${menu3.orderFlag }</td>
                                   						<td class="t_center">${menu3.icon }</td>
                                   						<td class="t_center">
                                   							<a class="btn btn-info btn-xs" onclick="editMenuDialog('${menu3.id}')"><i class="fa fa-edit"></i></a>
                                   							<a class="btn btn-danger btn-xs" onclick="deleteMenu('${menu3.id}')"><i class="fa fa-remove"></i></a>
                                   						</td>
                                   					</tr>
                                   				</c:forEach>
                                   			</c:if>
                                   		</c:forEach>
                                   	</c:if>
                                   </c:forEach>
                                   
                                   
                                   </tbody>
                                </table>
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
    				<select class="form-control" id="parentId" name="parentMenu.id">
						<option value="">无</option>
						<c:forEach var="menu" items="${requestScope.menuList }">
							<option value="${menu.id }">${menu.name }</option>
						</c:forEach>
					</select>   				
    			</div>    			
  			</div>
  			
  			 			
  			<div class="form-group">
    			<label for="role" class="col-sm-3 control-label">权限</label>
    			<div class="col-sm-6">
    				<select class="form-control" id="role" name="role.id">
    				<c:forEach var="role" items="${requestScope.roleList }">
    					<option value="${role.id }">${role.name }</option>
    				</c:forEach>
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
function menuToggle(menuId) {
	$("." + menuId).toggle();
	if ($("#i" + menuId).hasClass("fa-plus")) {
		$("#i" + menuId).removeClass("fa-plus");
		$("#i" + menuId).addClass("fa-minus");
	} else {
		$("#i" + menuId).removeClass("fa-minus");
		$("#i" + menuId).addClass("fa-plus");
	}	
}

$(document).ready(function() {
	$('#allCheckbox').iCheck({
	    checkboxClass: 'icheckbox_minimal-blue',
	});
    $('.selCheckbox').iCheck({
    	checkboxClass: 'icheckbox_minimal-blue',
    });
    
	bootbox.setDefaults({locale:"zh_CN"});
	
	
    
    $("#allCheckbox").on('ifChecked', function(event){  
		$(".selCheckbox").iCheck('check');
	}).on('ifUnchecked', function(event){
		$(".selCheckbox").iCheck('uncheck');
	});
    
    $(".selCheckbox").on('ifChecked', function(event){
		if (!$("." + $(this).val()).parent().parent().is(":hidden")){
			$("." + $(this).val()).iCheck('check');
		}   		
	}).on('ifUnchecked', function(event){
		$("." + $(this).val()).iCheck('uncheck');
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
	$("#role").prop('selectedIndex', 0);
	$("#orderFlag").val("");
	$("#icon").val("");
	$("#message").html("");
}

function addMenuDialog() {
	$("#myModalLabel").html("新增菜单");
	$('#MenuDialog').modal("show");
	$("#submit").attr({"action":"add"});
}

function cancel() {
	$('#MenuDialog').modal("hide");
	resetValue();
}

function getRow(id) {
	this["id"] = id;
	this["name"] = $("#" + id).find("td:eq(3)").text().trim();
	this["url"] = $("#" + id).find("td:eq(4)").text().trim();
	this["parentName"] = $("#" + id).find("td:eq(5)").text().trim();
	this["role"] = $("#" + id).find("td:eq(6)").text().trim();
	this["orderFlag"] = $("#" + id).find("td:eq(7)").text().trim();
	this["icon"] = $("#" + id).find("td:eq(8)").text().trim();
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
        
	var row = new getRow(id);
    $("#name").val(row.name);
	$("#url").val(row.url);
	
	$("#parentId option").map(function () {
		
		if ($(this).text() == row.parentName) {
			$(this).attr({"selected" : "selected"});
		}
	})
	
	$("#role option").map(function () {
		if ($(this).text() == row.role) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#orderFlag").val(row.orderFlag);
	$("#icon").val(row.icon);
	$("#id").val(row.id); 
	$("#submit").attr({"action":"modify"});
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
				 $.post("delete",{ids:ids},function(data){
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
    var row =  new getRow(id);
    $("#myModalLabel").html("修改菜单信息");
    $("#name").val(row.name);
   
	$("#url").val(row.url);
	$("#role option").map(function () {
		if ($(this).text() == row.role) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#orderFlag").val(row.orderFlag);
	$("#parentId option").map(function () {
		
		if ($(this).text() == row.parentName) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#icon").val(row.icon);
	$("#id").val(row.id);
	$("#submit").attr({"action":"modify"});
	$('#MenuDialog').modal("show");
}
    
function deleteMenu(id) {
	bootbox.confirm({
		 size: "small",
		 message: "确认要删除这条菜单记录吗？",
		 callback: function(result) {
			 if (result) {
				 $.post("delete",{ids:id},function(data){
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