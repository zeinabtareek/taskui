import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskui/core/bases/base_cubit.dart';
import 'package:taskui/core/bases/base_state/base_cubit_state.dart';

import '../../../common/AppImages.dart';
import '../../../common/app_style.dart';
import '../../Home_Screen/home_screen.dart';
import '../../profile/profile_screen.dart';


class HomeController extends BaseCubit {
   // get cIndex=>currentIndex.value;
    int currentIndex = 0;
  changeTabIndex(int index, BuildContext context) {
    currentIndex = index;
    emit(BaseCompletedState(data: currentIndex));
   }
  final bottomList = [

    BottomNavigationBarItem(
      icon: Image.asset(
        Images.home,
        height: 30.h,
      ),
      label: 'Home',
      activeIcon: Image.asset(
        Images.home,
        height: 30.h,
        color: K.gradientLightGreenColor,
      ),
    ),   BottomNavigationBarItem(
      icon: Image.asset(
        Images.search,
        height: 30.h,
      ),
      label: 'Product',
      activeIcon: Image.asset(
        Images.search,
        height: 30.h,
        color: K.gradientLightGreenColor,
      ),
    ),   BottomNavigationBarItem(
      icon: Image.asset(
        Images.transaction,
        height: 30.h,
      ),
      label: 'Transactions',
      activeIcon: Image.asset(
        Images.transaction,
        height: 30.h,
        color: K.gradientLightGreenColor,
      ),
    ), BottomNavigationBarItem(
      icon: Image.asset(
        Images.profile,
        height: 30.h,
      ),
      label: 'Account',
      activeIcon: Image.asset(
        Images.profile,
        height: 30.h,
        color: K.gradientLightGreenColor,
      ),
    ),

  ];
  final List bodyScreens = [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ProfileScreen(),
  ];

  @override
  // TODO: implement data
  get data => BaseCompletedState(data: currentIndex).data;

  @override
  FutureOr<void> init() {
  }
}
