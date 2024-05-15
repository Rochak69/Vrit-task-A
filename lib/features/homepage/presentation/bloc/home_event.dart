part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchAllData extends HomeEvent {
  FetchAllData({this.search});

  final String? search;
}
