package com.example.lab2.servlets;

import custom.MiniMath;
import custom.TableData;
import enums.DataErrorTexts;
import enums.DataFields;
import exceptions.DataException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


import java.io.IOException;
import java.util.*;

@WebServlet(name = "AreaCheckServlet", value = "/AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {

    private final List<Double> X_VALUES = Arrays.asList(-5.0, -4.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0);
    private final List<Double> Y_RANGE = Arrays.asList(-5.0, 3.0);
    private final List<Double> R_RANGE = Arrays.asList(2.0, 5.0);



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Date startTime = new Date();

        request.setAttribute("error", null);
        try {
            double x, y, r;
            String xRaw = request.getParameter("x");
            String yRaw = request.getParameter("y");
            String rRaw = request.getParameter("radius");
            String mode = request.getParameter("interactive");

            List<DataFields> notNumericFields = new ArrayList<>(Collections.emptyList());
            if (MiniMath.isNotNumeric(xRaw)) {
                notNumericFields.add(DataFields.X);
            }
            if (MiniMath.isNotNumeric(yRaw)) {
                notNumericFields.add(DataFields.Y);
            }
            if (MiniMath.isNotNumeric(rRaw)) {
                notNumericFields.add(DataFields.R);
            }

            if (!notNumericFields.isEmpty()) {
                throw new DataException(DataErrorTexts.INCORRECT_FORMAT, notNumericFields);
            } else {
                x = Double.parseDouble(xRaw);
                y = Double.parseDouble(yRaw);
                r = Double.parseDouble(rRaw);
            }

            if (!X_VALUES.contains(x) && Objects.equals(mode, "form")) {
                throw new DataException(DataErrorTexts.INCORRECT_VALUE, Collections.singletonList(DataFields.X));
            }
            if ((y < Y_RANGE.get(0) || y > Y_RANGE.get(1)) && Objects.equals(mode, "form")) {
                throw new DataException(DataErrorTexts.OUT_OF_RANGE, Collections.singletonList(DataFields.Y));
            }
            if ((r < R_RANGE.get(0) || r > R_RANGE.get(1)) && Objects.equals(mode, "form")) {
                throw new DataException(DataErrorTexts.OUT_OF_RANGE, Collections.singletonList(DataFields.R));
            }

            boolean answer = true;
            if (x > 0 && y > 0) {
                answer = false;
            } else if (x >= 0 && y <= 0) {
                answer = (y > 2 * x - r);
            } else if (x < 0 && y < 0) {
                answer = (y >= -Math.sqrt((r / 2) * (r / 2)  - x * x));
            } else if (x <= 0 && y >= 0) {
                answer = (x >= -r && y <= r / 2);
            }

            Date finishTime = new Date();
            long executionTime = finishTime.getTime() - startTime.getTime();

            @SuppressWarnings("unchecked")
            ArrayList<TableData> sessionData = (ArrayList<TableData>) session.getAttribute("tableData");
            if (sessionData == null) {
                sessionData = new ArrayList<>();
            }
            sessionData.add(new TableData(x, y, r, answer, startTime, executionTime));
            session.setAttribute("tableData", sessionData);
            request.getRequestDispatcher("/table.jsp").forward(request, response);

        } catch (DataException exception) {
            request.setAttribute("error", exception.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
