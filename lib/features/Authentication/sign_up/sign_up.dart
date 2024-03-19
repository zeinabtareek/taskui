



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_style.dart';
import '../../../core/utils/validator.dart';
import '../../../routes/paths.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_body.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBody(
      isCentered: false,
      appBar: CustomAppBar(
        title:'fff',
        regularAppBar: true,
        noActions: true,
        showBackButton: true,
      ),
      body:  Form(
         child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0.w),
          child: Column(
            children: [


                Text('Create an account',style: K.boldBlackTextStyle(context),
                  textAlign: TextAlign.center,
              ),
                K.sizedBoxH1,
                Text('Invest and double your income now',
                  style: K.blackBodyTextStyle(context),
                  textAlign: TextAlign.center, ),

              K.sizedBoxH1,

              CustomTextField(
                fillColor: Colors.transparent,
                hintText: 'Full name',
                isLtr: true,
                isEnabled: true,
                prefix: false,
                validator: (p0) => TValidator.normalValidator(
                   p0,
                  hint: 'Full name',
                ),
                inputType: TextInputType.text,

                controller: TextEditingController(),
                inputAction: TextInputAction.next,
                // onCountryChanged: (_) => cubit.loginSelectCountry,
              ),

              K.sizedBoxH1,
              CustomTextField(
                fillColor: Colors.transparent,
                hintText: 'Email address',
                isLtr: true,
                isEnabled: true, prefix: false,
                validator: (p0) => TValidator.email(
                  value: p0,
                  hint: 'Email address',
                ),
                inputType: TextInputType.emailAddress,

                controller: TextEditingController(),
                inputAction: TextInputAction.next,
              ),
              K.sizedBoxH1,
              CustomTextField(
                isLtr: true,
                validator: (p0) => TValidator.passwordValidate(
                  value: p0,
                  hint: 'password',
                ),
                hintText: 'Password',
                prefix: false,
                inputType: TextInputType.text,
                prefixIcon: null,
                prefixHeight: 70,
                fillColor: Colors.transparent,
                inputAction: TextInputAction.done,
                focusNode: null,
                isPassword: true,
              ),

              SizedBox(height: 35.h),

              CustomButton(
                isLoading: false,
                buttonText: 'Create Account',
                backgroundColor: K.gradientLightGreenColor,
                fontSize: 16,
                width: 300.w,
                height: 60,
                onPressed: () {
                  Navigator.pushNamed(context, AppPaths.loginWithPass);
                },
                radius: 15,
              ),
            K.sizedBoxH1,
              CustomButton(
                isLoading: false,
                buttonText: 'Already have an account?',
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
      ),

    );
  }
}
