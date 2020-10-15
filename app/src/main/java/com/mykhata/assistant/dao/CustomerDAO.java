package com.mykhata.assistant.dao;

import androidx.lifecycle.LiveData;
import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;

import com.mykhata.assistant.entity.Customer;

import java.util.List;

@Dao
public interface CustomerDAO {

    @Query("select * from customer")
    LiveData<List<Customer>> getallCustomers();


    @Query("select * from customer where customerId = :customerId")
    Customer getCustomer(int customerId);

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    void insert(Customer customer);

    @Update(onConflict = OnConflictStrategy.REPLACE)
    void updateCustomer(Customer customer);


}
