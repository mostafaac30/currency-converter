import 'dart:async';
import 'package:currency_converter_app/src/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter_app/src/core/utils/color_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/constants.dart';
import '../../../../config/routes/routes_manager.dart';

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
      Routes.exchangeRate,
    );
  }

  _startDelay() {
    _timer =
        Timer(const Duration(seconds: Constants.splashDelay), () => _goNext());
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
              child: ClipOval(
                  child: Icon(
                FontAwesomeIcons.coins,
                color: ColorManager.secondaryColor,
                size: AppSize.s100,
              )),
            ),
          ),
        ),
      ),
    );
  }
}
