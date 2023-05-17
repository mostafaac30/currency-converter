import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:currency_converter_app/src/config/constants.dart';
import 'package:currency_converter_app/src/features/home/data/models/rate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

import '../../data/repositories/home_repo.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  final HomeRepository _repository;
  List<Rate> _allData = [];
  int _currentPage = 1;
  bool _hasMoreItems = true;
  bool _isLoading = false;
  String? _startDate;
  String? _endDate;
  List<String> currencies = [];
  Map<String, dynamic> countries = {};
  String? _baseCurrency;
  String? _targetCurrency;

  HomeViewCubit({
    required HomeRepository repository,
  })  : _repository = repository,
        super(HomeViewInitial()) {
    loadCountriesAndCurrencies();
  }

  Future<void> loadCountriesAndCurrencies() async {
    final String response = await rootBundle.loadString('assets/symbols.json');
    countries = await json.decode(response);
    currencies = countries.keys.toList();
    emit(HomeViewSymbolsLoadedState(
      countries: countries,
      currencies: currencies,
    ));
  }

  void loadData() async {
    if ((_isLoading || !_hasMoreItems)) return;

    final oldData = getCurrentPaginatedData();
    emit(HomeViewLoadingState(hasMoreItems: _hasMoreItems, oldData: oldData));

    if (_allData.isNotEmpty) {
      _currentPage += 1;

      //return data from cache
      final paginatedData = getCurrentPaginatedData();
      emit(HomeViewSuccessState(
        hasMoreItems: _hasMoreItems,
        data: paginatedData,
      ));
      return;
    }
    _isLoading = true;

    if (_startDate == null ||
        _endDate == null ||
        _baseCurrency == null ||
        _targetCurrency == null) return;
    final result = await _repository.getData(
      _startDate!,
      _endDate!,
      _baseCurrency!,
      _targetCurrency!,
    );
    result.fold(
      (failure) {
        _isLoading = false;

        return emit(HomeViewErrorState(
          error: failure.message,
        ));
      },
      (newData) {
        _allData.addAll(newData as List<Rate>);
        final paginatedData = getCurrentPaginatedData();
        _isLoading = false;
        _currentPage += 1;
        emit(HomeViewSuccessState(
          hasMoreItems: _hasMoreItems,
          data: paginatedData,
        ));
      },
    );
  }

  List<Rate> getCurrentPaginatedData() {
    int start = 0;
    //(_currentPage - 1) * Constants.requestLimit;

    int end = _currentPage * Constants.requestLimit;
    end = _allData.length <= end ? _allData.length : end; // if less than 10
    final paginatedData = _allData.sublist(start, end);
    // _hasMoreItems
    _hasMoreItems =
        (_allData.length == end && _allData.isNotEmpty) ? false : true;

    return paginatedData;
  }

//set the state to initial state
//also used in re init dates and currencies
  void reset() {
    emit(HomeViewInitial());
    _allData = [];
    _currentPage = 1;
    _hasMoreItems = true;
    _isLoading = false;

    emit(HomeViewResetState());
  }

  set setStartDate(String? startDate) {
    if (_allData.isNotEmpty) reset(); // when changing dates
    emit(HomeViewInitial());
    _startDate = startDate;
    emit(HomeViewUpdateStartDateState(startDate: _startDate!));
  }

  set setEndDate(String? endDate) {
    if (_allData.isNotEmpty) reset();

    emit(HomeViewInitial());
    _endDate = endDate;
    emit(HomeViewUpdateEndDateState(endDate: _endDate));
  }

  String? get getBaseCurrency => _baseCurrency;
  String? get getTargetCurrency => _targetCurrency;

  set setBaseCurrency(String baseCurrency) {
    if (_allData.isNotEmpty) reset();

    emit(HomeViewInitial());

    _baseCurrency = baseCurrency;
    emit(HomeViewUpdateBaseCurrencyState(baseCurrency: _baseCurrency!));
  }

  set setTargetCurrency(String targetCurrency) {
    if (_allData.isNotEmpty) reset();

    emit(HomeViewInitial());

    _targetCurrency = targetCurrency;
    emit(HomeViewUpdateTargetCurrencyState(targetCurrency: _targetCurrency!));
  }

  void swapCurrencies() {
    if (_allData.isNotEmpty) reset();

    if (_baseCurrency == null || _targetCurrency == null) return;
    emit(HomeViewInitial());
    final temp = _baseCurrency;
    _baseCurrency = _targetCurrency;
    _targetCurrency = temp;
    emit(HomeViewSwapCurrencyState(
        baseCurrency: _baseCurrency!, targetCurrency: _targetCurrency!));
  }
}
