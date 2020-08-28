import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/encryption_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/services/storage_local_service.dart';
import 'package:get_it/get_it.dart';
import 'package:cwl/services/api_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => EncryptionService());
  locator.registerLazySingleton(() => StorageLocalService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => ApiService());
}
