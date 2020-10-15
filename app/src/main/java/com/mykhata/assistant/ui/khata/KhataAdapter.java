package com.mykhata.assistant.ui.khata;

import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.recyclerview.widget.RecyclerView;

import com.mykhata.assistant.R;
import com.mykhata.assistant.entity.Customer;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;


@NoArgsConstructor
public class KhataAdapter extends RecyclerView.Adapter<KhataAdapter.KhataViewHolder> {

    private List<Customer> customers;



    @NonNull
    @Override
    public KhataViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
        View view = layoutInflater.inflate(R.layout.khata_element, parent, false);
        return new KhataViewHolder(view);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    public void onBindViewHolder(@NonNull KhataViewHolder holder, int position) {
        holder.getName().setText(customers.get(position).getCustomerName());

        if(customers.get(position).getNextPaymentDate() == null) {
            holder.getAmountDue().setText(" you will get " + customers.get(position).getTotalAmount() + "");

        }
        else
        {
            holder.getAmountDue().setText("on " + customers.get(position).getNextPaymentDate() + " you will get " + customers.get(position).getAmountDue() + "");
        }
        holder.getTotalAmount().setText(customers.get(position).getTotalAmount()+"");


    }


    @Override
    public int getItemCount() {
        if(customers == null)
        {
            return 0;
        }
        return customers.size();
    }

    public void setCustomers(List<Customer> customers) {
        this.customers = customers;
        notifyDataSetChanged();
    }

    public class KhataViewHolder extends RecyclerView.ViewHolder{
        @Getter
        TextView name, totalAmount, amountDue;

        public KhataViewHolder(@NonNull View itemView) {
            super(itemView);
            name  = itemView.findViewById(R.id.name);
            totalAmount = itemView.findViewById(R.id.totalAmount);
            amountDue = itemView.findViewById(R.id.amountDue);
        }
    }
}
