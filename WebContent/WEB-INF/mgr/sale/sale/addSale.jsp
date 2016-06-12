<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-wrapper">
	<section class="content">
	<div class="row">
                <div class="col-lg-12">
                      <div class="panel">
			<div class="panel-heading">${requestScope.title }</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                      	<a class="btn btn-success" onclick="submitSale();"><i class="fa fa-save"></i> 保存</a>
                            <a class="btn btn-default" href="${pageContext.request.contextPath}/mgr/sale/saleList"><i class="fa fa-reply"></i> 取消</a>&nbsp;<span id="g_message" style="color:red;"></span>
                  <form action="add" method="post" id="SaleForm">
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
              <li class="active"><a href="#tab_1" data-toggle="tab">销售商品 <span class="need">*</span></a></li>
             
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
              					<div style="margin-bottom:5px;">
                            	销售商品总金额：<span id="totalmoney" class="need"></span>
                            	</div>
                                <table id="goodsTable" class="table table-bordered table-striped table-hover">
                                   <thead>
                                   <tr>
                                    <th class="t_center" style="width:3%;">
                                   		<div class="th-inner">序号</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">库存编号</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                               
                                   	<th class="t_center" style="width:6%;">
                                   		<div class="th-inner">商品名</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">生产日期</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">库存数量</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:3%;">
                                   		<div class="th-inner">单价</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:6%;">
                                   		<div class="th-inner">销售商品金额</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:10%;">
                                   		<div class="th-inner">销售数量</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:3%;">
                                   		<div class="th-inner">操作</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	</tr>
                                   </thead>
                                   <tbody>
                                   <tr>
                                   <td class="t_center">
                                   1
                                   	</td>
                                   	<td class="t_center">
                                   		<input type="text" id="goodsStockSn" style="width:80%;" name="goodsStockSn" value="" /> <a class="btn btn-info btn-xs" onclick="chooseGoodsStock();" ><i class="fa fa-plus"></i></a>
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


<script>
$(document).ready(function() {
	bootbox.setDefaults({locale:"zh_CN"});
	
})

function chooseGoodsStock() {
	if ($.trim($("#goodsStockSn").val()) == ""){
		bootbox.alert({
			size: "small",
			message: "请输入商品库存编号！"
		})
		return;
	}
	
	$.ajax({
		url: "getGoodsStock",
		type: "post",
		data: ({goodsStockSn:$("#goodsStockSn").val()}),
		dataType: "json",
		success: function(data) {
			var goodsStock = data.goodsStock;
			if (goodsStock != null) {
				if ($("#" + goodsStock.id).length > 0) {
					var num = parseInt($("#n" + goodsStock.id).val());
					var t_num = parseInt(goodsStock.num);
					if (num < t_num) {
						$("#n" + goodsStock.id).val(num + 1);
						changeGoodsMoney($("#" + goodsStock.id));
						changeTotalMoney();
					} else {
						bootbox.alert({
							size: "small",
							message: "销售数量不能大于库存数量"
						})
					}										
				} else {
					var tr = "<tr id='"+ goodsStock.id +"'><input type='hidden' name='goodsStockId' value='"+ goodsStock.id +"' /><td class='t_center'></td><td class='t_center'>"+ goodsStock.sn +"</td><td class='t_center'>"+ goodsStock.goods.name +"</td><td class='t_center'>"+ goodsStock.productionDate +"</td><td class='t_center'>"+ goodsStock.num +"</td><td class='t_center'>"+ parseFloat(goodsStock.goods.salePrice).toFixed(2) +"</td><td class='t_center'>"+ parseFloat(goodsStock.goods.salePrice).toFixed(2) +"</td><td class='t_center'><a class='btn btn-default btn-xs' nid='"+ goodsStock.id +"' onclick='minus(this);'><i class='fa fa-minus'></i></a>  <input type='text'  id='n"+ goodsStock.id +"' onchange='changeGoodsMoney(this.parentNode.parentNode);' style='width:50px;text-align:center;' name='num' value='1'  />  <a class='btn btn-default btn-xs' nid='"+ goodsStock.id +"' onclick='plus(this);'><i class='fa fa-plus'></i></a></td><td  class='t_center'><a class='btn btn-danger btn-xs' onclick='removeTr(this)'><i class='fa fa-remove'></i></a></td></tr>";
					$("#goodsTable").prepend(tr);
					$("#goodsStockSn").val("");
					setGoodsTableNo();
					changeTotalMoney();
				}				
			} else {
				bootbox.alert({
					size: "small",
					message: "未查询到该库存编号的商品！"
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

function setGoodsTableNo() {
	var tr_index = 1;
	$("#goodsTable").find("tbody").find("tr").each(function() {
		$(this).find("td:eq(0)").text(tr_index);
		tr_index = tr_index + 1;
	})
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
	
	var t_num = parseInt($(obj).parent().parent().find("td:eq(4)").text());
	var num = parseInt($("#n" + nid).val());
	
	if (num < t_num) {
		$("#n" + nid).val(num + 1);
	} else {
		bootbox.alert({
			size: "small",
			message: "销售数量不能大于库存数量"
		})
		return;
	}
	
	changeGoodsMoney($(obj).parent().parent());
}

function changeGoodsMoney(obj) {
	var isPoInt =  /^[0-9]*[1-9][0-9]*$/;	// 正整数 
	var num = $(obj).find("td:eq(7)").find("input[type=text]").val();
	if (!isPoInt.test(num)) {
		bootbox.alert({
			size: "small",
			message: "请输入正整数"
		})
		return;
	}
	
	var i_num = parseInt(num);
	var t_num = parseInt($(obj).find("td:eq(4)").text());
	if (i_num > t_num) {
		bootbox.alert({
			size: "small",
			message: "销售数量不能大于库存数量"
		})
		return;
	}
	
	var goodsmoney = parseFloat(num) * parseFloat($(obj).find("td:eq(5)").text());
	$(obj).find("td:eq(6)").text(parseFloat(goodsmoney).toFixed(2));
	
	changeTotalMoney($(obj).parent());
}

function changeTotalMoney() {

	var totalmoney = parseFloat("0");
	$("#goodsTable").find("tbody").find("tr").each(function() {
		if ($.trim($(this).find("td:eq(5)").text()) != '') {
		var goodsmoney = $(this).find("td:eq(6)").text();
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
				 setGoodsTableNo();
			 }
		 }
	})
}


function cancel() {
	$('#GoodsDialog').modal("hide");
	resetValue();
}

function validateSale() {
	if ($("#goodsTable").find("tbody").find("tr").length <= 1) {
		$("#g_message").html("请插入销售商品");
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
		
		var t_num = parseInt($(this).parent().parent().find("td:eq(4)").text());
		var num = parseInt($(this).val());
		
		if (num > t_num) {
			$("#g_message").html("销售数量不能大于库存数量");
			$(this).focus();
			flag = false;
			return;
		}
	})

	return flag;
}

function submitSale() {
	if (!validateSale()) {
		return false;
	}
	
	$.ajax({
		type: "POST",
		url: $("#SaleForm").attr("action"),
		data: $("#SaleForm").serialize(),
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