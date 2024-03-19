



//BankScreen


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

import 'controller/bank.dart';
class BankScreen extends AppBase<BankCubit> {
  BankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankCubit, BaseState>(
      bloc: cubit,
      listener: (context, state) {  },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: CustomBody(
            isCentered:   false,
            appBar: CustomAppBar(
              title: 'Bank of account info ',
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
Widget buildBody(BaseState state, context, BankCubit cubit) {
  return  Padding(
    padding: EdgeInsets.only(left: 20,right: 20, ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [


        K.sizedBoxH1,


        ...List.generate(
          cubit.images.length,
              (index) => SettingListTile(
            title: Text('Bank of Amrica - 0182128xxx'),
            icon:  Image.asset(
              cubit.images[index],
              height: 100.h,
              width: 100.w,
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
          height: 90,
          // elevation: 2,
          decoration: BoxDecoration(
            color:   Theme.of(context).cardColor.withOpacity(.97),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 5,
                blurRadius: 8,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: ListTile(

              leading: icon != null ? icon : null,
              title: title,
              trailing: noBackArrow == true
                  ? SizedBox()
                  :   const Icon(
                Icons.more_vert,
                size: 40,

                weight: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}