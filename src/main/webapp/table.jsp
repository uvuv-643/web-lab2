<%@ page import="custom.TableData" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  @SuppressWarnings("unchecked")
  List<TableData> objects = (List<TableData>)request.getSession().getAttribute("tableData");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Лаба 2</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/table.css">
  <link rel="stylesheet" href="assets/css/interactive.css">

</head>
<body>

  <div id="root">

    <table id="main-table">
      <thead style="font-family: monospace">
      <tr>
        <th>
          <div>Лабораторная работа #2</div>
        </th>
        <th>
          <div>ФИО <span>Зинатулин Артём Витальевич</span></div>
        </th>
        <th>
          <div>Группа <span>P32121</span></div>
        </th>
        <th>
          <div>Вариант <span>212125</span></div>
        </th>
      </tr>
      </thead>
      <tbody>
      <tr class="task-input-bottom">
        <td colspan="4">
          <h1>Проверить, попадает ли точка в заданную область</h1>
        </td>
      </tr>
      <tr class="task-input-bottom">
        <td colspan="2">
          <div class="_buttons-container">
            <a href="./index.jsp" class="_button"><img src="./assets/icons/back.svg" alt="<-"> Назад</a>
            <div>
              <form action="./ControllerServlet" method="GET">
                <input type="hidden" value="true" id="clear" name="clear">
                <button class="_button">Очистить</button>
              </form>
            </div>
          </div>
        </td>
        <td colspan="2">
          <div class="task-image">
            <div class="task-image--wrapper" style="width: 300px; height: 300px">

              <% if (objects != null) { %>
                <% for (TableData point : objects) { %>
                  <div
                    class="task-image--dot <%= point.isAnswer() ? "_active" : "_inactive" %>"
                    data-x="<%= point.getX() %>"
                    data-y="<%= point.getY() %>"
                    data-r="<%= point.getRadius() %>"
                  ></div>
                <% } %>
              <% } %>

              <div class="task-image__line task-image__line--x">
                <div class="task-image__line__mark task-image__line__mark--top"></div>
                <div class="task-image__line__mark task-image__line__mark--bottom"></div>
                <div class="task-image__line__mark task-image__line__mark--htop"></div>
                <div class="task-image__line__mark task-image__line__mark--hbottom"></div>
              </div>
              <div class="task-image__line task-image__line--y">
                <div class="task-image__line__mark task-image__line__mark--top"></div>
                <div class="task-image__line__mark task-image__line__mark--bottom"></div>
                <div class="task-image__line__mark task-image__line__mark--htop"></div>
                <div class="task-image__line__mark task-image__line__mark--hbottom"></div>
              </div>

              <div class="task-image__quadrant task-image__quadrant--first"></div>
              <div class="task-image__quadrant task-image__quadrant--second">
                <div class="task-image__quadrant__figure"></div>
              </div>
              <div class="task-image__quadrant task-image__quadrant--third">
                <div class="task-image__quadrant__figure"></div>
              </div>
              <div class="task-image__quadrant task-image__quadrant--fourth">
                <div class="task-image__quadrant__figure"></div>
              </div>

            </div>
          </div>
        </td>
      </tr>
      <tr>

      </tbody>
    </table>

    <table id="result-table">
      <thead>
        <th>№</th>
        <th>X</th>
        <th>Y</th>
        <th>R</th>
        <th>Результат</th>
        <th>Время начала</th>
        <th>Время обработки</th>
      </thead>
      <tbody>

        <% if (objects != null) { %>
          <% for (TableData object : objects) { %>
            <tr>
              <td>1</td>
              <td data-param="x">
                <%= object.getX() %>
              </td>
              <td data-param="y">
                <%= object.getY() %>
              </td>
              <td data-param="r">
                <%= object.getRadius() %>
              </td>
              <td data-param="answer">
                <%= object.isAnswer() ? "попал" : "не попал" %>
              </td>
              <td data-param="startTime">
                <%= new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(object.getStartTime()) %>
              </td>
              <td data-param="execTime">
                <%= object.getExecutionTime() %> мс
              </td>
            </tr>
          <% } %>
        <% } %>

      </tbody>
    </table>
  </div>

  <script src="assets/js/main.js"></script>
</body>
</html>
