
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';
import 'package:taskui/routes/routs_page.dart';



class UiTaskApp extends StatelessWidget {
  const UiTaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      minTextAdapt: true,
      designSize: Size(375, 812),
    );
    return  MaterialApp(
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      initialRoute: AppRouteManger.initial,
      onGenerateRoute: AppRouteManger.onGenerateRoutes,
    );
  }
}
