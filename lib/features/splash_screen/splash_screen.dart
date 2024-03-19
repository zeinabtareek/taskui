
import 'dart:async';

import 'package:flutter/material.dart';
import '../../common/AppImages.dart';
import '../../routes/paths.dart';
import '../../routes/routs_page.dart';
import '../../widgets/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {

    _timer = Timer(const Duration(seconds: 5), _goNext);
  }

  _goNext() {

    Navigator.of(context).pushReplacementNamed(AppPaths.onBoardingScreen);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return     const Scaffold(
      body:
      Center(
        child: SizedBox(
          width: 200,
          height: 90,
          child: CustomImage(
            svg: null,
           isAssets:true,
           image : Images.logo,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}