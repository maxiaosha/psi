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
                        	<a class="btn btn-success" onclick="addGoodsDialog()"><i class="fa fa-plus"></i> 新增</a>
                        	<a class="btn btn-warning" onclick="searchGoodsToggle()"><i class="fa fa-search"></i> 查询</a>
                            <a class="btn btn-info" onclick="_editGoodsDialog()"><i class="fa fa-edit"></i> 修改</a>
                            <a class="btn btn-danger" onclick="_deleteGoods()"><i class="fa fa-remove"></i> 删除</a>
                            
                            <div id="searchGoods" style="margin-top:15px;">
                            <form class="form-horizontal" id="searchGoodsForm">
                            <div class="row">
                            	<div class="col-sm-3">
                            	<div class="form-group">
    								<label for="searchGoodsSn" class="col-sm-4 control-label" style="text-align:left;">商品编号</label>
    								<div class="col-sm-8">
    									<input type="text" class="form-control" id="searchGoodsSn" name="searchGoodsSn" placeholder="商品编号">
    								</div>    				
  								</div>
  								</div>          	
                            	<div class="col-sm-3">
                            	<div class="form-group">
    								<label for="searchGoodsName" class="col-sm-4 control-label" style="text-align:left;">商品名</label>
    								<div class="col-sm-8">
    									<input type="text" class="form-control" id="searchGoodsName" name="searchGoodsName" placeholder="商品名">
    								</div>    				
  								</div>
  								</div>
  								<div class="col-sm-3">
  								<div class="form-group">
    								<label for="searchGoodsTypeId" class="col-sm-4 control-label" style="text-align:left;">商品类别</label>
    								<div class="col-sm-8">
      									<input type="text" class="form-control" id="searchGoodsTypeId" name="searchGoodsTypeId" placeholder="商品类别">
    								</div>
  								</div>
  								</div>
  								<div class="col-sm-3">
  								<div class="form-group">
    								<label for="searchSupplierId" class="col-sm-4 control-label" style="text-align:left;">供应商</label>
    								<div class="col-sm-8">
      									<select class="form-control" id="searchSupplierId" name="searchSupplierId">
											<option value="">请选择</option>
										<c:forEach var="supplier" items="${requestScope.supplierList }">
											<option value="${supplier.id }">${supplier.name }</option>
										</c:forEach>
										</select>
    								</div>
  								</div>
  								</div>
  								</div>
  								<div class="row">
  									<div class="col-sm-3">
  										<a class="btn btn-primary" onclick="searchGoodsFormSubmit()">确认</a>
  										<a class="btn btn-default" onclick="searchGoodsToggle()">取消</a>
  									</div>
  								</div>
  								</form>
                            </div>
                            
                            
                            <div class="dataTable_wrapper" style="margin-top:10px;">
                            	
                                <table id="goodsTable" class="table table-bordered table-striped table-hover">
                                   
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

<div class="modal fade" id="GoodsDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" style="width:1020px;">
    <div class="modal-content">
      <div class="modal-header">
        <a class="close" onclick="cancel()" aria-label="Close"><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
      	<div class="well" style='margin-top:25px;'>
        <form id="Goods" class="form-horizontal">

        	<div class="row">
        	<div class="col-sm-6">
 
  				<div class="form-group">
  				 
    			<label for="name" class="col-sm-3 control-label">商品名</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="name" name="name" placeholder="商品名">
      				
    			</div>
    			<div class="need col-sm-1">
					*
    			</div>
    			
  				</div>
  				<div class="form-group">
    			<label for="goodsTypeId" class="col-sm-3 control-label">商品类别</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="goodsTypeId" name="goodsTypeId" placeholder="商品类别">
    			</div>
    			<div class="need col-sm-1">
					*
    			</div>
  				</div>
  				<div class="form-group">
    			<label for="supplierId" class="col-sm-3 control-label">供应商</label>
    			<div class="col-sm-6">
    				<select class="form-control" id="supplierId" name="supplier.id">
						<option value="">请选择</option>
							<c:forEach var="supplier" items="${requestScope.supplierList }">
						<option value="${supplier.id }">${supplier.name }</option>
							</c:forEach>
					</select>  
    			</div>
    			<div class="need col-sm-1">
					*
    			</div>
  				</div>
  				<div class="form-group">
    			<label for="name" class="col-sm-3 control-label">进价</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="purchasePrice" name="purchasePrice" placeholder="进价">
    			</div>
    			<div class="need col-sm-1">
					*
    			</div>
  				</div>
  				<div class="form-group">
    			<label for="name" class="col-sm-3 control-label">售价</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="salePrice" name="salePrice" placeholder="售价">
    			</div>
    			<div class="need col-sm-1">
					*
    			</div>
  				</div>
        	</div>
        	<div class="col-sm-6">
  				<div class="form-group">
    			<label for="productionDate" class="col-sm-3 control-label">生产日期</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="productionDate" name="productionDate" placeholder="生产日期">
    			</div>
  				</div>
  				<div class="form-group">
    			<label for="shelfLife" class="col-sm-3 control-label">保质期</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="shelfLife" name="shelfLife" placeholder="保质期">
    			</div>
  				</div>
  				<div class="form-group">
    			<label for="spec" class="col-sm-3 control-label">规格</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="spec" name="spec" placeholder="规格">
    			</div>
  				</div>
  				<div class="form-group">
    			<label for="numberUnit" class="col-sm-3 control-label">数量单位</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="numberUnit" name="numberUnit" placeholder="数量单位">
    			</div>
    			</div>
    			<div class="form-group">
    			<label for="remark" class="col-sm-3 control-label">备注</label>
    			<div class="col-sm-6">
    				<textarea id="remark" name="remark" class="form-control" placeholder="备注" style="resize:none;"></textarea>
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
	$("#searchGoods").hide();			// 隐藏查询DIV
	 
	var request = new UrlSearch(); //实例化
	var page = 1;
	var pageSize = 10;
	if (request.page != null) {
		page = parseInt(request.page);
	}
	if (request.pageSize != null) {
		pageSize = parseInt(request.pageSize);
	}
	$('#goodsTable').bootstrapTable({
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
   	                      	align: 'center',
   	                        width: '3%',
   	                      	valign: 'middle',
 	                    	checkbox: 'true'
 	                    },
 	                   {
 	 	                      title: '商品编号',
 	 	                      field: 'sn',
 	 	                      width: '15%',
 	 	                      align: 'center',
 	 	                      valign: 'middle',
 	 	                     
 	 	                 }, 
 	                  {
 	                    title: '名称',
 	                      field: 'name',
 	                      width: '15%',
 	                      align: 'center',
 	                      valign: 'middle'	                     
 	                  }, 
 	                  
 	                  {
 	                      title: '商品类别',
 	                      field: 'goodsTypeId',
 	                      width: '10%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                      title: '供应商',
 	                      field: 'supplier.name',
 	                      width: '10%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                      title: '售价',
 	                      field: 'salePrice',
 	                      width: '5%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                      title: '进价',
 	                      field: 'purchasePrice',
 	                      width: '5%',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                 /*  {
 	                      title: '生产日期',
 	                      field: 'productionDate',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                 {
 	                      title: '保质期',
 	                      field: 'shelfLife',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                 {
 	                      title: '规格',
 	                      field: 'spec',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                 {
 	                      title: '数量单位',
 	                      field: 'numberUnit',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                 {
 	                      title: '备注',
 	                      field: 'remark',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  }, */
 	                  {
 	                	  title: '操作',
 	                	  field: '',
 	                	  width: '10%',
 	                	  align: 'center',
	                      valign: 'middle',
	                      formatter:function(value,row,index){
	                    	  var c = '<a class="btn btn-warning btn-xs" onclick="viewGoodsDialog(\''+ row.id + '\')"><i class="fa fa-eye"></i></a> '; 
	                          var e = '<a class="btn btn-info btn-xs" onclick="editGoodsDialog(\''+ row.id + '\')"><i class="fa fa-edit"></i></a> ';  
	                          var d = '<a class="btn btn-danger btn-xs" onclick="deleteGoods(\''+ row.id +'\')"><i class="fa fa-remove"></i></a> ';  
	                          return c+ e + d;  
	                      } 
 	                  }
 	              ],
 	             onPageChange:function(number, size) {
 	            	window.history.pushState(null, null, "manageGoods?page=" + number + "&pageSize=" + size); 	
 	             }
 	                   
 	   });
	

	
	
	$("#submit").click(function() {
		if (!validate($("#id").val())) {
			return false;
		}

		$.ajax({
			type: "POST",
			url: $(this).attr("action"),
			data: $("#Goods").serialize(),
			dataType: "json",
			success: function(data) {
				if (data.status == 1) {
					$('#GoodsDialog').modal("hide");
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

function searchGoodsToggle() {
	$("#searchGoods").toggle(500);
}

function searchGoodsFormSubmit() {
	$('#goodsTable').bootstrapTable("refresh");
}

function queryParams(params) {  //配置参数
    var return_params = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
      limit: params.limit,   //页面大小
      offset: params.offset,  //bootstrap分页偏移量
      searchGoodsSn:$("#searchGoodsSn").val(),
      searchGoodsName:$("#searchGoodsName").val(),	//查询传商品名到服务器
      searchGoodsTypeId:$("#searchGoodsTypeId").val(),
      searchSupplierId:$("#searchSupplierId").val(),
    };
    return return_params;
}

function validate() {
	var isDou =  /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;		// double正数 
	if ($.trim($("#name").val()) == "") {
		$("#message").html("请输入商品名");
		$("#name").focus();
		return false;
	}
	if ($.trim($("#purchasePrice").val()) == "") {
		$("#message").html("请输入进价");
		$("#purchasePrice").focus();
		return false;
	}
	if (!isDou.test($.trim($("#purchasePrice").val()))) {
		$("#message").html("价格为正数");
		$("#purchasePrice").focus();
		return false;
	}	
	if ($.trim($("#salePrice").val()) == "") {
		$("#message").html("请输入售价");
		$("#salePrice").focus();
		return false;
	}
	if (!isDou.test($.trim($("#salePrice").val()))) {
		$("#message").html("价格为正数");
		$("#salePrice").focus();
		return false;
	}
		
	return true;
}

function resetValue() {
	$("#name").val("");
	$("#goodsTypeId").val("");
	$("#supplierId").prop('selectedIndex', 0);
	$("#purchasePrice").val("");
	$("#salePrice").val("");
	$("#productionDate").val("");
	$("#shelfLife").val("");
	$("#spec").val("");
	$("#numberUnit").val("");
	$("#remark").val("");
	$("#message").html("");
	$("#submit").show(500);
}

function addGoodsDialog() {
	$("#myModalLabel").html("新增商品");
	$('#GoodsDialog').modal("show");
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/goods/add"});
}

function cancel() {
	$('#GoodsDialog').modal("hide");
	resetValue();
}



function _editGoodsDialog() {
    var rows =  $('#goodsTable').bootstrapTable("getSelections");
    if (rows.length != 1) {
    	bootbox.alert({
    		size:"small",
    		message:"请选择一行记录"
    	});
    	return;
    }
    $("#myModalLabel").html("修改商品信息");
    $("#name").val(rows[0].name);
	$("#goodsTypeId").val(rows[0].goodsTypeId);
	$("#supplierId option").map(function () {
		if ($(this).val() == rows[0].supplier.id) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#purchasePrice").val(rows[0].purchasePrice);
	$("#salePrice").val(rows[0].salePrice);
	$("#productionDate").val(rows[0].productionDate);
	$("#shelfLife").val(rows[0].shelfLife);
	$("#spec").val(rows[0].spec);
	$("#numberUnit").val(rows[0].numberUnit);
	$("#remark").val(rows[0].remark);
	
	/*  */
	
	$("#id").val(rows[0].id);
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/goods/modify"});
	$('#GoodsDialog').modal("show");
}
    
function _deleteGoods() {
	var rows =  $('#goodsTable').bootstrapTable("getSelections");
    if (rows.length == 0) {
    	bootbox.alert({
    		size:"small",
    		message:"请选择要删除的记录"
    	});
    	return;
    }
    
    var strIds=[];
	 for(var i=0;i<rows.length;i++){
		 strIds.push(rows[i].id);
	 }
	 
	 var ids=strIds.join(",");
	 
	 bootbox.confirm({
		 size: "small",
		 message: "确认要删除这<font color=red>" + rows.length + "</font>条商品记录吗？",
		 callback: function(result) {
			 if (result) {
				 $.post("${pageContext.request.contextPath}/mgr/goods/delete",{ids:ids},function(data){
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

function viewGoodsDialog(id) {
	var row =  $('#goodsTable').bootstrapTable("getRowByUniqueId",id);
	$("#myModalLabel").html("商品详细信息");
	$("#submit").hide();
    $("#name").val(row.name);
	$("#goodsTypeId").val(row.goodsTypeId);
	$("#supplierId option").map(function () {
		if ($(this).val() == row.supplier.id) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#purchasePrice").val(row.purchasePrice);
	$("#salePrice").val(row.salePrice);
	$("#productionDate").val(row.productionDate);
	$("#shelfLife").val(row.shelfLife);
	$("#spec").val(row.spec);
	$("#numberUnit").val(row.numberUnit);
	$("#remark").val(row.remark);
	$('#GoodsDialog').modal("show");
}
    
function editGoodsDialog(id) {
    var row =  $('#goodsTable').bootstrapTable("getRowByUniqueId",id);
    $("#myModalLabel").html("修改商品信息");
    $("#name").val(row.name);
	$("#goodsTypeId").val(row.goodsTypeId);
	$("#supplierId option").map(function () {
		if ($(this).val() == row.supplier.id) {
			$(this).attr({"selected" : "selected"});
		}
	})
	$("#purchasePrice").val(row.purchasePrice);
	$("#salePrice").val(row.salePrice);
	$("#productionDate").val(row.productionDate);
	$("#shelfLife").val(row.shelfLife);
	$("#spec").val(row.spec);
	$("#numberUnit").val(row.numberUnit);
	$("#remark").val(row.remark);
	$("#id").val(row.id);
	$("#submit").attr({"action":"${pageContext.request.contextPath}/mgr/goods/modify"});
	$('#GoodsDialog').modal("show");
}
    
function deleteGoods(id) {
	bootbox.confirm({
		 size: "small",
		 message: "确认要删除这条商品记录吗？",
		 callback: function(result) {
			 if (result) {
				 $.post("${pageContext.request.contextPath}/mgr/goods/delete",{ids:id},function(data){
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