import 'package:get_it/get_it.dart';
import 'package:grocery/features/menu/data/data_source/product_remote_data_source.dart';
import 'package:grocery/features/menu/data/repository/product_repository_impl.dart';
import 'package:grocery/features/menu/domain/repository/product_repository.dart';
import 'package:grocery/features/menu/presentation/bloc/menu_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'features/menu/domain/usecase/get_menu_items_usecase.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
// Menu features

// bloc

  sl.registerFactory(() => MenuBloc(getMenuItems: sl()));

  // usecase
  sl.registerFactory(() => GetMenuItemsUsecase(productRepository: sl()));

  // repository

  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
        networkInfo: sl(),
        productRemoteDataSource: sl(),
      ));

  // data source
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: sl()));

  // core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl()),
  );

  // external
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
