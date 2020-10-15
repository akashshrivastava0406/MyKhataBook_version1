package com.mykhata.assistant.dto.implementation;

import com.mykhata.assistant.dto.Interface.IChargeDTO;

import lombok.Data;

@Data
public class InstalmentChargeDTO extends IChargeDTO {
    private Long pendingAmount;
    private Short numberOfInstallments;
    @Override
    public double getDueAmount() {
        double emiAmount = amount/numberOfInstallments;

        return emiAmount;
    }


}
