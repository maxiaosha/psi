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
                        
                      	<a class="btn btn-success" onclick="submitReturnSale();"><i class="fa fa-save"></i> 保存</a>
                            <a class="btn btn-default" href="${pageContext.request.contextPath}/mgr/returnSale/returnSaleList"><i class="fa fa-reply"></i> 取消</a>&nbsp;<span id="g_message" style="color:red;"></span>
                  <form action="add" method="post" id="ReturnSaleForm">
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
              <li class="active"><a href="#tab_1" data-toggle="tab">退货商品 <span class="need">*</span></a></li>
             
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
              					<div style="margin-bottom:5px;">
                            	退货商品总金额：<span id="totalmoney" class="need"></span>
                            	</div>
                                <table id="goodsTable" class="table table-bordered table-striped table-hover">
                                   <thead>
                                   <tr>
                                    <th class="t_center" style="width:3%;">
                                   		<div class="th-inner">序号</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:9%;">
                                   		<div class="th-inner">销售单编号</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                 
                                   	<th class="t_center" style="width:6%;">
                                   		<div class="th-inner">商品名</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:6%;">
                                   		<div class="th-inner">销售数量</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:6%;">
                                   		<div class="th-inner">已退货数量</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:3%;">
                                   		<div class="th-inner">单价</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:5%;">
                                   		<div class="th-inner">退货金额</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th class="t_center" style="width:8%;">
                                   		<div class="th-inner">退货数量</div>
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
                                   		<input type="text" id="saleSn" style="width:80%;" name="saleSn" value="" /> <a class="btn btn-info btn-xs" onclick="chooseGoodsStock();" ><i class="fa fa-plus"></i></a>
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


<script>
$(document).ready(function() {
	bootbox.setDefaults({locale:"zh_CN"});
	
})

function chooseGoodsStock() {
	if ($.trim($("#saleSn").val()) == ""){
		bootbox.alert({
			size: "small",
			message: "请输入销售单编号！"
		})
		return;
	}
	
	$.ajax({
		url: "getSaleB",
		type: "post",
		data: ({saleSn:$("#saleSn").val()}),
		dataType: "json",
		success: function(data) {
			if (data.hasSale == '0') {
				bootbox.alert({
					size: "small",
					message: "未查询到该销售单信息！"
				})
				return;
			}
			
			var rows = data.rows;			
			var flag = false;
				$.each(rows, function(i, saleB) {					
					if ($("#" + saleB.id).length > 0) {
						var num = parseInt($("#n" + saleB.id).val());
						var t_num = parseInt(saleB.num) - parseInt(saleB.returnNum);
						if (num < t_num) {
							$("#n" + saleB.id).val(num + 1);
							changeGoodsMoney($("#" + saleB.id));
							changeTotalMoney();
						} else {
							bootbox.alert({
								size: "small",
								message: "退货总数量不能大于销售数量"
							})
						}						
					} else {
						flag = true;
						var tr = "<tr id='"+ saleB.id +"'><input type='hidden' name='saleBId' value='"+ saleB.id +"' /><td class='t_center'></td><td class='t_center'>"+ saleB.sale.sn +"</td><td class='t_center'>"+ saleB.goodsStock.goods.name +"</td><td class='t_center'>"+ saleB.num +"</td><td class='t_center'>"+ saleB.returnNum +"</td><td class='t_center'>"+ parseFloat(saleB.goodsStock.goods.salePrice).toFixed(2) +"</td><td class='t_center'>"+ parseFloat(saleB.goodsStock.goods.salePrice).toFixed(2) +"</td><td class='t_center'><a class='btn btn-default btn-xs' nid='"+ saleB.id +"' onclick='minus(this);'><i class='fa fa-minus'></i></a>  <input type='text'  id='n"+ saleB.id +"' onchange='changeGoodsMoney(this.parentNode.parentNode);' style='width:50px;text-align:center;' name='num' value='1'  />  <a class='btn btn-default btn-xs' nid='"+ saleB.id +"' onclick='plus(this);'><i class='fa fa-plus'></i></a></td><td  class='t_center'><a class='btn btn-danger btn-xs' onclick='removeTr(this)'><i class='fa fa-remove'></i></a></td></tr>";
						$("#goodsTable").prepend(tr);
						$("#saleSn").val("");
						setGoodsTableNo();
						changeTotalMoney();
					}
				})

				if (!flag) {
					bootbox.alert({
						size: "small",
						message: "该销售单无可退货商品！"
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

	var t_num = parseInt($(obj).parent().parent().find("td:eq(3)").text()) - parseInt($(obj).parent().parent().find("td:eq(4)").text());
	var num = parseInt($("#n" + nid).val());
	if (num < t_num) {	
		$("#n" + nid).val(num + 1);		
		changeGoodsMoney($(obj).parent().parent());
	} else {
		bootbox.alert({
			size: "small",
			message: "退货总数量不能大于销售数量"
		})
	}
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
	
	var t_num = parseInt($(obj).find("td:eq(3)").text() - $(obj).find("td:eq(4)").text());
	var i_num = parseInt($(obj).find("td:eq(7)").find("input[type=text]").val());
	if (i_num > t_num) {
		bootbox.alert({
			size: "small",
			message: "退货总数量不能大于销售数量"
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

function validateReturnSale() {
	if ($("#goodsTable").find("tbody").find("tr").length <= 1) {
		$("#g_message").html("请插入退货商品");
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
		var t_num = parseInt($(this).parent().parent().find("td:eq(3)").text() - $(this).parent().parent().find("td:eq(4)").text());
		var i_num = parseInt($(this).val());

		if (i_num > t_num) {
			$("#g_message").html("退货总数量不能大于销售数量");
			$(this).focus();
			flag = false;
			return false;
		}
	})

	return flag;
}

function submitReturnSale() {
	if (!validateReturnSale()) {
		return false;
	}
	
	$.ajax({
		type: "POST",
		url: $("#ReturnSaleForm").attr("action"),
		data: $("#ReturnSaleForm").serialize(),
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