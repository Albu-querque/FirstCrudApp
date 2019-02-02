<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Games Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td, legend[id=legendForm1]{
            font-family: URW Chancery L, cursive;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            text-align: center;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        :hover {
            color: #b9b519;
        }

        div {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .width{
            width: 80px;
        }


        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            text-align: center;
            overflow: hidden;
            word-break: normal;
            border-color: #919191;
            color: #333;
            background-color: #cbcbcb;
        }

    </style>
</head>
<body style="background: radial-gradient(at top, #FEFFFF, #A7CECC); word-wrap: normal;">

<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1 align="center">Game List</h1>

<c:if test="${!empty listGames}">
    <table class="tg" align="center">
        <tr>
            <th width="50">ID</th>
            <th width="150">Name of the Game</th>
            <th width="150">Game publisher</th>
            <th width="150">Price of the Game</th>
            <th width="150">Edit information</th>
            <th width="150">Delete information</th>
        </tr>
        <c:forEach items="${listGames}" var="game">
            <tr>
                <td>${game.id}</td>
                <td><a href="/gamedata/${game.id}" target="_blank">${game.gameName}</a></td>
                <td>${game.gamePublisher}</td>
                <td>${game.gamePrice/100}${game.gamePrice%100}</td>
                <td><a href="<c:url value='/edit/${game.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${game.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


<h1 align="center">Add a Game</h1>

<c:url var="addAction" value="/games/add"/>
<div>
<form:form action="${addAction}" modelAttribute="game" id="form1" >
    <fieldset style="border: #96cdbe ridge thick;">
        <legend id="legendForm1" class="tg" align="center">Enter data into the database</legend>
            <table align="center">
                <c:if test="${!empty game.gameName}">
                    <tr>
                        <td>
                            <form:label path="id">
                                <spring:message text="ID"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="id" readonly="true" size="8" disabled="true"/>
                            <form:hidden path="id"/>
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td>
                        <form:label path="gameName">
                            <spring:message text="Name"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="gameName" required="true" autocomplete="off"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="gamePublisher">
                            <spring:message text="Publisher"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="gamePublisher" required="true" autocomplete="off"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="gamePrice">
                            <spring:message text="Price"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="gamePrice" pattern="[^0\D]\d*" autocomplete="off" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="reset" class="width" value="Reset"/>
                    </td>
                </tr>
                <br/>
                <br/>
                <tr>
                    <td colspan="2" width="50">
                        <c:if test="${!empty game.gameName}">
                            <input class="width" type="submit"
                                   value="<spring:message text="Edit Book"/>"/>
                        </c:if>
                        <c:if test="${empty game.gameName}">
                            <input class="width" type="submit"
                                   value="<spring:message text="Add Book"/>"/>
                        </c:if>
                    </td>
                </tr>
            </table>
    </fieldset>
</form:form>
</div>
</body>
</html>
