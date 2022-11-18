package custom;

public class MiniMath {
    public static boolean isNumeric(String value) {
        try {
            Double.parseDouble(value);
            return true;
        } catch (NumberFormatException e){
            return false;
        } catch (NullPointerException e){
            return false;
        }
    }
    public static boolean isNotNumeric(String value) {
        return !MiniMath.isNumeric(value);
    }
}
