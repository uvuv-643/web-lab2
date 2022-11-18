package custom;

public class Dot {
    private final double x;
    private final double y;
    private final double r;
    private final boolean answer;

    public Dot(double x, double y, double r, boolean answer) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.answer = answer;
    }

    public boolean isAnswer() {
        return answer;
    }

    public double getY() {
        return y;
    }

    public double getX() {
        return x;
    }
    public double getR() {
        return r;
    }
}
