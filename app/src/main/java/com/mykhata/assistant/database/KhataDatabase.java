package com.mykhata.assistant.database;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;
import androidx.sqlite.db.SupportSQLiteDatabase;

import com.mykhata.assistant.dao.CustomerDAO;
import com.mykhata.assistant.dao.KhataTransactionDAO;
import com.mykhata.assistant.entity.Customer;
import com.mykhata.assistant.entity.KhataTransactions;
import com.mykhata.assistant.repository.TransactionRepository;

import java.time.LocalDate;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Database(entities = {Customer.class, KhataTransactions.class}, version = 1)
public abstract class KhataDatabase extends RoomDatabase {

    public abstract CustomerDAO customerDAO();
    public abstract KhataTransactionDAO khataTransactionDAO();
    private static volatile KhataDatabase INSTANCE;
    private static final int NUMBER_OF_THREADS = 4;

    public static final ExecutorService databaseWriteExecutor =
            Executors.newFixedThreadPool(NUMBER_OF_THREADS);

    private static RoomDatabase.Callback sRoomDatabaseCallback = new RoomDatabase.Callback() {
        @Override
        public void onOpen(@NonNull SupportSQLiteDatabase db) {
            super.onOpen(db);

            databaseWriteExecutor.execute(() -> {
                CustomerDAO customerDAO = INSTANCE.customerDAO();
                Customer customer = new Customer("Abhishek Kapoor");

                customerDAO.insert(customer);


            });

        }
    };


    public static KhataDatabase getDatabase(final Context context) {
        if (INSTANCE == null) {
            synchronized (KhataDatabase.class) {
                if (INSTANCE == null) {
                    INSTANCE = Room.databaseBuilder(context.getApplicationContext(),
                            KhataDatabase.class, "khata_database")
                            .addCallback(sRoomDatabaseCallback)
                            .build();
                }
            }
        }
        return INSTANCE;
    }

}
