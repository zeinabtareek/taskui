
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskui/routes/paths.dart';
import '../../../common/AppImages.dart';
import 'dart:math' as math;

import '../common/app_style.dart';
import '../common/text_style.dart';
import '../core/utils/dimensions.dart'; // import this

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? showBackButton;
  final Function()? onBackPressed;
  final VoidCallback? onTap;
  final bool regularAppBar;
  final bool? noActions;
  final bool centerTitle;
  final double? height;
  final void Function()? toggleDrawer;
  String? savedLocaleString;

  CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton,
    this.onBackPressed,
    this.onTap,
    this.height,
    this.regularAppBar = false,
    this.noActions,
    this.centerTitle = true,
    this.toggleDrawer,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions.getInstance(context);

    return Container(
      padding: EdgeInsets.only(top: 10.h),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: AppBar(
          title: Text(title,
              style: textSemiBold.copyWith(
                  fontSize: dimensions.fontSizeLarge,
                color: Colors.black
                   )),
          centerTitle: centerTitle,
          leading: showBackButton == false
              ? SizedBox()
              : GestureDetector(
            onTap: () => onBackPressed != null
                ? onBackPressed!()
                : Navigator.pop(context),
            child:Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black,size: 20,)
          ),
          actions: noActions == true
              ? []
              : [
            InkWell(
              child: Icon(
                Icons.notifications_none,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onTap: (){

                  Navigator.pushNamed(context, AppPaths.notificationScreen);
              },
            ),
            K.sizedBoxW0,
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: GestureDetector(
                onTap: () {  },
                child:Icon(Icons.menu)
              ),
            ),
            K.sizedBoxW0,
          ],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(100.w, 50.h);
}