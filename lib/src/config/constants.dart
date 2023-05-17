class Constants {
  static const String apiUrl = 'https://api.exchangerate.host/';

  static const String timeSeriesEndpoint = 'timeseries';

  static const int apiTimeOut = 30000;
  static const int requestLimit = 10;

  static RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static const int splashDelay = 2;
  static const int leaderboardDelay = 10;
  static const int crossAxisCount = 3;
  static const int animationDuration = 500;

  static int waitingTime = 7;
  static int examDoneTime = 3;
}
