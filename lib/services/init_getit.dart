import 'package:get_it/get_it.dart';
import 'package:mvvm/services/api_service.dart';
import 'package:mvvm/services/navigation_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}
