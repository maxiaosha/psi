<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico">
    <title>${requestScope.title }</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css"> 
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    

    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/adminlte/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/adminlte/css/skins/_all-skins.css">
    <!-- bootstrap-table css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-table/bootstrap-table.css">
    <!-- datepicker css  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/datepicker/datepicker3.css">
    <!-- psi css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/psi.css">
    <!-- iCheck for checkboxes and radio inputs -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/iCheck/all.css">
    
      <!-- jquery-->
    <script src="${pageContext.request.contextPath}/static/jquery/jquery.min.js"></script>
    
</head>

     <body class="hold-transition skin-blue sidebar-mini" style="font-family:'Microsoft Yahei'">
     	<jsp:include page="/WEB-INF/head.jsp" />
		<jsp:include page="${requestScope.mainPage }" />
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0.0
    </div>
    <strong>Copyright © 2016 <a href="javascript:void(0)">zcll</a>.</strong> All rights
    reserved.
  </footer>
  
    <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <!--
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    -->
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
      </div>
      <!-- /.tab-pane -->

      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <div class="control-sidebar-bg" style="position: fixed; height: auto;"></div>
  
		<!-- Bootstrap 3.3.5 -->
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/static/adminlte/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/static/adminlte/js/demo.js"></script>
    <!-- bootstrap-table js -->
    <script src="${pageContext.request.contextPath}/static/bootstrap-table/bootstrap-table.js"></script>
    <!-- bootstrap-table 汉化 -->
    <script src="${pageContext.request.contextPath}/static/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- bootbox-->
    <script src="${pageContext.request.contextPath}/static/bootbox/bootbox.js"></script>
    <!-- datepicker js  -->
     <script src="${pageContext.request.contextPath}/static/datepicker/bootstrap-datepicker.js"></script>
     <!-- datepicker 汉化 -->
     <script src="${pageContext.request.contextPath}/static/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
     <!-- iCheck 1.0.1 -->
	<script src="${pageContext.request.contextPath}/static/iCheck/icheck.min.js"></script>
     </body>
</html>

     