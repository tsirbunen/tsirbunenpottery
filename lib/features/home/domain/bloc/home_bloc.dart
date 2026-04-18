import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/state/app_bloc_event.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_event.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_state.dart';
import 'package:tsirbunenpottery/features/home/repository/home_repository.dart';

class HomeBloc extends Bloc<AppBlocEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const HomeState()) {
    on<AppBlocEvent>(_onEvent);
  }

  Future<void> _onEvent(AppBlocEvent event, Emitter<HomeState> emit) async {
    return switch (event) {
      final BlocStatusChanged e => emit(state.copyWith(blocStatus:e.status)),
      final FetchHomePageImageFileName _ => _onFetch(emit),
      final AppBlocEvent _ => emit(state),
    };
  }

  Future<void> _onFetch(Emitter<HomeState> emit) async {
    if (state.blocStatus.isLoading || state.homePageImageFileName != null) return;
    emit(state.copyWith(blocStatus:const BlocStatus(Status.loading)));
    try {
      final fileName = await _repository.fetchHomePageImageFileName();
      emit(HomeState(
        homePageImageFileName: fileName,
        blocStatus: const BlocStatus(Status.ok),
      ));
    } catch (e) {
      emit(state.copyWith(blocStatus:BlocStatus(Status.error, message: e.toString())));
    }
  }
}
