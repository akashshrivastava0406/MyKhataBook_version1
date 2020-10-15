package com.mykhata.assistant.dto.Interface;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

public abstract class IChargeDTO {

    @Setter
    @Getter
    protected double amount;
    @Setter
    @Getter
    protected LocalDate purchaseDate;
    public abstract double getDueAmount();
    public  double totalAmount(){
        return amount;
    }
    public LocalDate getPurchaseDate()
    {
        return purchaseDate;
    }


}
