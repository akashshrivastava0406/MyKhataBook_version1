import 'package:mykhata/core/data/datasources/khata_local_data_source.dart';
import 'package:mykhata/core/data/models/customer_model.dart';
import 'package:mykhata/core/domain/entities/customer_info.dart';
import 'package:mykhata/core/domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository
{
  final KhataLocalDataSource localDataSource;
  CustomerRepositoryImpl({this.localDataSource});
  @override
  Future<Customer> addCustomer(Customer customer) {
    print('in repo');

    return localDataSource.createCustomer(CustomerModel.fromCustomer(customer)).then((value) => value.toEntity());

  }

  @override
  Future<List<Customer>> getAllCustomers()  {
    return localDataSource.listCustomersInDb().then((value) => value.map((e) => e.toEntity()).toList());

  }
  
}