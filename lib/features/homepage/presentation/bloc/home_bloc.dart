import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/homepage/data/model/picture_response.dart';
import 'package:lookup/features/homepage/data/source/home_data_source.dart';
import 'package:lookup/res/app_constants.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.source) : super(const HomeState()) {
    on<FetchAllData>(_fetchData);
  }
  final HomeRemoteSource source;

  FutureOr<void> _fetchData(FetchAllData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(theStates: TheStates.loadng));
    final result = await source.fetchData(search: event.search);
    result.fold((l) {
      emit(state.copyWith(errorMessage: l.message, theStates: TheStates.error));
    }, (r) {
      emit(state.copyWith(theStates: TheStates.sucess, pictures: r.data));
    });
  }
}
