
import 'package:get_it/get_it.dart';

import 'features/Notification/controller/notification_cubit.dart';
import 'features/bank_screen/controller/bank.dart';
import 'features/home/controller/home_controller.dart';
import 'features/profile/controller/profile_controller.dart';

final locator = GetIt.instance;
final getIt = locator();

setUpInitializeApp() async {
  ///Cache data

  locator.registerLazySingleton<ProfileCubit>(
      () => ProfileCubit( ));
  locator.registerLazySingleton<HomeController>(
      () => HomeController( ));
  locator.registerLazySingleton<NotificationCubit>(
      () => NotificationCubit( ));

  locator.registerLazySingleton<BankCubit>(
      () => BankCubit( ));

}
