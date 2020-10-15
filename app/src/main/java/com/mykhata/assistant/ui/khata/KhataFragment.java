package com.mykhata.assistant.ui.khata;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.mykhata.assistant.R;
import com.mykhata.assistant.entity.Customer;
import com.mykhata.assistant.repository.TransactionRepository;

import java.util.List;

public class KhataFragment extends Fragment {

    private KhataViewModel khataViewModel;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        KhataAdapter khataAdapter = new KhataAdapter();
        khataViewModel =
                ViewModelProviders.of(this).get(KhataViewModel.class);

        View root = inflater.inflate(R.layout.fragment_khata, container, false);
        final RecyclerView recyclerView = root.findViewById(R.id.my_recycler_view);

        recyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));

        recyclerView.setAdapter(khataAdapter);

        khataViewModel.getCustomers().observe(getViewLifecycleOwner(), new Observer<List<Customer>>() {
            @Override
            public void onChanged(List<Customer> customers) {

                khataAdapter.setCustomers(customers);
            }
        });

/*
        khataViewModel.getCustomers().observe(getViewLifecycleOwner(), new Observer<Customer>() {
            @Override
            public void onChanged(@Nullable Customer customer) {

            }
        });

        khataViewModel.getText().observe(getViewLifecycleOwner(), new Observer<String>() {
            @Override
            public void onChanged(@Nullable String s) {
                textView.setText(s);
            }
        });
*/
        return root;
    }
}