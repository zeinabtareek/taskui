import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/AppImages.dart';
import '../../common/app_style.dart';
import '../../routes/paths.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 250,
              height: 270,
              child: CustomImage(
                svg: null,
                isAssets: true,
                image: Images.onBoarding,
              ),
            ),
            K.sizedBoxH1,
            SizedBox(
              width: 320.w,
              child: Text(
                'Stay on top of your finance with us.',
                style: K.boldBlackTextStyle(context),
                textAlign: TextAlign.center,
              ),
            ),
            K.sizedBoxH1,
            SizedBox(
              width: 250.w,
              child: Text(
                'We are your new financial Advisors  to recommed the best investments for you.',
                style: K.blackBodyTextStyle(context),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              isLoading: false,
              buttonText: 'Create Account',
              backgroundColor: K.gradientLightGreenColor,
              fontSize: 16,
              width: 300.w,
              height: 60,
              onPressed: () {
                Navigator.pushNamed(context, AppPaths.home);
              },
              radius: 15,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              isLoading: false,
              buttonText: 'Login',
              backgroundColor: Colors.transparent,
              textColor: K.gradientLightGreenColor,
              fontSize: 16,
              width: 250.w,
              onPressed: () {
                Navigator.pushNamed(context, AppPaths.loginWithPass);
              },
              radius: 15,
            ),
          ],
        ),
      ),
    );
  }
}
