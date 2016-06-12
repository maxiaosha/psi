﻿<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 <div class="wrapper">

      <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>PSI</b></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>AdminPSI</b></span>
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only"></span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
				<li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${pageContext.request.contextPath}/static/head_image/default.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">枫树下</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="${pageContext.request.contextPath}/static/head_image/default.jpg" class="img-circle" alt="User Image">

                <p>
                  管理员
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">

                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">修改资料</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">登出</a>
                </div>
              </li>
            </ul>
          </li>
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>


            </ul>
          </div>

        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
<div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath}/static/head_image/default.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>枫树下</p>
          <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
        </div>
      </div>         

          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">超市进销存管理系统</li>
            <c:forEach var="menu1" items="${applicationScope.list }">
            	<c:set var="size1" value="${fn:length(menu1.childList) }" />
            	<c:set var="theString" value="${pageContext.request.requestURL }" />
            	<c:choose>
            		<c:when test="${fn:containsIgnoreCase(requestScope.mainPage, menu1.url)}">
            			<li class="treeview active">
            		</c:when>
            		<c:otherwise>
            			<li class="treeview ">
            		</c:otherwise>
            	</c:choose>
            		<a href="${pageContext.request.contextPath}${menu1.url}">
            			<i class="${menu1.icon }"></i> <span>${menu1.name}</span>
            			<c:if test="${size1 > 0 }"><i class="fa fa-angle-left pull-right"></i></c:if>
            		</a>
            	
				<c:if test="${size1 > 0 }">
					<ul class="treeview-menu">
					<c:forEach var="menu2" items="${menu1.childList }">
						<c:set var="size2" value="${fn:length(menu2.childList) }" />
						<c:choose>
            				<c:when test="${fn:containsIgnoreCase(requestScope.mainPage, menu2.url)}">
						<li class="active">
							</c:when>
							<c:otherwise>
						<li>
							</c:otherwise>
						</c:choose>
							<a href="${pageContext.request.contextPath}${menu2.url}">
            					<i class="${menu2.icon }"></i> <span>${menu2.name}</span>
            					<c:if test="${size2 > 0 }"><i class="fa fa-angle-left pull-right"></i></c:if>
            				</a>
						
						<c:if test="${size2 >0 }">
							<ul class="treeview-menu">
							<c:forEach var="menu3" items="${menu2.childList }">
								<c:choose>
            						<c:when test="${fn:containsIgnoreCase(requestScope.mainPage, menu3.url)}">
								<li class="active">
									</c:when>
									<c:otherwise>
								<li>
									</c:otherwise>
								</c:choose>
									<a href="${pageContext.request.contextPath}${menu3.url}">
            							<i class="${menu3.icon }"></i> <span>${menu3.name}</span>
            						</a>
								</li>
							</c:forEach>
							</ul>
						</c:if>
						</li>						
					</c:forEach>
					</ul>
				</c:if>
				</li>
            </c:forEach>
         <!--    
            <li class="active treeview">
              <a href="#">
                <i class="fa fa-gears"></i> <span>常用操作</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-pencil"></i> 录入员工信息</a></li>
                <li><a href="#"><i class="fa fa-pencil"></i> 录入商品信息</a></li>
				<li><a href="#"><i class="fa fa-circle-o"></i> 商品类别管理</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i> 商品信息管理</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-users"></i>
                <span>员工管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> 员工信息管理</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-files-o"></i> <span>仓库管理</span> 
                <i class="fa fa-angle-left pull-right"></i>
              </a>
			  <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i>入库登记</a></li>
				<li><a href="#"><i class="fa fa-circle-o"></i>出库登记</a></li>
				<li><a href="#"><i class="fa fa-circle-o"></i>库存盘点</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i>库存预警</a></li>
              </ul>
            </li>
			 <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>商品销售管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> 商品销售</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i> 顾客退货登记</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>统计报表</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i>员工信息报表管理</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i>采购明细表</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i>供销商排行榜</a></li>
				<li><a href="#"><i class="fa fa-circle-o"></i>员工销售排行榜</a></li>
              </ul>
            </li> -->
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>