


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskui/core/bases/base_state/base_cubit_state.dart';
import 'package:taskui/features/home/controller/home_controller.dart';

import '../../common/AppImages.dart';
import '../../common/app_style.dart';
import '../../core/bases/app_base.dart';
import '../../routes/paths.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_image.dart';

class HomeScreen extends AppBase<HomeController>  {
  HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, BaseState>(
      bloc: cubit,
      listener: (context, state) {  },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: CustomBody(  isCentered:   false,
            appBar: CustomAppBar(
              title: ' ',
              regularAppBar: true,
              showBackButton: false,

              noActions: false,
            ),
            body: buildBody(state,context ),
          ),
        );
      },
    );
  }

}
Widget buildBody(BaseState state, context) {
  return  Padding(
    padding: K.fixedPadding1,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Row( mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Welcome, Jessie.',
                  style: K.boldBlackTextStyle(context), ),
              ],
            ),

          K.sizedBoxH1,
          adsWidget(context),

          K.sizedBoxH1,
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Plans',
                style: K.blackTextStyleLarge(context), ),Text(
                'See All →',
                style: K.mainColorMediumTextStyle(context), ),
            ],
          ),

          K.sizedBoxH1,
          plansWidget(context),
          K.sizedBoxH1,
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Investment Guide',
                style: K.blackTextStyleLarge(context), ),
            ],
          ),
      K.sizedBoxH1,
      K.sizedBoxH1,
     investmentGuideWidget(context),
        ],





    ),
  );
}
Widget investmentGuideWidget(context) {
  List l=[
    Images.el1,
    Images.el2,
    Images.el1,
    Images.el1,
  ];
  return

    ListView.builder(
      // scrollDirection: Axis.vertical,
      itemCount: l.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(padding: const EdgeInsets.only(bottom: 20.0),
            decoration:   BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.5))),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Basic type of investments',
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'This is how you set your foot for 2020 Stock market recession. What’s next...',
                        style: K.hintSmallTextStyle(context),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  l[index],
                  width: 100.w,
                  height: 75.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        );

      },

  );


}



Widget plansWidget(context) {
  List list=[
    Images.card1,
    Images.card2,
    Images.card1,
    Images.card2,
    Images.card1,
  ];
  return   Container(
    padding: K.fixedPadding1,

    height: 170.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length ,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          child:  Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: CustomImage(
                        isAssets: true,
                        image: list[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),


          onTap: (){
            // Get.to(()=>ServicesUI(serviceData:controller.service!.data![index]));
          },
        );
      },
    ),
  );
}















Widget adsWidget(context) {
  // final controller = Get.put(HomeScreenController());
  return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, AppPaths.assetsScreen);
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
       Stack(
              alignment: Alignment.center,
              children: [

                      Positioned(
                        child: Container(

                          width: MediaQuery.of(context).size.width,
                          height: 150.h,
                          // padding: K.,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.r)),
                            gradient: LinearGradient(
                              colors: [
                                K.gradientLightGreenColor.withOpacity(.8),
                                K.gradientLightGreenColor..withOpacity(.6),
                                K.gradientLightGreenColor.withOpacity(.4),
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                          ),
                        ),


                ),
          Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               K.sizedBoxH1,
               Row(
                 children: [
                   K.sizedBoxW0,
                   Text('Your total asset portfolio',style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                 ],
               ),
K.sizedBoxH1,

               Row(
                 children: [

                   K.sizedBoxW0,
                   Expanded(
                       child:Text('N203,935',style: TextStyle(color: Colors.white,fontSize: 34.sp),)
                   ),
                   K.sizedBoxW0,
                   Expanded(
                     child: CustomButton(
                       isLoading: false,
                       buttonText: 'Create Account',
                       backgroundColor: Colors.white,
                       textColor: K.gradientLightGreenColor,
                       fontSize: 14,
                       // width: 300.w,
                       // height: 60,
                       onPressed: () {
                         Navigator.pushNamed(context, AppPaths.home);
                       },
                       radius: 15,
                     ),
                   ), K.sizedBoxW0,
                 ],
               ),

             ],
           ),


      ],

      // Image.asset('assets/icons/ads_card.png',fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
    ) ],

      // Image.asset('assets/icons/ads_card.png',fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
    ),
  );
}