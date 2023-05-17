import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart' as sizer;

import '../config/routes/routes_manager.dart';
import '../config/themes/theme_manager.dart';
import '../core/utils/single_touch.dart';
import '../core/utils/strings_manager.dart';
import '../injector.dart' as di;

import 'exchange_rate/presentation/cubit/exchange_rate_view_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return sizer.Sizer(
      builder: (_, __, ___) {
        return getMaterialApp();
      },
    );
  }

  Widget getMaterialApp() {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersiveSticky); // fullscreen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ExchangeRateViewCubit>(
          create: (context) => di.sl<ExchangeRateViewCubit>(),
        ),
      ],
      child: OnlyOnePointerRecognizerWidget(
        child: Builder(
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: true,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: '/',
              title: AppStrings.appName,
              theme: getAppTheme(),
              supportedLocales: const [
                Locale(
                    'en', 'US'), // OR Locale('ar', 'AE') OR Other RTL locales
              ],
              locale: const Locale(
                  'en', 'US'), // OR Locale('ar', 'AE') OR Other RTL locales
            );
          },
        ),
      ),
    );
  }
}
