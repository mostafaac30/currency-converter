part of 'home_view_cubit.dart';

abstract class HomeViewState extends Equatable {
  final data = [];
  final bool hasMoreItems = true;

  @override
  List<Object> get props => [];
}

class HomeViewInitial extends HomeViewState {}

class HomeViewLoadingState extends HomeViewState {
  @override
  final bool hasMoreItems;
  final List oldData;
  HomeViewLoadingState({
    required this.oldData,
    required this.hasMoreItems,
  });
}

class HomeViewSuccessState extends HomeViewState {
  @override
  final List data;
  @override
  final bool hasMoreItems;
  HomeViewSuccessState({
    required this.data,
    required this.hasMoreItems,
  });
}

class HomeViewErrorState extends HomeViewState {
  final String error;
  HomeViewErrorState({
    required this.error,
  });
}

class HomeViewSymbolsLoadedState extends HomeViewState {
  List<String> currencies = [];
  Map<String, dynamic> countries = {};
  HomeViewSymbolsLoadedState({
    required this.currencies,
    required this.countries,
  });
}

class HomeViewUpdateBaseCurrencyState extends HomeViewState {
  String baseCurrency;

  HomeViewUpdateBaseCurrencyState({required this.baseCurrency});
}

class HomeViewUpdateTargetCurrencyState extends HomeViewState {
  String targetCurrency;

  HomeViewUpdateTargetCurrencyState({required this.targetCurrency});
}

class HomeViewSwapCurrencyState extends HomeViewState {
  String baseCurrency;
  String targetCurrency;

  HomeViewSwapCurrencyState({
    required this.baseCurrency,
    required this.targetCurrency,
  });
}

class HomeViewUpdateStartDateState extends HomeViewState {
  String startDate;

  HomeViewUpdateStartDateState({required this.startDate});
}

class HomeViewUpdateEndDateState extends HomeViewState {
  String? endDate;

  HomeViewUpdateEndDateState({required this.endDate});
}

class HomeViewResetState extends HomeViewState {
  HomeViewResetState();
}
