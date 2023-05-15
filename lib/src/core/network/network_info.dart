import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> get connectionState;
}

class InternetInfoImp implements NetworkInfo {
  InternetConnectionChecker internetConnectionChecker;
  InternetInfoImp({required this.internetConnectionChecker}) {
    // internetConnectionChecker.checkInterval = const Duration();
  }
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;

  @override
  Stream<InternetConnectionStatus> get connectionState =>
      internetConnectionChecker.onStatusChange;
}
