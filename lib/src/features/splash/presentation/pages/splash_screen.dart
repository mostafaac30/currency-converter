import 'dart:async';
import 'package:flutter/material.dart';
import 'package:email_app/src/core/utils/color_manager.dart';
import 'package:email_app/src/core/utils/constants_manager.dart';

import '../../../../config/routes/routes_manager.dart';
import '../../../../core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  void _goNext() async {
    Navigator.pushReplacementNamed(
      context,
      Routes.homeScreen,
    );
  }

  _startDelay() {
    _timer = Timer(
        const Duration(seconds: AppConstants.splashDelay), () => _goNext());
  }

  bool isFinished = false;
  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        body: Container(
          color: ColorManager.primaryColor,
          child: SafeArea(
            child: Center(
              child: Image.asset(
                ImageAssets.appLogo,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
