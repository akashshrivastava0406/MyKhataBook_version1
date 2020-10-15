package com.mykhata.assistant.entity;

import androidx.room.Entity;
import androidx.room.PrimaryKey;
import androidx.room.TypeConverters;

import com.mykhata.assistant.dto.Enum.FrequencyType;

import java.time.LocalDate;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@RequiredArgsConstructor
@NoArgsConstructor
public class Customer {

    @PrimaryKey(autoGenerate = true)
    public int customerId;
    @NonNull
    public String customerName;
    public double amountDue;
    public double totalAmount;
    @TypeConverters(Convertor.class)
    public LocalDate nextPaymentDate;
    @TypeConverters(Convertor.class)
    public FrequencyType frequencyType;
    public Short frequency;



}
