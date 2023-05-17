import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:currency_converter_app/src/core/utils/assets_manager.dart';
import 'package:currency_converter_app/src/core/utils/color_manager.dart';
import 'package:currency_converter_app/src/core/utils/strings_manager.dart';
import 'package:currency_converter_app/src/core/utils/styles_manager.dart';
import 'package:currency_converter_app/src/core/utils/values_manager.dart';
import 'package:sizer/sizer.dart';

import '../../injector.dart';
import '../network/network_info.dart';
import '../utils/font_manager.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  late StreamSubscription<InternetConnectionStatus> listener;

  @override
  void initState() {
    super.initState();
    listener = sl<NetworkInfo>().connectionState.listen((status) {
      if (mounted && status == InternetConnectionStatus.connected) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    // listener.cancel();
    super.dispose();
  }

  Future<bool> checkOnline() async {
    SnackBar snackBar = SnackBar(
      content: Text(
        AppStrings.onlineCheck,
        style: getBoldStyle(
            color: ColorManager.primaryColor, fontSize: FontSize.s14),
      ),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    if (mounted && await sl<NetworkInfo>().isConnected) {
      return Navigator.of(context).maybePop();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: checkOnline,
      child: RefreshIndicator(
        onRefresh: checkOnline,
        displacement: 150,
        child: Scaffold(
          body: Container(
            color: ColorManager.secondary5Color.withOpacity(.8),
            child: ListView(
              children: [
                SizedBox(
                  height: 27.h + AppPadding.p80,
                  width: 100.w,
                ),
                Image.asset(ImageAssets.noInternet, width: 180, height: 180),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  AppStrings.noInternet,
                  style: getBoldStyle(color: ColorManager.secondary4Color),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
