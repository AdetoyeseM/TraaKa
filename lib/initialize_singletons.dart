import 'package:get_it/get_it.dart';
import 'package:traacka/view_models/auth/googleauth_viewmodel.dart';

GetIt locator = GetIt.instance;

initializeSingletons() {
  locator.registerLazySingleton(() => GoogleSignInViewModel());
}

GoogleSignInViewModel get $google => locator.get<GoogleSignInViewModel>();
