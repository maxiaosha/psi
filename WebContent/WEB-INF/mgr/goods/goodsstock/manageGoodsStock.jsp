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
                        	<a class="btn btn-warning" onclick="searchGoodsStockToggle()"><i class="fa fa-search"></i> 查询</a>

                            
                            <div id="searchGoodsStock" style="margin-top:15px;">
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
  								</div>
  	
  								<div class="row">
  									<div class="col-sm-3">
  										<a class="btn btn-primary" onclick="searchGoodsFormSubmit()">确认</a>
  										<a class="btn btn-default" onclick="searchGoodsStockToggle()">取消</a>
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

<div class="modal fade" id="GoodsStockDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" style="width:1020px;">
    <div class="modal-content">
      <div class="modal-header">
        <a class="close" onclick="cancel()" aria-label="Close"><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
      	<div class="well" style='margin-top:25px;'>

        	<input type="hidden" id="goodsId" value="" /> 				 			
  		<div class="row">
				<label for="goodsStockTable" class="col-sm-3 control-label">商品库存信息</label>
      			<table id="goodsStockTable" class="table table-bordered table-striped table-hover"></table>
     	 </div>
  		</div>
      </div>
      <div class="modal-footer">
      	<span id="message" style="color:red;"></span>&nbsp;
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
	$("#searchGoodsStock").hide();			// 隐藏查询DIV
	 
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
 	                    	title: '序号',
   	                      	align: 'center',
   	                        width: '1%',
   	                      	valign: 'middle',
   	                     	formatter:function(value,row,index){
   	                    		 return index + 1;
   	                    	}
 	                    },
 	                   {
 	 	                      title: '商品编号',
 	 	                      field: 'sn',
 	 	                      width: '15%',
 	 	                      align: 'center',
 	 	                      valign: 'middle',
 	 	                     
 	 	                 }, 
 	                  {
 	                    title: '商品名',
 	                      field: 'name',
 	                      width: '15%',
 	                      align: 'center',
 	                      valign: 'middle'	                     
 	                  }, 
 	                  {
 	                      title: '总库存',
 	                      field: 'stock',
 	                      width: '5%',
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
	                    	  var v = '<a class="btn btn-warning btn-xs" onclick="viewGoodsStockDialog(\''+ row.id + '\')"><i class="fa fa-eye"></i></a> '; 
	                          return v;  
	                      } 
 	                  }
 	              ],
 	             onPageChange:function(number, size) {
 	            	window.history.pushState(null, null, "manageGoodsStock?page=" + number + "&pageSize=" + size); 	
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
	
	$('#goodsStockTable').bootstrapTable({
		url: "stockList", 
 	    dataType: "json",
 	    pagination: false, //分页
 	    queryParams: queryParamsS,
 	    sidePagination: "server", //服务端处理分页
	          columns: [
 	                    {
 	                    	title: '序号',
   	                      	align: 'center',
   	                        width: '1%',
   	                      	valign: 'middle',
   	                     	formatter:function(value,row,index){
   	                    		 return index + 1;
   	                    	}
 	                    },	                    
	                    {
	 	                      title: '库存编号',
	 	                      field: 'sn',
	 	                      width: '15%',
	 	                      align: 'center',
	 	                      valign: 'middle',
	 	                     
	 	                 }, 
	                   {
	 	                      title: '商品编号',
	 	                      field: 'goods.sn',
	 	                      width: '15%',
	 	                      align: 'center',
	 	                      valign: 'middle',
	 	                     
	 	                 }, 
	 	                {
	 	                      title: '商品名',
	 	                      field: 'goods.name',
	 	                      width: '15%',
	 	                      align: 'center',
	 	                      valign: 'middle',
	 	                     
	 	                 },
	 	                {
		                	  title: '生产日期',
		                	  field: 'productionDate',
		                	  width: '10%',
		                	  align: 'center',
		                      valign: 'middle'	
		                  },
	                  {
	                	  title: '剩余库存',
	                	  field: 'num',
	                	  width: '10%',
	                	  align: 'center',
	                      valign: 'middle'	
	                  },
                 
	              ]
	   });

})

function searchGoodsStockToggle() {
	$("#searchGoodsStock").toggle(500);
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
    };
    return return_params;
}

function queryParamsS(params) {  //配置参数
    var return_params = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
    	limit: params.limit,   //页面大小
    	offset: params.offset,  //bootstrap分页偏移量
    	goodsId:$("#goodsId").val(),
    };
    return return_params;
}

function cancel() {
	$('#GoodsStockDialog').modal("hide");
}


function viewGoodsStockDialog(id) {

	$("#myModalLabel").html("商品库存信息");
	$("#goodsId").val(id)
	$('#goodsStockTable').bootstrapTable("refresh");
	$('#GoodsStockDialog').modal("show");
}
    
  	
</script>