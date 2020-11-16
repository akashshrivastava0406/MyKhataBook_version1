import 'package:mykhata/core/domain/entities/customer_info.dart';
import 'package:mykhata/core/domain/repositories/customer_repository.dart';

class GetCustomers
{
  final CustomerRepository customerRepository;

  GetCustomers(this.customerRepository);
  Future<List<Customer>> call() async
  {
    return await customerRepository.getAllCustomers();
  }

  Future<List<Customer>> queryCustomer(String query) async
  {
    return await customerRepository.getAllCustomers().then((value) => value..retainWhere((element) => element.firstName.contains(query)));
  }

}