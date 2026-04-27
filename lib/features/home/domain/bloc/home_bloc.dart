import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/state/bloc_utils/fetch_bloc_mixin.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_event.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_state.dart';
import 'package:tsirbunenpottery/features/home/repository/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>
    with FetchBlocMixin<HomeEvent, HomeState> {
  final HomeRepository _repository;

  @override
  final AppLogger logger;

  @override
  bool get isLoaded => state.homePageImageFileName != null;

  @override
  String get fetchErrorMessage => 'Failed to fetch home page image';

  @override
  HomeState withStatus(BlocStatus status) => state.copyWith(blocStatus: status);

  HomeBloc(this._repository, {required this.logger}) : super(const HomeState()) {
    on<HomeEvent>(_onFetchHome);
  }

  Future<void> _onFetchHome(HomeEvent event, Emitter<HomeState> emit) async {
    switch (event) {
      case FetchHomePageImageFileName():
        await runFetch(emit, () async {
          final fileName = await _repository.fetchHomePageImageFileName();
          return HomeState(
            homePageImageFileName: fileName,
            blocStatus: const BlocStatus(Status.ok),
          );
        });
    }
  }
}
