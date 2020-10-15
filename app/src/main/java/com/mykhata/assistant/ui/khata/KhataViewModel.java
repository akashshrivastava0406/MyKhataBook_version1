package com.mykhata.assistant.ui.khata;

import android.app.Application;

import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;


import com.mykhata.assistant.entity.Customer;
import com.mykhata.assistant.entity.KhataTransactions;
import com.mykhata.assistant.repository.CustomerRespository;
import com.mykhata.assistant.repository.TransactionRepository;

import java.time.LocalDate;
import java.util.List;

public class KhataViewModel extends AndroidViewModel {

    private LiveData<List<Customer>> customers;
    private CustomerRespository customerRespository;

    public KhataViewModel(Application application) {
        super(application);
        customerRespository = new CustomerRespository(application);
        customers = customerRespository.getCustomers();

        TransactionRepository transactionRepository = new TransactionRepository(application);
        KhataTransactions khataTransactions = new KhataTransactions(1, LocalDate.now(),20);
        transactionRepository.logTransaction(khataTransactions);
    }

    public LiveData<List<Customer>> getCustomers() {
        return customers;
    }
}