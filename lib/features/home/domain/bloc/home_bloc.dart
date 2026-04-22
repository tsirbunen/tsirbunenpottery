import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_event.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_state.dart';
import 'package:tsirbunenpottery/features/home/repository/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  final AppLogger _logger;

  HomeBloc(this._repository, {required AppLogger logger})
      : _logger = logger,
        super(const HomeState()) {
    on<HomeEvent>(_onEvent);
  }

  Future<void> _onEvent(HomeEvent event, Emitter<HomeState> emit) async {
    switch (event) {
      case FetchHomePageImageFileName():
        await _onFetch(emit);
    }
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
    } catch (e, s) {
      _logger.logError('Failed to fetch home page image', error: e, stackTrace: s, tag: 'HomeBloc');
      emit(state.copyWith(blocStatus: BlocStatus(Status.error, message: e.toString())));
    }
  }
}
