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
import 'controller/profile_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class ProfileScreen extends AppBase<ProfileCubit> {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, BaseState>(
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
Widget buildBody(BaseState state, context, ProfileCubit cubit) {
  return  Padding(
    padding: EdgeInsets.only(left: 20,right: 20, ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row( mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: K.boldBlackTextStyle(context), ),
          ],
        ),
        const Center(
          child: SizedBox(
            width: 180,
            height: 180,
            child: CustomImage(
              radius: 100,
              svg: null,
              isAssets:false,fit: BoxFit.cover,
              image : 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZG9jdG9yfGVufDB8fDB8fHww'
              // 'https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg'
            ),
          ),
        ),
        Text(
          'Jonas Macroni',
          style: K.blackTextStyleLarge(context), ),
 Text(
          'Expert',
          style: K.blackBodyTextStyle(context), ),

        K.sizedBoxH1,


        ...List.generate(
          cubit.images.length,
              (index) => SettingListTile(
            title: Text(cubit.labels[index]),
            icon:  Image.asset(
              cubit.images[index],
                  height: 20.h,
                  width: 20.w,
            ),

            onTap: () async {

              Navigator.pushNamed(context, AppPaths.contactInfoScreen);
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: onTap,
        // onTap: onTap,
        child: Container(
          // elevation: 2,
          decoration: BoxDecoration(
            color:   Theme.of(context).cardColor.withOpacity(.97),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 5,
                blurRadius: 8,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(

            leading: icon != null ? icon : null,
            title: title,
            trailing: noBackArrow == true
                ? SizedBox()
                :   Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,

              weight: 10,
            ),
          ),
        ),
      ),
    );
  }
}