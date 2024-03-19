import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskui/core/bases/app_base.dart';
import 'package:taskui/core/bases/base_cubit.dart';
import 'package:taskui/routes/paths.dart';

import '../../common/AppImages.dart';
import '../../common/app_style.dart';
import '../../core/bases/base_state/base_cubit_state.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_body.dart';
import '../../widgets/custom_image.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/notification_cubit.dart';
class NotificationScreen extends AppBase<NotificationCubit> {
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, BaseState>(
      bloc: cubit,
      listener: (context, state) {  },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: CustomBody(
            isCentered:   false,
            appBar: CustomAppBar(
              title: ' ',
              regularAppBar: false,
              showBackButton: true,

              noActions: true,
            ),
            body: buildBody(state,context,cubit ),
          ),
        );
      },
    );
  }

}
Widget buildBody(BaseState state, context, NotificationCubit cubit) {
  return  Padding(
    padding: EdgeInsets.only(left: 5,right: 5, ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row( mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Notification',
              style: K.boldBlackTextStyle(context), ),
          ],
        ),


K.sizedBoxH1,
K.sizedBoxH1,
        ...List.generate(
          cubit.images.length,
              (index) => SettingListTile(
            title: Text('cubit.labels[index]'),
            icon:  Image.asset(
              cubit.images[index],
              height: 70.h,
              width: 70.w,
            ),

            onTap: () async {

              Navigator.pushNamed(context, AppPaths.bankScreen);
            },
            trailingOnTap: () {   },
          ),
        ),

      ],





    ),
  );
}

class SettingListTile extends StatelessWidget {
  Widget? icon;
  Widget title;
  bool? noBackArrow;
  Function()? trailingOnTap;
  void Function()? onTap;

  SettingListTile(
      {Key? key,
        this.icon,
        required this.title,
        this.noBackArrow,
        this.onTap,
        this.trailingOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(padding: const EdgeInsets.only(bottom: 20.0),
          decoration:   BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.5))),
          ),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon!,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      'This is how you set your foot for 2020 Stock market recession. What’s next...',
                      style: K.hintSmallTextStyle(context),
                    ),
                  ],
                ),
              ),
              // Image.asset(
             Text('3min ago')
              //   width: 100.w,
              //   height: 75.h,
              //   fit: BoxFit.contain,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}