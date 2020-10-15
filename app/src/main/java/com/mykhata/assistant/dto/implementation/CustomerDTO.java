package com.mykhata.assistant.dto.implementation;

import com.mykhata.assistant.dto.Enum.FrequencyType;
import com.mykhata.assistant.dto.Interface.IChargeDTO;

import java.time.LocalDate;
import java.util.List;
import java.util.function.ToDoubleFunction;
import java.util.stream.Collectors;


import lombok.Data;

@Data
public class CustomerDTO {
    private int customerId;
    private String customerName;
   // private Long pendingAmount;
    private LocalDate nextPaymentDate;
    private FrequencyType frequencyType;
    private Short frequency;
    private List<IChargeDTO> charges;

    public double getSumOfDueAmount()
    {
        return sumOfCharges(IChargeDTO::getDueAmount);
    }
    public double getSumOfTotalAmount()
    {
        return sumOfCharges(IChargeDTO::getAmount);
    }


    private double sumOfCharges(ToDoubleFunction<IChargeDTO> func)
    {

        return  charges.stream().collect(Collectors.summingDouble(func));
    }
}
