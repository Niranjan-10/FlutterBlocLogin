import 'package:firebase_login/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

void setUpLocator(){
  locator.registerLazySingleton(() => FirebaseAuthService());
}