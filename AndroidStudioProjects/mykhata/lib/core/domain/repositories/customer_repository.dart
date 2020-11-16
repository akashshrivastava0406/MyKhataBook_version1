
import 'package:mykhata/core/domain/entities/customer_info.dart';

abstract class CustomerRepository{

  Future<List<Customer>> getAllCustomers();
  Future<Customer> addCustomer(Customer customer);



}