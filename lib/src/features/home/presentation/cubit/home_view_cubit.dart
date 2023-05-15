import 'package:bloc/bloc.dart';
import 'package:email_app/src/config/constants.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/home_repo.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  final HomeRepository _repository;
  List _allData = [];
  int _currentPage = 1;
  bool _hasMoreItems = true;
  bool _isLoading = false;
  String? _startDate;
  String? _endDate;

  HomeViewCubit({
    required HomeRepository repository,
  })  : _repository = repository,
        super(HomeViewInitial()) {
    // loadMessages();
  }

  void loadData() async {
    // if ((_isLoading || !_hasMoreItems)) return;

    _isLoading = true;
    // if (_currentPage > 1) {
    emit(HomeViewLoadingState(hasMoreItems: _hasMoreItems, oldData: _allData));
    // }
    if (_startDate == null || _endDate == null) return;
    final result = await _repository.getData(
      _currentPage,
      _startDate!,
      _endDate!,
    );
    result.fold(
      (failure) => emit(HomeViewErrorState(
        error: failure.message,
      )),
      (newData) {
        _allData.addAll(newData);
        print(_allData.length);
        _isLoading = false;
        _currentPage += 1;
        print("current page: $_currentPage ++++++++++++++++");
        if (newData.length < Constants.requestLimit) {
          _hasMoreItems = false;
        }

        emit(HomeViewSuccessState(
          hasMoreItems: _hasMoreItems == 2,
          data: _allData,
        ));
      },
    );
  }

  void refreshData() async {
    emit(HomeViewLoadingState(
      hasMoreItems: _hasMoreItems,
      oldData: _allData,
    ));
    _currentPage = 1;
    _hasMoreItems = true;
    _isLoading = false;

    if (_startDate == null || _endDate == null) return;
    final result =
        await _repository.getData(_currentPage, _startDate!, _endDate!);
    result.fold(
      (failure) => emit(HomeViewErrorState(
        error: failure.message,
      )),
      (newData) {
        _allData = newData;
        print(_allData.length);
        _currentPage += 1;
        print("current page: $_currentPage ++++++++++++++++");

        emit(HomeViewSuccessState(
          hasMoreItems: _hasMoreItems,
          data: _allData,
        ));
      },
    );
  }

//set the state to initial state
  void reset() {
    _allData = [];
    _currentPage = 1;
    _hasMoreItems = true;
    _isLoading = false;
    emit(HomeViewInitial());
  }

  set startDate(String startDate) => _startDate = startDate;
  set endDate(String endDate) => _endDate = endDate;
}
