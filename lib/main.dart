import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:email_app/src/core/utils/bloc_Observer.dart';
import 'package:email_app/src/core/widgets/wrong.dart';
import 'package:email_app/src/injector.dart' as di;

import 'src/features/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await di.init();

  // if release mode, show custom error screen
  if (kReleaseMode) {
    ErrorWidget.builder = (FlutterErrorDetails details) => const ErrorScreen();
  }

  runApp(const MyApp());
}
