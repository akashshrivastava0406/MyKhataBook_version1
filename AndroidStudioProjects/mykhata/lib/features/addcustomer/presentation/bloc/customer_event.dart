part of 'customer_bloc.dart';

@immutable
abstract class CustomerEvent extends Equatable{
  List<Object> get props => [];
}

class CreateCustomerEvent extends CustomerEvent{
  final String  customerName;
  CreateCustomerEvent(this.customerName);
  List<Object> get props => [customerName];

}
class CustomerQueryEvent extends CustomerEvent{
  final String query;
  CustomerQueryEvent(this.query);
  List<Object> get props => [query];

}