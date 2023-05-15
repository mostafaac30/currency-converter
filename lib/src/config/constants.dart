class Constants {
  static const String apiUrl = 'https://api.exchangerate.host/';

  static const String routerEndpoint = '<router>';
  static const String timeseriesEndpoint = 'timeseries';

//mahmoudkaram@gmail.com
  // static String updateUserInfoEndpoint =
  //     'user/${Constants.USERINFO?.result?.user?.id}';
  static String forgetPasswordEndpoint = 'forget-password';
  static String resetPasswordEndpoint = 'reset-password';

  static const String empty = '';

  static String tokenKey = 'TOKEN';
  static String? TOKEN = '';

  static String userCredentialsKey = 'userCredentials';

  static String examKey = 'EXAM';

  static const int apiTimeOut = 30000;
  static const int zero = 0;
  static const String cachedQuote = 'CACHED_QUOTE';
  static const String randomQuoteEndpoint = 'random.json';
  static int userCoins = 0;
  static const String userName = '';
  static const int requestLimit = 10;

  static int numOfChallenges = 5;
  // static int fixedNumOfQuestionsPerChallenge = 5;

  static String currentLevelId = '';
  static String currentHeader = '';
  static String currentTopicId = '';
  static String currentRef = '';
  static int currentLevelNumInExam = 1;
  static bool isExam = false;

  static String reviewKey = 'reviewKey';
  static String appLinkAppStore = 'https://apps.apple.com/app/id1663630192';

  static String profilePictureKey = 'profilePictureKey';
  static String waitingTimeKey = 'waitingTimeKey';

  static RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
}
