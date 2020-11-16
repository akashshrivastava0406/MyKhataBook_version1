import 'package:equatable/equatable.dart';
import './transaction_info.dart';

class Customer  extends Equatable
{

  String firstName;
  String lastName;
  String address;
  String phoneNo;
  String totalBalance;
  DateTime nextPaymentDate;
  List<Transaction> transactions;



  @override
  List<Object> get props => [firstName,lastName,phoneNo,address];

}