package com.mykhata.assistant.dto.Enum;

public enum FrequencyType {
    MONTHLY("M"),
    WEEKLY("W"),
    DAILY("D");
    private String value;

    FrequencyType(String value)
    {
        this.value = value;
    }

    @Override
    public String toString() {
        return String.valueOf(value);
    }
}
