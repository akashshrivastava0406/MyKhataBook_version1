import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mykhata/core/domain/entities/customer_info.dart';
import 'package:mykhata/core/domain/usecases/create_new_customer.dart';
import 'package:mykhata/core/domain/usecases/get_cutomers.dart';
import 'package:mykhata/core/utils/customer_input_convertor.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CreateCustomer createCustomerUC;
  final GetCustomers getCustomersUC;
  final CustomerInputConverter customerInputConverter;
  CustomerBloc({this.createCustomerUC,this.getCustomersUC , this.customerInputConverter})
      : super(AddNewCustomerInitial());

  @override
  void onTransition(Transition<CustomerEvent, CustomerState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<CustomerState> mapEventToState(
    CustomerEvent event,
  ) async* {
    if (event is CreateCustomerEvent) {
      yield AddNewCustomerLoading();
      print("loading");
      final customerEither =
          customerInputConverter.stringToCustomer(event.customerName);
      print("converting");
      yield* customerEither.fold((failure) => null, (customer) async* {
        yield AddNewCustomerLoading();
        final failureOrCreated = await createCustomerUC(customer);
        print("almost done");
        yield* _eitherFailedorCreated(failureOrCreated);
      });
    } else if (event is CustomerQueryEvent) {
      yield AddNewCustomerLoading();
      final failureOrCreated = getCustomersUC.queryCustomer(event.query);
      yield* _eitherFailedorRetrieved(failureOrCreated);
    }



  }
  Stream<CustomerState> _eitherFailedorRetrieved(Future<List<Customer>> customers) async*
  {

    yield CustomerQuery()..customers = await customers;

  }

  Stream<CustomerState> _eitherFailedorCreated(
      Customer failureOrCreated) async* {
    print("created");

    yield CustomerCreated();
  }
}
