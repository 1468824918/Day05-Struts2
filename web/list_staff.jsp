<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/10/16
  Time: 上午10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工</title>
    <script type="text/javascript">
        /*创建ajax请求对象*/
        function createXMLHttpRequest() {
            try {
                return new XMLHttpRequest();
            } catch (e) {
                try {
                    return new ActiveXObject("Msxml2.HTTP");
                } catch (e) {
                    try {
                        return new ActiveXObject("Microsoft.HTTP");
                    } catch (e) {
                        throw e; }
                } }
        }
        /*根据部门选中状态发起职务查询的请求*/
        function showPost(obj) {
            //获得部门选中id
            var departId = obj.value;

            //1.创建ajax请求对象
            var  httpRequest = createXMLHttpRequest();

            var  url = "${pageContext.request.contextPath}/findPostListByPid2.action?departId="+departId;

            //2.打开连接
            httpRequest.open("POST",url,true);

            //3.POST需要设置请求头
            httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            //4.发起请求,设置请求参数 部门id
            httpRequest.send("departId = " + departId);

            //5.设置请求响应的监听器
            httpRequest.onreadystatechange = function () {
                if(httpRequest.readyState == 4 && httpRequest.status==200){
                    //6.成功响应 处理响应结果
                    /*6.1将响应数据转换为json格式解析*/
                    var jsonData = eval("("+httpRequest.responseText+")");

                    /*6.2根据组件id获得职务下拉列表对象*/
                    var postSelect = document.getElementById("post");

                    /*6.3 添加请选择*/
                    postSelect.innerHTML = "<option value='1'>---请选择---</option>";

                    /*6.4 遍历json 数据集合  添加下拉选项*/
                    for (var i = 0 ; i < jsonData.length ; i++){
                        var id = jsonData[i].id;//职务id
                        var pname = jsonData[i].pname;//职务名称
                        postSelect.innerHTML += "<option value = '"+ id + "'>"+pname+"</option>"
                    }
                }
            }
        }
    </script>
</head>
<body>
<h3>员工列表</h3>

部门:
<select id="depart" onchange="showPost(this)">
    <option value="-1">---请选择---</option>
    <%--遍历数据集合显示下拉条数--%>
    <s:iterator value="departList" var="depart">
        <option value="${depart.id}">${depart.dname}</option>
    </s:iterator>
</select>
职务:
<select id="post">
    <option value="-1">---请选择---</option>
</select>
</body>
</html>
