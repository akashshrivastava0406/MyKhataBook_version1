package com.mykhata.assistant.dto.implementation;

import com.mykhata.assistant.dto.Interface.IChargeDTO;

public class KhataChargeDTO extends IChargeDTO {
    @Override
    public double getDueAmount() {
        return amount;
    }
}
