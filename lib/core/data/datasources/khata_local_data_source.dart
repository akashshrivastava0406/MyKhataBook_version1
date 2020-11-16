import 'package:hive/hive.dart';
import 'package:mykhata/core/data/models/customer_model.dart';
import 'package:mykhata/core/domain/entities/customer_info.dart';

abstract class KhataLocalDataSource
{
  Future <CustomerModel> createCustomer(CustomerModel customer);
  Future<Iterable<CustomerModel>> listCustomersInDb();

}

class KhataLocalDataSourceImpl implements KhataLocalDataSource
{

  KhataLocalDataSourceImpl();
  @override
  Future<CustomerModel> createCustomer(CustomerModel customer) async {

    var customerId = await _addCustomerInDb(customer);

    return customer;

}

  Future<int> _addCustomerInDb(CustomerModel customer) async
  {
    final box = await Hive.openBox<CustomerModel>('customer');
      return  box.add(customer);
  }
  @override
  Future<Iterable<CustomerModel>> listCustomersInDb() async
  {
final box = await Hive.openBox<CustomerModel>('customer');
return box.values;

}
}