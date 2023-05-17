// //write api tests here

// import 'package:currency_converter_app/src/features/exchange_rate/data/repositories/exchange_rate_repo_impl.dart';
// import 'package:currency_converter_app/src/injector.dart';
// import 'package:flutter/material.dart';
// import 'package:mockito/mockito.dart';
// import 'package:test/test.dart';

// void main() {
//   setUp(() async {
//     WidgetsFlutterBinding.ensureInitialized();

//     await init();
//   });
//   test('API endpoint is called correctly', () {
//     final repo = sl<ExchangeRateRepositoryImpl>();
//     repo.getExchangeRateData('2021-01-01', '2021-01-02', 'USD', 'EUR');
//     verify(repo.getExchangeRateData('2021-01-01', '2021-01-02', 'USD', 'EUR'));
//   });
// }
