import 'package:shared_preferences/shared_preferences.dart';

import '../../injector.dart';

class PrefHandler {
  final pref = sl<SharedPreferences>();

  static final _singleton = PrefHandler._internal();
  factory PrefHandler() {
    return _singleton;
  }
  PrefHandler._internal();

  updateNotification(bool state) async {
    await pref.setBool('NotificationKey', state);
  }

  bool getNotification() {
    return pref.getBool('NotificationKey') ?? true;
  }

  // updateSound(bool state, BuildContext context) async {
  //   await pref.setBool('SoundKey', state);
  //   context.read<ChooseModeCubit>().soundChange();
  // }

  // bool getSound() {
  //   return pref.getBool('SoundKey') ?? true;
  // }
}
