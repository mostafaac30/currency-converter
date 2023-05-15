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
