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
                        
                        	<a class="btn btn-success" onclick=""><i class="fa fa-save"></i> 保存</a>
                            <a class="btn btn-default" onclick=""><i class="fa fa-reply"></i> 取消</a>
                
               <div class="nav-tabs-custom" style="margin-top:20px;">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab">商品</a></li>
             
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
                            	
                                <table id="goodsTable" class="table table-bordered table-striped table-hover">
                                   <thead>
                                   <tr>
                                   	<th style="text-align: center; vertical-align: middle; ">
                                   		<div class="th-inner">名称</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th style="text-align: center; vertical-align: middle; ">
                                   		<div class="th-inner">售价</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th style="text-align: center; vertical-align: middle; ">
                                   		<div class="th-inner">规格</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th style="text-align: center; vertical-align: middle; ">
                                   		<div class="th-inner">单位</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	<th style="text-align: center; vertical-align: middle; ">
                                   		<div class="th-inner">数量</div>
                                   		<div class="fht-cell"></div>
                                   	</th>
                                   	</tr>
                                   </thead>
                                   <tbody>
                                   <tr>
                                   	<td style="text-align: center; vertical-align: middle; ">
                                   		<a class="btn btn-info btn-xs" onclick="" ><i class="fa fa-plus"></i></a>
                                   	</td>
                                   	<td style="text-align: center; vertical-align: middle; ">
                                   	</td>
                                   	<td style="text-align: center; vertical-align: middle; ">
                                   	</td>
                                   	<td style="text-align: center; vertical-align: middle; ">
                                   	</td>
                                   	<td style="text-align: center; vertical-align: middle; ">
                                   	</td>
                                   	</tr>
                                   	<tr>
                                   	 <td style="text-align: center; vertical-align: middle; ">
                                   		<a class="btn btn-info btn-xs" onclick="" ><i class="fa fa-plus"></i></a>
                                   	</td>
                                   	<td style="text-align: center; vertical-align: middle; ">
                                   	</td>
                                   	<td style="text-align: center; vertical-align: middle; ">
                                   	</td>
                                   	<td style="text-align: center; vertical-align: middle; ">
                                   	</td>
                                   	<td style="text-align: center; vertical-align: middle; ">
                                   	</td>
                                   	</tr>
                                   </tbody>
                                </table>
              
              </div>
            </div></div>
                
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
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <a class="close" onclick="cancel()" aria-label="Close"><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
      		<table id="goodsTable" class="table table-bordered table-striped table-hover"></table>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
	bootbox.setDefaults({locale:"zh_CN"});
	 
	$('#goodsTable').bootstrapTable({
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
   	                      	align: 'center',
   	                      	valign: 'middle',
 	                    	checkbox: 'true'
 	                    },
 	                   {
 	 	                      title: '商品编号',
 	 	                      field: 'sn',
 	 	                      align: 'center',
 	 	                      valign: 'middle',
 	 	                     
 	 	                 }, 
 	                  {
 	                    title: '名称',
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
 	                      field: 'supplierId',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                      title: '售价',
 	                      field: 'salePrice',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
 	                      title: '进价',
 	                      field: 'purchase',
 	                      align: 'center',
 	                      valign: 'middle'
 	                  },
 	                  {
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
 	                  },
 	              ]

 	                   
 	   });
})
</script>