import 'package:hive/hive.dart';
import 'package:mykhata/core/domain/entities/customer_info.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 0)
class CustomerModel
{
  @HiveField(0)
  String name;


  @HiveField(2)
  String address;

  @HiveField(3)
  String phoneNo;

  @HiveField(4)
  String totalBalance;

  @HiveField(5)
  DateTime nextPaymentDate;
  CustomerModel();

  CustomerModel.fromCustomer(Customer customer){
    this.name = customer.firstName;
  }

  Customer toEntity()
  {
     final customer = Customer();
     customer.firstName = this.name;
    return customer;
  }
}