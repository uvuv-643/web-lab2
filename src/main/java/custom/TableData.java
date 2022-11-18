package custom;

import java.util.Date;

public class TableData {
    private final double x;
    private final double y;
    private final double radius;
    private final boolean answer;
    private final Date startTime;
    private final long executionTime;

    public TableData(double x, double y, double radius, boolean answer, Date startTime, long executionTime) {
        this.x = x;
        this.y = y;
        this.radius = radius;
        this.answer = answer;
        this.startTime = startTime;
        this.executionTime = executionTime;
    }

    public long getExecutionTime() {
        return executionTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public boolean isAnswer() {
        return answer;
    }

    public double getRadius() {
        return radius;
    }

    public double getY() {
        return y;
    }

    public double getX() {
        return x;
    }
}
