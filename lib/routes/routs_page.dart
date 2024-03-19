import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskui/features/Home_Screen/home_screen.dart';
import 'package:taskui/features/Notification/controller/notification_cubit.dart';
import '../features/Authentication/sign_up/sign_up.dart';
import '../features/Notification/notification_screen.dart';
import '../features/assets_screen/assets_screen.dart';
import '../features/bank_screen/bank_screen.dart';
import '../features/bank_screen/controller/bank.dart';
import '../features/contact_us/contact.dart';
import '../features/home/controller/home_controller.dart';
import '../features/home/home.dart';
import '../features/on_boarding/on_boarding_screen.dart';
import '../features/splash_screen/splash_screen.dart';
import '../injection_container.dart';
import 'paths.dart';

class AppRouteManger {
  static String get initial {
    // if (!VerificationScreenCubit.isAuthed) {
    //   return AppPaths.loginWithPass;
    // } else {
      return AppPaths.splash;
      // return AppPaths.loadingScreen;
    // }
  }

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
  //     case AppPaths.loginWithPass:
  //       return _materialRoute(BlocProvider(
  //         create: (context) => LoginWithPassCubit(locator<AuthCases>()),
  //         child: SignInScreen(),
  //       ));
  //
      case AppPaths.signUp:
        return _materialRoute( SignUpScreen( ));

      case AppPaths.splash:
        return _materialRoute(SplashScreen());


 case AppPaths.contactInfoScreen:
        return _materialRoute(ContactInfoScreen());

  case AppPaths.onBoardingScreen:
        return _materialRoute(const OnBoardingScreen());



      case AppPaths.bankScreen:
        return _materialRoute(BlocProvider(
          create: (context) => BankCubit( ),
          child: BankScreen(),
        ));



        case AppPaths.homeScreen:
        return _materialRoute(BlocProvider(
          create: (context) => HomeController( ),
          child: HomeScreen(),
        ));

        case AppPaths.home:
        return _materialRoute(BlocProvider(
          create: (context) => HomeController( ),
          child: Home(),
        ));



        case AppPaths.notificationScreen:
        return _materialRoute(BlocProvider(
          create: (context) => NotificationCubit( ),
          child: NotificationScreen(),
        ));
      case AppPaths.assetsScreen: //phone

        return _materialRoute(
          // BlocProvider<VerificationScreenCubit>(
          //     create: (context) => VerificationScreenCubit(),
          //     child:
              AssetsScreen()
              // ),
              // ),
        );
  //     case AppPaths.loadingScreen:
  //       return _materialRoute(
  //         const LoadingScreen(),
  //       );
  //
  //     case AppPaths.verificationScreen:
  //       var args = (settings.arguments ?? {}) as Map<String, dynamic>;
  //
  //       return _materialRoute(BlocProvider(
  //         create: (context) => VerificationScreenCubit(),
  //         child: VerificationScreen(
  //             number: args["nums"],
  //             otpState: args["otpState"]),
  //       ));
      default:
        return _materialRoute(const Scaffold());
    }
  }
  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
