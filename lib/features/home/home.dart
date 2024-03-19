import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskui/core/bases/base_state/base_cubit_state.dart';
import 'package:taskui/injection_container.dart';
import '../../common/AppImages.dart';
import '../../common/app_style.dart';
import '../Home_Screen/home_screen.dart';
import 'controller/home_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  int? cIndex;

  Home({Key? key, this.cIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeController, BaseState>(
      bloc: locator<HomeController>(),
      builder: (context, state) {
        var controller = locator<HomeController>();
        return Scaffold(
          body: controller.bodyScreens.elementAt(controller.currentIndex),
          bottomNavigationBar: SizedBox(
            height: 80,

            child: BottomNavigationBar(
              unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
              selectedIconTheme: const IconThemeData(color: Colors.black),
              unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
              selectedLabelStyle: const TextStyle(color: Colors.black),
              fixedColor: K.gradientLightGreenColor,
              type: BottomNavigationBarType.fixed,
              onTap: (v) {
                controller.changeTabIndex(v, context);
              },
              currentIndex: controller.currentIndex,
              items: controller.bottomList,
            ),
          ),
        );
      },
    );
  }
}