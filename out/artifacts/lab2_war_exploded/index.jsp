<%@ page import="java.util.List" %>
<%@ page import="custom.TableData" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

    <link rel="stylesheet" href="assets/css/global.css">
    <link rel="stylesheet" href="assets/css/interactive.css">

</head>
<body>

<div id="root">

    <form action="./ControllerServlet" method="GET" id="check-point-in-area">
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
                        <input type="hidden" id="interactive" name="interactive" value="form">
                    </td>
                </tr>
                <tr class="task-input-bottom">
                    <td colspan="2">
                        <div class="task-image">
                            <div class="task-image--wrapper">

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
                    <td colspan="1" class="task-input task-controls">
                        <div class="task-input task-input--buttons" data-trigger="input-buttons" >
                            <label>Выберите X</label>
                            <button type="button" data-value="-5" class="task-input__button--x _button">-5</button>
                            <button type="button" data-value="-4" class="task-input__button--x _button">-4</button>
                            <button type="button" data-value="-3" class="task-input__button--x _button">-3</button>
                            <button type="button" data-value="-2" class="task-input__button--x _button">-2</button>
                            <button type="button" data-value="-1" class="task-input__button--x _button">-1</button>
                            <button type="button" data-value="0" class="task-input__button--x _button">0</button>
                            <button type="button" data-value="1" class="task-input__button--x _button">1</button>
                            <button type="button" data-value="2" class="task-input__button--x _button">2</button>
                            <button type="button" data-value="3" class="task-input__button--x _button">3</button>
                            <input type="hidden" name="x" id="x" />
                            <div class="x-error _error">Выберите что-то из списка</div>
                       </div>
                        <div class="task-input">
                            <label for="y">Введите Y [-5, 3]</label>
                            <input type="text" name="y" id="y" placeholder="Введите Y" class="_input" maxlength="10"/>
                            <div class="y-error _error">Ошибка</div>
                        </div>
                        <div class="task-input">
                            <label for="radius">Введите радиус [2, 5]</label>
                            <input type="text" name="radius" id="radius" placeholder="Введите радиус" maxlength="10" class="_input"/>
                            <div class="r-error _error">Ошибка</div>
                        </div>
                        <div class="task-input">
                            <button type="submit" class="task-input__button--submit _button">Проверить</button>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/interactive.js"></script>

</body>
</html>