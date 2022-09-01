package it.dping.cloudvendingmachines.service;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CustomFormatData {
    public static String[] mese = {"NULL","Gennaio", "Febbraio", "Marzo", "Aprile", "Maggio", "Giugno", "Luglio", "Agosto", "Settembre",
            "Ottobre", "Novembre", "Dicembre"};

    public String customFormat(double value ) {
        DecimalFormat myFormatter = new DecimalFormat("###,##0.00");
        String output = myFormatter.format(value);
        return output;
    }

    public static String patternCifre(double value ) {
        DecimalFormat myFormatter = new DecimalFormat("###,###.00");
        String output = myFormatter.format(value);
        return output;
    }

    public static String dateF(){
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();

        return null;
    }

    public static String toCamelCaseWord(String s ) {

        String str = s.toLowerCase();
        String firstLtr = str.substring(0, 1);
        String restLtrs = str.substring(1, str.length());
        firstLtr = firstLtr.toUpperCase();
        str = firstLtr + restLtrs;
        return str;
    }

    public static int intMese(String mese ) {
        int month = 1;
        switch (mese){
            case "GENNAIO": month = 1;
                break;
            case "FEBBRAIO": month = 2;
                break;
            case "MARZO":  month = 3;
                break;
            case "APRILE":  month = 4;
                break;
            case "MAGGIO":  month = 5;
                break;
            case "GIUGNO":  month = 6;
                break;
            case "LUGLIO":  month = 7;
                break;
            case "AGOSTO":  month = 8;
                break;
            case "SETTEMBRE": month = 9;
                break;
            case "OTTOBRE": month = 10;
                break;
            case "NOVEMBRE": month = 11;
                break;
            case "DICEMBRE":  month = 12;
                break;
            default: month = 1;
                break;
        }

        return month;
    }

}
