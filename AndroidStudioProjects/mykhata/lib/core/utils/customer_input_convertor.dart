import 'package:dartz/dartz.dart';
import 'package:mykhata/core/domain/entities/customer_info.dart';
import 'package:mykhata/core/error/failure.dart';

class CustomerInputConverter {
  Either<Failure, Customer> stringToCustomer(String customerName) {
    final customer = Customer();

    if (customerName.length > 0) {
      customer.firstName = customerName;
    } else {
      return Left(InvalidCustomer('CustomerName'));
    }
    return Right(customer);
  }
}

class InvalidCustomer extends Failure {
  final String fieldName;
  InvalidCustomer(this.fieldName);
}
