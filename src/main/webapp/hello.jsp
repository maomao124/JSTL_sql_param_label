<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_sql_param_label
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/9
  Time(创建时间)： 19:38
  Description(描述)：
  JSTL <sql:param> 标签用来设置 SQL 语句中的动态值，通常与 <sql:update> 和 <sql:query> 标签结合使用。
JSP <sql:param> 标签的语法如下：
<sql:param value="value"/>
其中，value 表示要设置的动态参数值。
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--
var：代表数据源的变量；
driver：注册的 JDBC 驱动；mysql8.0:com.mysql.jdbc.Driver
url://地址:端口号/数据库名
user：连接数据库时使用的用户名；
password：连接数据库时使用的密码；
dataSource：已经存在的数据源；
scope：设定参数 var 的有效范围，默认为 page
--%>
<sql:setDataSource var="student" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/student"
                   user="root" password="20010713"/>

修改前：
<br/>
<%--
var：代表SQL查询的结果；
dataSource：连接的数据源；
maxRows：设置最多可存放的记录条数；
scope：设定参数 var 的有效范围，默认为 page；
sql：查询的 SQL 语句；
startRow：开始查询的行数。
--%>
<sql:query var="result" dataSource="${student}">
    SELECT * FROM information;
</sql:query>

<table border="1">
    <tr>
        <th>no</th>
        <th>name</th>
        <th>sex</th>
        <th>age</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.no}"/></td>
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.sex}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>

<c:set var="age" value="<%=mao.jstl_sql_param_label.rad.getIntRandom(10,25)%>" scope="page"/>

<%--
var：用来存储所影响行数的变量；
dataSource：连接的数据源；
scope：设定参数 var 的有效范围，默认为 page；
sql：更新的 SQL 语句，可以是 INSERT、UPDATE、DELETE 语句。
--%>
<sql:update dataSource="${student}" var="result">
    update information set age=? where name='赵六';
    <sql:param value="${age}"/>
</sql:update>
<br>
<br/>
修改后：
<br/>

<%--
var：代表SQL查询的结果；
dataSource：连接的数据源；
maxRows：设置最多可存放的记录条数；
scope：设定参数 var 的有效范围，默认为 page；
sql：查询的 SQL 语句；
startRow：开始查询的行数。
--%>
<sql:query var="result" dataSource="${student}">
    SELECT * FROM information;
</sql:query>

<table border="1">
    <tr>
        <th>no</th>
        <th>name</th>
        <th>sex</th>
        <th>age</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.no}"/></td>
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.sex}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
