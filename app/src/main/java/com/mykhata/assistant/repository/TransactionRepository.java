package com.mykhata.assistant.repository;

import android.app.Application;

import androidx.lifecycle.LiveData;

import com.mykhata.assistant.dao.CustomerDAO;
import com.mykhata.assistant.dao.KhataTransactionDAO;
import com.mykhata.assistant.database.KhataDatabase;
import com.mykhata.assistant.entity.Customer;
import com.mykhata.assistant.entity.KhataTransactions;

import java.util.List;

public class TransactionRepository {

    private KhataTransactionDAO khataTransactionDAO;
    private CustomerDAO customerDAO;
    private LiveData<List<KhataTransactions>> khataTransactions;
    public TransactionRepository(Application application)
    {
        KhataDatabase db = KhataDatabase.getDatabase(application);
        customerDAO =  db.customerDAO();
        khataTransactionDAO = db.khataTransactionDAO();


    }

    public void logTransaction(KhataTransactions khataTransaction)
    {
        KhataDatabase.databaseWriteExecutor.execute(
                () ->{

                    Customer customer = customerDAO.getCustomer(khataTransaction.getCustomerId());
                    customer.setTotalAmount(customer.getTotalAmount()+khataTransaction.getAmount());
                    khataTransactionDAO.insert(khataTransaction);
                    customerDAO.updateCustomer(customer);

                }
        );


    }
}
