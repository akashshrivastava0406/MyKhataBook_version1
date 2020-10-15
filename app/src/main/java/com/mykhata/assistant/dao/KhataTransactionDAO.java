package com.mykhata.assistant.dao;

import androidx.lifecycle.LiveData;
import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;

import com.mykhata.assistant.entity.Customer;
import com.mykhata.assistant.entity.KhataTransactions;

import java.util.List;

@Dao
public interface KhataTransactionDAO {

    @Query("select * from KhataTransactions")
    LiveData<List<KhataTransactions>> getAllTransactions();


    @Query("select * from KhataTransactions where customerId = :customerId")
    KhataTransactions getTransactionsForCustomer(int customerId);

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    void insert(KhataTransactions transaction);



}
