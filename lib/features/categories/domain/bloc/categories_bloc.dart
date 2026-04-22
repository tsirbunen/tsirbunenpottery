import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_event.dart';
import 'package:tsirbunenpottery/features/categories/domain/models/categories_state/categories_state.dart';
import 'package:tsirbunenpottery/features/categories/repository/categories_repository.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _repository;
  final AppLogger _logger;

  CategoriesBloc(this._repository, {required AppLogger logger})
      : _logger = logger,
        super(const CategoriesState()) {
    on<CategoriesEvent>(_onEvent);
  }

  Future<void> _onEvent(
      CategoriesEvent event, Emitter<CategoriesState> emit) async {
    switch (event) {
      case FetchCategories():
        await _onFetch(emit);
    }
  }

  Future<void> _onFetch(Emitter<CategoriesState> emit) async {
    if (state.blocStatus.isLoading || state.categories.isNotEmpty) return;
    emit(state.copyWith(blocStatus:const BlocStatus(Status.loading)));
    try {
      final data = await _repository.getData();
      emit(CategoriesState(
        categories: data.categories,
        designsById: data.designsById,
        piecesById: data.piecesById,
        categoryDesigns: data.categoryDesigns,
        imageFileNamesByDesignId: data.imageFileNamesByDesignId,
        blocStatus: const BlocStatus(Status.ok),
      ));
    } catch (e, s) {
      _logger.logError('Failed to fetch categories', error: e, stackTrace: s, tag: 'CategoriesBloc');
      emit(state.copyWith(blocStatus: BlocStatus(Status.error, message: e.toString())));
    }
  }
}
