package com.mykhata.assistant.entity;

import androidx.room.Entity;
import androidx.room.PrimaryKey;
import androidx.room.TypeConverters;

import java.time.LocalDate;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@RequiredArgsConstructor
public class KhataTransactions {
    @PrimaryKey(autoGenerate = true)
    public int transactionId;
    @NonNull
    public int customerId;
    public String transactionType;
    @NonNull
    @TypeConverters(Convertor.class)
    public LocalDate purchaseDate;
    @TypeConverters(Convertor.class)
    public LocalDate amountDueDate;
    @NonNull
    public double amount;
    public double pendingAmount;
    public short numberOfInstallments;
}
