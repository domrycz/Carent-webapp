package domain;

import java.time.format.DateTimeFormatter;

public class DateFormat {
    private static DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public static DateTimeFormatter getDateFormat() {
        return dtf;
    }
}
