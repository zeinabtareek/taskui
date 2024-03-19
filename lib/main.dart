 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskui/ui_app.dart';
import 'helper/app_bloc_observer.dart';
import 'injection_container.dart';



main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await setUpInitializeApp();
  runApp(  const UiTaskApp()  );
}

