import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mykhata/core/domain/entities/customer_info.dart';
import 'package:mykhata/core/domain/usecases/get_cutomers.dart';

part 'khata_event.dart';
part 'khata_state.dart';

class KhataBloc extends Bloc<KhataEvent, KhataState> {
  final GetCustomers getCustomersUC;
  KhataBloc({this.getCustomersUC}) : super(KhataInitial());

  @override
  void onTransition(Transition<KhataEvent, KhataState> transition) {
    print(transition);
    super.onTransition(transition);
  }


    @override
  Stream<KhataState> mapEventToState(
    KhataEvent event,
  ) async* {
    if(event is ShowDashboardPage)
      {
        yield ShowDashboardState();
      }
    else if(event is ShowKhataPage)
      {
        yield LoadingState();
        Future<List<Customer>> customers = getCustomersUC();
        yield* _eitherFailedorCreated(customers);

      }
    else if(event is KhataSearchEvent)
      {
        yield LoadingState();
        Future<List<Customer>> customers = getCustomersUC();
        yield ShowKhataSearchState()..customers = await customers;

      }
    
  }
  Stream<KhataState> _eitherFailedorCreated(Future<List<Customer>> customers) async*
  {

      final showKhataState = ShowKhataState();
      showKhataState.customers = await customers;
      yield showKhataState;
    
  }
}
