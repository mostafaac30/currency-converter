import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:email_app/src/core/utils/assets_manager.dart';
import 'package:email_app/src/core/utils/color_manager.dart';
import 'package:email_app/src/core/utils/strings_manager.dart';
import 'package:email_app/src/core/utils/styles_manager.dart';
import 'package:email_app/src/core/utils/values_manager.dart';
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
  var listener;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    listener = sl<NetworkInfo>().connectionState.listen((status) {
      print('internet connection ');
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
    print('checkOnline');

    SnackBar snackBar = SnackBar(
      content: Text(
        AppStrings.onlineCheck,
        style: getBoldStyle(color: ColorManager.bg2, fontSize: FontSize.s14),
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
            color: ColorManager.black100Color.withOpacity(.8),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: AppPadding.p10, top: AppPadding.p80),
                //   child: Align(
                //       alignment: Alignment.topLeft,
                //       child: Image.asset(ImageAssets.close, width: AppSize.w9_6)),
                // ),
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
                  style: getBoldStyle(color: ColorManager.grey100),
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
