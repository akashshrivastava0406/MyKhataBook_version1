part of 'customer_bloc.dart';

@immutable
abstract class CustomerState {}

class AddNewCustomerInitial extends CustomerState {}

class AddNewCustomerLoading extends CustomerState{}

class CustomerCreated extends CustomerState{}
class CustomerQuery extends CustomerState{
  List<Customer> customers;
}