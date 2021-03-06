<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/adminlte/css/skins/_all-skins.min.css">
    <!-- bootstrap-table css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-table/bootstrap-table.css">
    <!-- psi css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/psi.css">
    
      <!-- jquery-->
    <script src="${pageContext.request.contextPath}/static/jquery/jquery.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/static/adminlte/js/app.min.js"></script>
    <!-- bootstrap-table js -->
    <script src="${pageContext.request.contextPath}/static/bootstrap-table/bootstrap-table.js"></script>
    <!-- bootstrap-table 汉化 -->
    <script src="${pageContext.request.contextPath}/static/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- bootbox-->
    <script src="${pageContext.request.contextPath}/static/bootbox/bootbox.js"></script>
</head>

     <body class="hold-transition skin-blue sidebar-mini" style="font-family:'Microsoft Yahei'">
     	<jsp:include page="/WEB-INF/head.jsp" />
		<jsp:include page="${requestScope.mainPage }" />
     </body>
</html>

     