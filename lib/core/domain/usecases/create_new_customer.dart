import 'package:mykhata/core/domain/entities/customer_info.dart';
import 'package:mykhata/core/domain/repositories/customer_repository.dart';

class CreateCustomer
{
  final CustomerRepository customerRepository;

  CreateCustomer(this.customerRepository);

  Future<Customer> call(Customer customer) async
  {
    return await customerRepository.addCustomer(customer);
  }

}