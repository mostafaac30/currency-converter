part of 'exchange_rate_view_cubit.dart';

abstract class ExchangeRateViewState extends Equatable {
  final data = [];
  final bool hasMoreItems = true;

  @override
  List<Object> get props => [];
}

class ExchangeRateViewInitial extends ExchangeRateViewState {}

class ExchangeRateViewLoadingState extends ExchangeRateViewState {
  @override
  final bool hasMoreItems;
  final List oldData;
  ExchangeRateViewLoadingState({
    required this.oldData,
    required this.hasMoreItems,
  });
}

class ExchangeRateViewSuccessState extends ExchangeRateViewState {
  @override
  final List data;
  @override
  final bool hasMoreItems;
  ExchangeRateViewSuccessState({
    required this.data,
    required this.hasMoreItems,
  });
}

class ExchangeRateViewErrorState extends ExchangeRateViewState {
  final String error;
  ExchangeRateViewErrorState({
    required this.error,
  });
}

class ExchangeRateViewSymbolsLoadedState extends ExchangeRateViewState {
  List<String> currencies = [];
  Map<String, dynamic> countries = {};
  ExchangeRateViewSymbolsLoadedState({
    required this.currencies,
    required this.countries,
  });
}

class ExchangeRateViewUpdateBaseCurrencyState extends ExchangeRateViewState {
  String baseCurrency;

  ExchangeRateViewUpdateBaseCurrencyState({required this.baseCurrency});
}

class ExchangeRateViewUpdateTargetCurrencyState extends ExchangeRateViewState {
  String targetCurrency;

  ExchangeRateViewUpdateTargetCurrencyState({required this.targetCurrency});
}

class ExchangeRateViewSwapCurrencyState extends ExchangeRateViewState {
  String baseCurrency;
  String targetCurrency;

  ExchangeRateViewSwapCurrencyState({
    required this.baseCurrency,
    required this.targetCurrency,
  });
}

class ExchangeRateViewUpdateStartDateState extends ExchangeRateViewState {
  String startDate;

  ExchangeRateViewUpdateStartDateState({required this.startDate});
}

class ExchangeRateViewUpdateEndDateState extends ExchangeRateViewState {
  String? endDate;

  ExchangeRateViewUpdateEndDateState({required this.endDate});
}

class ExchangeRateViewResetState extends ExchangeRateViewState {
  ExchangeRateViewResetState();
}
