import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mykhata/core/data/repositories/customer_repository_impl.dart';
import 'package:mykhata/core/domain/repositories/customer_repository.dart';
import 'package:mykhata/core/domain/usecases/create_new_customer.dart';
import 'package:mykhata/core/domain/usecases/get_cutomers.dart';
import 'package:mykhata/features/addcustomer/presentation/bloc/customer_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mykhata/features/dashboard/presentation/bloc/khata_bloc.dart';

import 'core/data/datasources/khata_local_data_source.dart';
import 'core/utils/customer_input_convertor.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
        () => CustomerBloc(
          createCustomerUC: sl(),
          getCustomersUC: sl(),
          customerInputConverter: sl(),
    ),
  );
  sl.registerFactory(
        () => KhataBloc(
      getCustomersUC: sl(),

    ),
  );
  // Use cases
  sl.registerLazySingleton(() =>CreateCustomer(sl()));

  sl.registerLazySingleton(() =>GetCustomers(sl()));


  // Repository
  sl.registerLazySingleton< CustomerRepository>(
        () => CustomerRepositoryImpl(
      localDataSource: sl(),

    ),

  );

  // Data sources
  sl.registerLazySingleton<KhataLocalDataSource>(

        () => KhataLocalDataSourceImpl(),
  );

  sl.registerLazySingleton(() => CustomerInputConverter());

/*
  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
*/
}