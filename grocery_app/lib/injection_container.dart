
import 'package:get_it/get_it.dart';
import 'package:grocery_app/features/Grosary/Data/DataSource/remote_data_source.dart';
import 'package:grocery_app/features/Grosary/Data/Repository/repository_impl.dart';
import 'package:grocery_app/features/Grosary/Domein/Repository/grocery_repositar.dart';
import 'package:grocery_app/features/Grosary/Domein/useCase/getAll.dart';
import 'package:grocery_app/features/Grosary/Presentation/bloc/grocery_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;
Future<void> init() async {


  sl.registerFactory(() => GroceryBloc(
       getAllGroceryUsecase: sl()
      ));

  sl.registerFactory(() => GetAllGroceryUsecase(groceryRepository: sl()));

  //

  // repository
  sl.registerLazySingleton<GroceryRepository>(
      () => GroceryRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<GroceryRemoteDataSource>(() => GroceryRemoteDataSourceImpl(
      client: sl(),));



  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
