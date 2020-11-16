part of 'khata_bloc.dart';

@immutable
abstract class KhataState extends Equatable {

}

class KhataInitial extends KhataState {

  @override
  List<Object> get props => [];
}
class LoadingState extends KhataState {

  @override
  List<Object> get props => [];
}
class ShowDashboardState extends KhataState {
  @override
  List<Object> get props => [];
}
class ShowKhataState extends KhataState {
  List<Customer> customers;
  @override
  List<Object> get props => [customers];
}
class ShowKhataSearchState extends KhataState {
  List<Customer> customers;
  @override
  List<Object> get props => [customers];
}