package com.mykhata.assistant.entity;

import android.os.Build;

import androidx.annotation.RequiresApi;
import androidx.room.TypeConverter;

import com.mykhata.assistant.dto.Enum.FrequencyType;

import java.time.LocalDate;

public class Convertor {

    @RequiresApi(api = Build.VERSION_CODES.O)
    @TypeConverter
    public static LocalDate stringtoDate(String date)
    {
        if(date == null)
        {
            return null;
        }
        else
        {
            return LocalDate.parse(date);
        }
    }
    @TypeConverter
    public static String datetoString(LocalDate date)
    {
        if (date == null)
        {
            return null;
        }
        else
        {
            return date.toString();
        }
    }

    @TypeConverter
    public static FrequencyType stringToFrequencyType(String frequencyType)
    {
        if(frequencyType == null)
        {
            return null;
        }
        else
        {
            return FrequencyType.valueOf(frequencyType);
        }
    }
    @TypeConverter
    public static String frequencyTypeToString(FrequencyType frequencyType)
    {
        if(frequencyType == null)
        {
            return null;
        }
        else
        {
            return frequencyType.toString();
        }
    }

}
