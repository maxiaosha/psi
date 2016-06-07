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
                        
                      	<a class="btn btn-success" onclick="submitReplenish();"><i class="fa fa-save"></i> 保存</a>
                            <a class="btn btn-default" href="${pageContext.request.contextPath}/mgr/goods/replenish/replenishList"><i class="fa fa-reply"></i> 取消</a>&nbsp;<span id="g_message" style="color:red;"></span>
                  <form action="add" method="post" id="ReplenishForm">
                        <div class="row" style="margin-top:15px;">
                        	<div class="col-sm-6">
                        		<div class="form-group">
                  					<label>备注</label>
                  					<textarea class="form-control" name="remark" rows="3" style="resize:none;" placeholder="备注"></textarea>
                					</div>
                        	</div>
                        </div>    
                 
                
               <div class="nav-tabs-custom" style="margin-top:15px;">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab">进货商品 <span class="need">*</span></a></li>
             
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
              					<div style="margin-bottom:5px;">
                            	商品总金额：<span id="totalmoney" class="need"></span>
                            	</div>
                                <table id="goodsTable" class="table table-bordered table-striped table-hover">
                                   <thead>
                                   <tr>
                                   	<th class="t_center" style="width:15%;">
                                   		<div class="th-inner">商品编号</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:15%;">
                                   		<div class="th-inner">商品名</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">商品类别</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">供应商</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">单价</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">商品金额</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">采购数量</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:5%;">
                                   		<div class="th-inner">操作</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	</tr>
                                   </thead>
                                   <tbody>
                                   <tr>
                                   	<td class="t_center">
                                   		<a class="btn btn-info btn-xs" onclick="chooseGoodsDialog();" ><i class="fa fa-plus"></i></a>
                                   	</td>
                                   	<td class="t_center">
                                   	</td>
                                   	<td class="t_center">
                                   	</td>
                                   	<td class="t_center">
                                   	</td>
                                   	<td class="t_center">
                                   	</td>
                                   	<td class="t_center">
                                   	</td>
                                   	<td class="t_center">
                                   	</td>
                                   	<td class="t_center">
                                   	</td>
                                   	</tr>
                                   
                                   </tbody>
                                </table>
              
              </div>
            </div></div>
                </form> 
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
     	 <form class="form-horizontal" id="searchGoodsForm">
      		<div class="row">
                            	<div class="col-sm-4">
                            	<div class="form-group">
    								<label for="searchGoodsSn" class="col-sm-4 control-label" style="text-align:left;">商品编号</label>
    								<div class="col-sm-8">
    									<input type="text" class="form-control" id="searchGoodsSn" name="searchGoodsSn" placeholder="商品编号">
    								</div>    				
  								</div>
  								</div>          	
                            	<div class="col-sm-4">
                            	<div class="form-group">
    								<label for="searchGoodsName" class="col-sm-4 control-label" style="text-align:left;">商品名</label>
    								<div class="col-sm-8">
    									<input type="text" class="form-control" id="searchGoodsName" name="searchGoodsName" placeholder="商品名">
    								</div>    				
  								</div>
  								</div>
  								<div class="col-sm-4">
  								<div class="form-group">
    								<label for="searchGoodsTypeId" class="col-sm-4 control-label" style="text-align:left;">商品类别</label>
    								<div class="col-sm-8">
      									<input type="text" class="form-control" id="searchGoodsTypeId" name="searchGoodsTypeId" placeholder="商品类别">
    								</div>
  								</div>
  								</div>
  			</div>
  			<div class="row">				
  								<div class="col-sm-4">
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
  								<div class="col-sm-4">
  									<a class="btn btn-warning" onclick="searchGoodsFormSubmit();"><i class="fa fa-search"></i> 查询</a>
  								</div>
  
  			</div>
  		</form>
      		<table id="chooseGoodsTable" class="table table-bordered table-striped table-hover"></table>
      </div>
       <div class="modal-footer">
      	<span id="s_message" style="color:red;"></span>&nbsp;
        <a class="btn btn-success" onclick="chooseGoods();">确认</a>
        <a class="btn btn-danger"  onclick="cancel();">取消</a>
     </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
	bootbox.setDefaults({locale:"zh_CN"});	
})

function chooseGoodsDialog() {
	$("#myModalLabel").html("选择商品");
	$('#GoodsDialog').modal("show");
	$('#chooseGoodsTable').bootstrapTable({
 	 	url: "${pageContext.request.contextPath}/mgr/goods/list", 
 	    dataType: "json",
 	    pagination: true, //分页
 	    singleSelect: false,
 	    uniqueId: "id",
 	    queryParams: queryParams,
 	    sidePagination: "server", //服务端处理分页
 	          columns: [
 	                    {
 	                    	title: '<input type="checkbox" id="allCheckbox" />',
   	                      	align: 'center',
   	                      	valign: 'middle',
   	                     	formatter:function(value,row,index){
	                    		 return "<input type='checkbox' class='selCheckbox' value='"+ row.id +"' />";
	                    	}
 	                    },
 	                   {
 	 	                      title: '商品编号',
 	 	                      field: 'sn',
 	 	                      align: 'center',
 	 	                      valign: 'middle',
 	 	                     
 	 	                 }, 
 	                  {
 	                    title: '商品名',
 	                      field: 'name',
 	                      align: 'center',
 	                      valign: 'middle'	                     
 	                  }, 
 	                  
 	                  {
 	                      title: '商品类别',
 	                      field: 'goodsTypeId',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                      title: '供应商',
 	                      field: 'supplier.name',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },

 	                  {
 	                      title: '进价',
 	                      field: 'purchasePrice',
 	                      align: 'center',
 	                      valign: 'middle',
 	                     formatter:function(value,row,index) {
 	                    	 return parseFloat(value).toFixed(2);
 	                     }
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
 	                  }

 	              ],
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
}

function searchGoodsFormSubmit() {
	$('#chooseGoodsTable').bootstrapTable("refresh");
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

function resetValue() {
	$("#searchGoodsSn").val("");
	$("#searchGoodsName").val("");
	$("#searchGoodsTypeId").val("");
	$("#searchSupplierId").val("");
	$("#s_message").html("");
	$("#allCheckbox").iCheck('uncheck');
	$('#chooseGoodsTable').bootstrapTable("refresh");
}


function validateIsChooseGoods() {
	
	return true;
}

function chooseGoods() {	
	var strIds = new Array();
	$(".selCheckbox:checked").each(function() {
		strIds.push($(this).val());
	})
	
    if (strIds.length == 0) {
    	$("#s_message").html("请选择商品");
    	return;
    }
	
	
	for (var i=0; i<strIds.length; i++) {
		var row =   $('#chooseGoodsTable').bootstrapTable("getRowByUniqueId", strIds[i]);
		
		if ($("#" + row.id).length > 0) {
			var num = parseInt($("#n" + row.id).val());
			$("#n" + row.id).val(num + 1);
		} else {
			var nid = "\'"+ row.id + "\'";
			var tr = "<tr id='"+ row.id +"'><input type='hidden' name='goodsId' value='"+ row.id +"' /><td class='t_center'>"+ row.sn +"</td><td class='t_center'>"+ row.name +"</td><td class='t_center'>"+ row.goodsTypeId +"</td><td class='t_center'>"+ row.supplier.name +"</td><td class='t_center'>"+ parseFloat(row.purchasePrice).toFixed(2) +"</td><td class='t_center'>"+ parseFloat(row.purchasePrice).toFixed(2) +"</td><td class='t_center'><a class='btn btn-default btn-xs' nid='"+ row.id +"' onclick='minus(this);'><i class='fa fa-minus'></i></a>  <input type='text'  id='n"+ row.id +"' onchange='changeGoodsMoney(this.parentNode.parentNode);' style='width:50px;text-align:center;' name='num' value='1'  />  <a class='btn btn-default btn-xs' nid='"+ row.id +"' onclick='plus(this);'><i class='fa fa-plus'></i></a></td><td  class='t_center'><a class='btn btn-danger btn-xs' onclick='removeTr(this)'><i class='fa fa-remove'></i></a></td></tr>";
			$("#goodsTable").prepend(tr);
		}
	}

	changeTotalMoney();
	cancel();
}

function minus(obj) {
	var nid = $(obj).attr("nid");
	
	var num = parseInt($("#n" + nid).val());
	if (num > 1) {
		$("#n" + nid).val(num - 1);
	}
	
	changeGoodsMoney($(obj).parent().parent());
}


function plus(obj) {
	var nid = $(obj).attr("nid");
	
	var num = parseInt($("#n" + nid).val());
	$("#n" + nid).val(num + 1);
	
	changeGoodsMoney($(obj).parent().parent());
}

function changeGoodsMoney(obj) {
	var isPoInt =  /^[0-9]*[1-9][0-9]*$/;	// 正整数 
	var num = $(obj).find("td:eq(6)").find("input[type=text]").val();
	if (!isPoInt.test(num)) {
		bootbox.alert({
			size: "small",
			message: "请输入正整数"
		})
		return;
	}
	
	var goodsmoney = parseFloat(num) * parseFloat($(obj).find("td:eq(4)").text());
	$(obj).find("td:eq(5)").text(parseFloat(goodsmoney).toFixed(2));
	
	changeTotalMoney($(obj).parent());
}

function changeTotalMoney() {

	var totalmoney = parseFloat("0");
	$("#goodsTable").find("tbody").find("tr").each(function() {
		if ($.trim($(this).find("td:eq(5)").text()) != '') {
		var goodsmoney = $(this).find("td:eq(5)").text();
		totalmoney = parseFloat(totalmoney) + parseFloat(goodsmoney);
		}
	})
	$("#totalmoney").html(parseFloat(totalmoney).toFixed(2));	
}

function removeTr(obj) {
	bootbox.confirm({
		 size: "small",
		 message: "确认要移除这条商品记录吗？",
		 callback: function(result) {
			 if (result) {
				 $(obj).parent().parent().remove();
			 }
		 }
	})
}


function cancel() {
	$('#GoodsDialog').modal("hide");
	resetValue();
}

function validateRelenish() {
	if ($("#goodsTable").find("tbody").find("tr").length <= 1) {
		$("#g_message").html("请插入进货商品");
		return false;
	}
	
	var flag = true;
	var isPoInt =  /^[0-9]*[1-9][0-9]*$/;	// 正整数 
	$("input[name=num]").each(function() {
		if (!isPoInt.test($(this).val())) {
			$("#g_message").html("请输入正确的数量");
			$(this).focus();
			flag = false;
			return false;
		}
	})
	
	return flag;
}

function submitReplenish() {
	if (!validateRelenish()) {
		return false;
	}
	
	$.ajax({
		type: "POST",
		url: $("#ReplenishForm").attr("action"),
		data: $("#ReplenishForm").serialize(),
		dataType: "json",
		success: function(data) {
			if (data.status == 1) {
				bootbox.alert({
					size: "small",
					message: data.message,
					callback: function() {
						window.location.href = data.data;
					}
				})
			} else {
				bootbox.alert({
					size: "small",
					message: data.message
				})
			}
		},
		error: function() {
			bootbox.alert({
				size: "small",
				message: "未知错误！"
			})
		}
	})
}
</script>