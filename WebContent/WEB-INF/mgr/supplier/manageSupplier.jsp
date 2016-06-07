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
                        <a class="btn btn-success" onclick="addSupplierDialog()"><i class="fa fa-plus"></i> 新增</a>
                        <a class="btn btn-info" onclick="_editSupplierDialog()"><i class="fa fa-edit"></i> 修改</a>
                        <a class="btn btn-danger" onclick="_deleteSupplier()"><i class="fa fa-remove"></i> 删除</a>
                        <div class="dataTable_wrapper" style="margin-top:10px;">
                         <table id="table" class="table table-bordered table-striped table-hover">
                                   
                                </table>
                        
                
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

<div class="modal fade" id="SupplierDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <a class="close" onclick="cancel()" aria-label="Close"><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
        <div class="well" style='margin-top:25px;'>
        <form id="Supplier" class="form-horizontal">
            <div class="form-group">
                <label for="name" class="col-sm-3 control-label">供应商名</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="name" name="name" placeholder="名称">
                </div>
            </div>
            <div class="form-group">
                <label for="linkman" class="col-sm-3 control-label">联系人</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="linkman" name="linkman" placeholder="联系人">
                </div>
            </div>
            <div class="form-group">
                <label for="mail" class="col-sm-3 control-label">邮箱</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="mail" name="mail" placeholder="邮箱">
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-3 control-label">电话</label>
                <div class="col-sm-6">
                     <input type="text" class="form-control" id="phone" name="phone" placeholder="电话">          
                </div>
            </div>
            <div class="form-group">
            	<label for="address" class="col-sm-3 control-label">地址</label>
                <div class="col-sm-6">
                     <input type="text" class="form-control" id="address" name="address" placeholder="地址">          
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
 			      		  title: '供应商名',
 	                      field: 'name',
 	                      align: 'center',
 	                      valign: 'middle'	                     
 	                  }, 
 	                  {
 	                      title: '联系人',
 	                      field: 'linkman',
 	                      align: 'center',
 	                      valign: 'middle',
 	                     
 	                  }, 
 	                  {
 	                      title: '邮箱',
 	                      field: 'mail',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                      title: '电话',
 	                      field: 'phone',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                	  title: '地址',
 	                	  field: 'address',
 	                	  align: 'center',
 	                	  valign:'middle'
 	                	  
 	                  },
 	                  {
 	                	  title: '操作',
 	                	  field: '',
 	                	  align: 'center',
				  		  valign: 'middle',
	                      formatter:function(value,row,index){  
	                          var e = '<a class="btn btn-info btn-xs" onclick="editSupplierDialog(\''+ row.id + '\')"><i class="fa fa-edit"></i></a> ';  
	                          var d = '<a class="btn btn-danger btn-xs" onclick="deleteSupplier(\''+ row.id +'\')"><i class="fa fa-remove"></i></a> ';  
	                          return e+d;  
	                      } 
 	                  }
 	              ],
 	             onPageChange:function(number, size) {
 	            	window.history.pushState(null, null, "manageSupplier?page=" + number + "&pageSize=" + size); 	
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
			data: $("#Supplier").serialize(),
			dataType: "json",
			success: function(data) {
				if (data.status == 1) {
					$('#SupplierDialog').modal("hide");
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
		$("#message").html("请输入供应商名称");  // 赋值
		$("#name").focus();           // 输入框获得焦点
		return false;
		}
	if ($.trim($("#linkman").val()) == "") {
		$("#message").html("请输入联系人");
		$("#linkman").focus();
		return false;
		}
	if ($.trim($("#mail").val()) == "") {
		$("#message").html("请输入供应商邮箱");  // 赋值
		$("#mail").focus();           // 输入框获得焦点
		return false;
		}
	
	//验证邮箱地址
		   
	if($("#mail").val()==""){ 
		$("#message").html("邮箱地址不能为空");
		$("#mail").focus(); 
		 return false; 
	    } 
	if(!$("#mail").val().match( /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)){ 
		$("#message").html("邮箱地址格式不正确！请重新输入！"); 
		$("#mail").focus(); 
		return false; 
		} 
			
			
	 //验证电话号码
		  
	if($("#phone").val()==""){ 
	   $("#message").html("电话号码不能为空");
	   $("#phone").focus(); 
	   return false; 
		} 
	if(!$("#phone").val().match( /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/)){ 
	   $("#message").html("手机号码格式不正确！请重新输入！"); 
	   $("#phone").focus(); 
	   return false; 
		} 
		    
		//验证地址
		    
	 if($("#address").val()==""){
		$("#message").html("地址不能为空");
	    $("#address").focus(); 
	    return false; 
		}
		return true;
}

function resetValue() {
	$("#name").val("");
	$("#linkman").val("");
	$("#mail").val("");
	$("#phone").val("");
	$("#address").val("");
	$("#message").html("");
}

function addSupplierDialog()  {
	$("#myModalLabel").html("新增供应商");
	$('#SupplierDialog').modal("show");
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/supplier/add"});
}

function cancel()  {
	$('#SupplierDialog').modal("hide");
	resetValue();
}

function _editSupplierDialog() {
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
	
    $("#myModalLabel").html("修改供应商信息");
    
    var rows =  $('#table').bootstrapTable("getRowByUniqueId",id);
    
    $("#name").val(rows.name);
	$("#linkman").val(rows.linkman);
	$("#mail").val(rows.mail);
	$("#phone").val(rows.phone);
	$("#address").val(rows.address);
	$("#id").val(rows.id);
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/supplier/modify"});
	$('#SupplierDialog').modal("show");
}
    
function _deleteSupplier(){
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
				 $.post("${pageContext.request.contextPath}/mgr/supplier/delete",{ids:ids},function(data){
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
    
function editSupplierDialog(id)  {
    var row =  $('#table').bootstrapTable("getRowByUniqueId",id);
    $("#myModalLabel").html("修改供应商信息");
    $("#name").val(row.name);
	$("#linkman").val(row.linkman);
	$("#mail").val(row.mail);
	$("#phone").val(row.phone);
	$("#address").val(row.address);
	$("#id").val(row.id);
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/supplier/modify"});
	$('#SupplierDialog').modal("show");
}
    
function deleteSupplier(id) {
	bootbox.confirm({
		 size: "small",
		 message: "确认要删除这条供应商记录吗？",
		 callback: function(result) {
			 if (result) {
				 $.post("${pageContext.request.contextPath}/mgr/supplier/delete",{ids:id},function(data){
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