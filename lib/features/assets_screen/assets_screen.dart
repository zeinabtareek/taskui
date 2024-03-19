




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/AppImages.dart';
import '../../common/app_style.dart';
import '../../common/text_style.dart';
import '../../core/utils/dimensions.dart';
import '../../widgets/custom_image.dart';

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 10,),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                // top: 0,
                // left: 0,
                // right: 0,
                // bottom: 0,
                child: Container(
                  padding:const EdgeInsets.all(20),
                  margin:const EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height/1.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color:   Theme.of(context).cardColor.withOpacity(.97),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.4),
                        blurRadius: .55,
                        spreadRadius: .88,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child:const SizedBox()),
              ),
              Padding(
                padding:   EdgeInsets.only(top: 50.0),
                child: CustomerRideRequestCardWidget(),
              ),
            ],
          )



        ],
      ),
    );
  }
}




class CustomerRideRequestCardWidget extends StatelessWidget {
  CustomerRideRequestCardWidget({Key? key}) : super(key: key);

  AppinioSwiperController appinioSwiperController = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    final cardCount = 5; // Total number of cards
    final cardHeight = 120.0; // Height of each card
    final totalHeight = cardCount * cardHeight; // Total height for all cards

    return SizedBox(
      height: totalHeight,
      child:  AppinioSwiper(
          cardCount: cardCount,
          controller: appinioSwiperController,
          onSwipeEnd: (previousIndex, targetIndex, activity) {},
          allowUnlimitedUnSwipe: false,

           cardBuilder: (context, index) {
            return  requestCard(
                onPressed: () {},
                context: context,
                i: index, isActive: index != 0,
              
            );
          },

      ),
    );
  }
}





Widget requestCard({
  required int i,
  required bool isActive,
  required BuildContext context,
  required VoidCallback onPressed,
}) {
  // final double cardHeight = isActive ? 120.0 : 60.0;

  return Container(
    padding:EdgeInsets.all(20),
    // height: 100,
    decoration: BoxDecoration(
      color: isActive
          ? Theme.of(context).cardColor.withOpacity(.97)
          : Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.4),
          blurRadius: .55,
          spreadRadius: .88,
          offset: const Offset(0, 0),
        ),
      ],
    ),
    child:
    SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                K.sizedBoxW0,
                K.sizedBoxW0,
                const Text(
                  'My Asset',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                   // Image.asset,
               // K.sizedBoxW0,
               K.sizedBoxW0,
                Container(
                  decoration: BoxDecoration(color: Colors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0, // Choose your desired border width
                    ),
                  ),
                  child: const Icon(
                    Icons.close_outlined,
                    color: Colors.white,
                    size: 24.0, // Choose your desired icon size
                  ),
                ),



              ],
            ),
          ),



          K.sizedBoxH1,


    Row(
      children: [
        Text('Your total asset portfolio',style: K.hintSmallTextStyle(context),),
      ],
    ),  K.sizedBoxH1,
          Row(
            children: [
              Text('N203,935',style: K.boldBlackTextStyle(context), ),
              SizedBox(width: 45,),
              Text('+2%',style:TextStyle(color: K.gradientLightGreenColor,fontSize: 20.sp,fontWeight: FontWeight.bold,  ),),

            ],
          )
          ,
K.sizedBoxH1,
K.sizedBoxH1,
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Plans',
                style: K.blackTextStyleLarge(context), ),
            ],
          ),

          K.sizedBoxH1,
          const SizedBox(
            child: CustomImage(
                isAssets: true,
                image: Images.card3,
                fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          K.sizedBoxH1,
          const Text('See All Plans →',style: TextStyle(color: Colors.red,fontSize: 20),),
          K.sizedBoxH1,
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: K.blackTextStyleLarge(context), ),
            ],
          ),

          K.sizedBoxH1,
          historyCard(context)

        ],
      ),
    ),
  );
}

Widget historyCard(context) {
  List l=[
    Images.el1,
    Images.el2,
    Images.el1,
    Images.el1,
  ];
  return

    ListView.builder(
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
                        'Rp 200.000',
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold
                        ,color: index%2==0?Colors.black:Colors.green
                        ),
                      ),
                      Text(
                        'Sell “TLKM” Stock',
                        style: K.hintSmallTextStyle(context),
                      ),
                    ],
                  ),
                ),
                Text(
                  'TUE 22 Jun 2020',
                  style: K.hintSmallTextStyle(context),
                ),
              ],
            ),
          ),
        );

      },

    );


}