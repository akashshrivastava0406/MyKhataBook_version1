package com.mykhata.assistant.repository;

import android.app.Application;

import androidx.lifecycle.LiveData;

import com.mykhata.assistant.dao.CustomerDAO;
import com.mykhata.assistant.database.KhataDatabase;
import com.mykhata.assistant.entity.Customer;

import java.util.List;

public class CustomerRespository {
    private CustomerDAO mCustomerDAO;
    private LiveData<List<Customer>> customers;
    public CustomerRespository(Application application)
    {
        KhataDatabase db = KhataDatabase.getDatabase(application);
        mCustomerDAO =  db.customerDAO();
        customers = mCustomerDAO.getallCustomers();
    }

    public LiveData<List<Customer>> getCustomers()
    {
        return customers;
    }
    void insert(Customer customer) {
/*      TODO

 */
        }

}
