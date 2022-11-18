package exceptions;

import enums.DataErrorTexts;
import enums.DataFields;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class DataException extends Exception {
    private final List<DataFields> wrongFields;
    private final String message;
    public DataException(DataErrorTexts error, List<DataFields> wrongFields) {
        switch (error) {
            case INCORRECT_FORMAT:
                this.message = "Должно быть введено число";
                break;
            case INCORRECT_VALUE:
                this.message = "Число должно быть из указанного диапазона";
                break;
            case OUT_OF_RANGE:
                this.message = "Введено число вне указанного диапазона";
                break;
            default:
                this.message = "Неопознанная ошибка";
        }
        this.wrongFields = wrongFields;
    }
    public List<DataFields> getWrongFields() {
        return this.wrongFields;
    }
    public String getMessage() {
        return this.message;
    }
}
