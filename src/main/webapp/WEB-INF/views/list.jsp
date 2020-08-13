<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: zwx001
  Date: 2020/7/10
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>

    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->

    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>

    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />

    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
    <!-- 使用 Bootstrap 搭建显示页面 -->
    <div class="container">
        <!-- 标题 -->
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>

        <!-- 按钮 -->
        <div class="row">
            <div>
                <audio src="${APP_PATH}/music/myWebsiteBackgroundMusic.mp3"
                       autoplay="autoplay" controls="controls" loop="loop" >
                </audio>
            </div>
            <div class="col-md-3 col-md-offset-9">
                <button class="btn btn-primary">新增</button>
                <button class="col-md-offset-5 btn btn-danger">删除</button>
            </div>
        </div>

        <!-- 表格 -->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover table-bordered">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>

                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <td>${emp.empId}</td>
                            <td>${emp.empName}</td>
                            <td>${emp.gender=="M"?"男":"女"}</td>
                            <td>${emp.email}</td>
                            <td>${emp.department.deptName}</td>
                            <td>
                                <button class="col-md-3 btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                    编辑
                                </button>
                                <span class="col-md-6"></span>
                                <button class="col-md-3 btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash"></span>
                                    删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
        <!-- 分页信息 -->
        <div class="row">

            <!--分页文字信息  -->
            <div class="col-md-6">
                当前记录数：xxx
                总 x 页
                当前 x 页
            </div>

            <!-- 分页条信息 -->
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="https://www.baidu.com" target="_blank">首页</a>
                        </li>
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.baidu.com" target="_blank">末页</a>
                        </li>
                    </ul>
                </nav>
            </div>

        </div>
    </div>
</body>
</html>
