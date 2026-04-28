import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/state/bloc_utils/fetch_bloc_mixin.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_event.dart';
import 'package:tsirbunenpottery/features/categories/domain/bloc/categories_state.dart';
import 'package:tsirbunenpottery/features/categories/repository/categories_repository.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState>
    with FetchBlocMixin<CategoriesEvent, CategoriesState> {
  final ICategoriesRepository _repository;

  @override
  final AppLogger logger;

  @override
  bool get isLoaded => state.categories.isNotEmpty;

  @override
  String get fetchErrorMessage => 'Failed to fetch categories';

  @override
  CategoriesState withStatus(BlocStatus status) => state.copyWith(blocStatus: status);

  CategoriesBloc(this._repository, {required this.logger}) : super(const CategoriesState()) {
    on<CategoriesEvent>(_onFetchCategories);
  }

  Future<void> _onFetchCategories(CategoriesEvent event, Emitter<CategoriesState> emit) async {
    switch (event) {
      case FetchCategories():
        await runFetch(emit, () async {
          final data = await _repository.getData();
          return CategoriesState(
            categories: data.categories,
            designsById: data.designsById,
            piecesById: data.piecesById,
            categoryDesigns: data.categoryDesigns,
            imageFileNamesByDesignId: data.imageFileNamesByDesignId,
            blocStatus: const BlocStatus.ok(),
          );
        });
    }
  }
}
