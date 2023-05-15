import 'package:email_app/src/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../injector.dart';

class ShowcaseHandler {
  static final _singleton = ShowcaseHandler._internal();
  factory ShowcaseHandler() {
    return _singleton;
  }
  ShowcaseHandler._internal();
  final pref = sl<SharedPreferences>();
  disableShowCaseVisibility(
    KeyType state,
  ) async {
    await pref.setBool(state.toString(), false);
  }

  void disableAll() {
    for (final s in KeyType.values) {
      disableShowCaseVisibility(s);
    }
  }

  bool getShowCaseState(
    KeyType state,
  ) {
    return (pref.getBool(state.toString()) ?? true) && !Constants.isExam;
  }
}

enum KeyType {
  leaderboardKey,
  soundKey,
  settingsKey,
  introKey,
  aidsKey,
  feedbackKey,
  studentDetailsAnswerKey,
}
