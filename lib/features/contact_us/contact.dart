




//ContactInfoScreen


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
import '../profile/controller/profile_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class ContactInfoScreen extends AppBase<ProfileCubit> {
  ContactInfoScreen({super.key});

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
              title: '\n Contact info ',
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



        ...List.generate(
          cubit.images.length,
              (index) => listTile(
            title:  cubit.labelsContact[index]['title']!,
            sub:    cubit.labelsContact[index]['subtitle'],

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

class listTile extends StatelessWidget {
  String? sub;
  String title;
  bool? noBackArrow;
  Function()? trailingOnTap;
  void Function()? onTap;

  listTile(
      {Key? key,
        this.sub,
        required this.title,
        this.noBackArrow,
        this.onTap,
        this.trailingOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title),
          TextField(
    decoration: InputDecoration(
    hintText: title, // Hint text
    labelText: sub, // Label text
    // border: InputBorder.none, // Remove default border
    ),
    ),
        ],
      ),


    );
  }
}