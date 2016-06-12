<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  

<div class="content-wrapper">
	<section class="content">
	<div class="row">
                <div class="col-lg-12">
                      <div class="panel">
			<div class="panel-heading">${requestScope.title }</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<a class="btn btn-success" href="${pageContext.request.contextPath}/mgr/returnsale/addReturnSale"><i class="fa fa-plus"></i> 新增</a>
                        	<a class="btn btn-warning" onclick="searchReturnSaleToggle()"><i class="fa fa-search"></i> 查询</a>
                            
                            <div id="searchReturnSale" style="margin-top:15px;">
                            <form class="form-horizontal" id="searchReturnSaleForm">
                            <div class="row">
                            	<div class="col-sm-3">
                            	<div class="form-group">
    								<label for="searchReturnSaleSn" class="col-sm-4 control-label" style="text-align:left;">退货单编号</label>
    								<div class="col-sm-8">
    									<input type="text" class="form-control" id="searchReturnSaleSn" name="searchReturnSaleSn" placeholder="退货单编号">
    								</div>    				
  								</div>
  								</div>          	
                            	<div class="col-sm-6">
                            	<div class="form-group">
    								<label for="searchReturnSaleName" class="col-sm-2 control-label" style="text-align:left;">退货时间</label>
    								<div class="col-sm-4">
    									<input type="text" class="form-control" id="searchStartTime" name="searchStartTime" placeholder="开始时间" readonly="readonly">
    								</div>

    								<div class="col-sm-4">
    									<input type="text" class="form-control" id="searchEndTime" name="searchEndTime" placeholder="结束时间" readonly="readonly">
    								</div>    				
  								</div>
  								</div>
  								
  								</div>
								<div class="row">
									<div class="col-sm-3">
  										<a class="btn btn-primary" onclick="searchReturnSaleFormSubmit()">确认</a>
  										<a class="btn btn-default" onclick="searchReturnSaleToggle()">取消</a>
  									</div>
								</div>
  								</form>
                            </div>
                            
                            
                            <div class="dataTable_wrapper" style="margin-top:10px;">
                            	
                                <table id="returnSaleTable" class="table table-bordered table-striped table-hover">
                                   
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

<div class="modal fade" id="ReturnSaleDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" style="width:1020px;">
    <div class="modal-content">
      <div class="modal-header">
        <a class="close" onclick="cancel()" aria-label="Close"><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
      	<div class="well" style='margin-top:25px;'>
	<form class="form-horizontal">
        <div class="row">
        	<div class="col-sm-6">
 
  				<div class="form-group"> 
    			<label for="sn" class="col-sm-3 control-label">退货单编号</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="sn" name="sn" placeholder="退货单编号" />      				
    			</div>
    			
  				</div>
  				<div class="form-group"> 
    			<label for="userId" class="col-sm-3 control-label">操作员</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="userId" name="userId" placeholder="操作员" />      				
    			</div>    			
  				</div>
  				
  				<div class="form-group">
    			<label for="remark" class="col-sm-3 control-label">备注</label>
    			<div class="col-sm-6">
      				<textarea class="form-control" id="remark" name="remark" rows="3" style="resize:none;" placeholder="备注"></textarea>
    			</div>
    			<input type="hidden" id="returnSaleId" name="returnSaleId" value="" />
        	</div>						 			
  		</div>
  		<div class="col-sm-6">
        		<div class="form-group"> 
    			<label for="createTime" class="col-sm-3 control-label">退货时间</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="createTime" name="createTime" placeholder="退货时间" />      				
    			</div>
    			
  				</div>
  				<div class="form-group"> 
    			<label for="totalMoney" class="col-sm-3 control-label">退货商品总额</label>
    			<div class="col-sm-6">
      				<input type="text" class="form-control" id="totalMoney" name="totalMoney" placeholder="商品总额" />      				
    			</div>    			
  				</div>
        	</div> 	
      </div>
    </form>
	  <div class="row">
		<label for="returnSaleBTable" class="col-sm-3 control-label">退货商品</label>
      	<table id="returnSaleBTable" class="table table-bordered table-striped table-hover"></table>
 
      </div>
      </div>
      <div class="modal-footer">
        <a class="btn btn-danger"  onclick="cancel()">取消</a>
      </div>
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
	$("#searchReturnSale").hide();			// 隐藏查询DIV
	
	$('#searchStartTime').datepicker({		// datepicker 日期插件
		 language: 'zh-CN',
		autoclose:true,
	    format: 'yyyy-mm-dd',
	});
	
	$('#searchEndTime').datepicker({		// datepicker 日期插件
		language: 'zh-CN',
		autoclose:true,
	    format: 'yyyy-mm-dd',
	});
	
	 
	 
	var request = new UrlSearch(); //实例化
	var page = 1;
	var pageSize = 10;
	if (request.page != null) {
		page = parseInt(request.page);
	}
	if (request.pageSize != null) {
		pageSize = parseInt(request.pageSize);
	}
	$('#returnSaleTable').bootstrapTable({
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
 	                    	title: '序号',
 	                    	width: '1%',
   	                      	align: 'center',
   	                      	valign: 'middle',
   	                     	formatter:function(value,row,index){
   	                    		 return index + 1;
   	                    	}
 	                    },
 	                   {
 	 	                      title: '退货单编号',
 	 	                      field: 'sn',
 	 	                      width: '15%',
 	 	                      align: 'center',
 	 	                      valign: 'middle',
 	 	                     
 	 	                 }, 
 	                  {
 	                    title: '退货时间',
 	                      field: 'createTime',
 	                      width: '15%',
 	                      align: 'center',
 	                      valign: 'middle',
 	                      formatter:function(value,row,index) {
 	                    	  return value.substring(0,11);
 	                      }
 	                  }, 
 	                 {
 	 	                    title: '操作员',
 	 	                      field: 'userId',
 	 	                      width: '15%',
 	 	                      align: 'center',
 	 	                      valign: 'middle'	                     
 	 	                  },
 	 	                {
 	 	 	                    title: '退货单总额(￥)',
 	 	 	                      field: 'totalMoney',
 	 	 	                      width: '10%',
 	 	 	                      align: 'center',
 	 	 	                      valign: 'middle',
 	 	 	                   	  formatter:function(value,row,index){
 		                    	  
 		                          return parseFloat(value).toFixed(2);
 		                      }
 	 	 	                  }, 
 	                  {
 	                	  title: '操作',
 	                	  field: '',
 	                	  width: '10%',
 	                	  align: 'center',
	                      valign: 'middle',
	                      formatter:function(value,row,index){
	                    	  var v = '<a class="btn btn-warning btn-xs" onclick="viewReturnSaleDialog(\''+ row.id + '\')"><i class="fa fa-eye"></i></a> '; 
	                         
	                          return v;
	                      } 
 	                  }
 	              ],
 	             onPageChange:function(number, size) {
 	            	window.history.pushState(null, null, "returnSaleList?page=" + number + "&pageSize=" + size); 	
 	             }
 	                   
 	   });
	
	   $('#returnSaleBTable').bootstrapTable({
			url: "returnSaleBList", 
	 	    dataType: "json",
	 	    pagination: false, //分页
	 	    queryParams: queryParamsB,
	 	    sidePagination: "server", //服务端处理分页
		          columns: [
	 	                    {
	 	                    	title: '序号',
	 	                    	width: '1%',
	   	                      	align: 'center',
	   	                      	valign: 'middle',
	   	                     	formatter:function(value,row,index){
	   	                    		 return index + 1;
	   	                    	}
	 	                    },
		                   {
		 	                      title: '销售单编号',
		 	                      field: 'saleSn',
		 	                      width: '15%',
		 	                      align: 'center',
		 	                      valign: 'middle',
		 	                     
		 	                 },
		 	              
		                  {
		                      title: '商品名',
		                      field: 'goodsName',
		                      width: '15%',
		                      align: 'center',
		                      valign: 'middle'	                     
		                  },
		                  {
		                	  title: '退货数量',
		                	  field: 'num',
		                	  width: '10%',
		                	  align: 'center',
		                      valign: 'middle'	
		                  },

		                  {
		                	  title: '退货商品金额',
		                	  field: 'goodsMoney',
		                	  width: '10%',
		                	  align: 'center',
		                      valign: 'middle',
		                      formatter:function(value,row,index){		                    	  
		                          return parseFloat(value).toFixed(2);
		                      } 
		                  }	                  
		              ]
		   });

	   
	   
})

function searchReturnSaleToggle() {
	$("#searchReturnSale").toggle(500);
}

function searchReturnSaleFormSubmit() {
	$('#returnSaleTable').bootstrapTable("refresh");
}

function queryParams(params) {  //配置参数
    var return_params = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
      limit: params.limit,   //页面大小
      offset: params.offset,  //bootstrap分页偏移量
      searchReturnSaleSn:$("#searchReturnSaleSn").val(),
      searchStartTime:$("#searchStartTime").val(),
      searchEndTime:$("#searchEndTime").val(),
    };
    return return_params;
}

function queryParamsB(params) {  //配置参数
    var return_params = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
      limit: params.limit,   //页面大小
      offset: params.offset,  //bootstrap分页偏移量
      returnSaleId:$("#returnSaleId").val(),
    };
    return return_params;
}

function cancel() {
	$('#ReturnSaleDialog').modal("hide");
}

function viewReturnSaleDialog(id) {
	$("#returnSaleId").val(id);
	
	var row =  $('#returnSaleTable').bootstrapTable("getRowByUniqueId",id);
	$("#myModalLabel").html("退货单详细信息");
	$("#sn").val(row.sn);
    $("#remark").val(row.remark);
    $("#createTime").val(row.createTime.substring(0,11));
    $("#totalMoney").val(parseFloat(row.totalMoney).toFixed(2));
    $('#returnSaleBTable').bootstrapTable('refresh');

	$('#ReturnSaleDialog').modal("show");
}


     	
</script>