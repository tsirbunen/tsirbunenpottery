import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/layout_bloc/layout_event.dart';
import 'package:madmudmobile/app/layout_bloc/layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  // Note 1: The key can be for example pageName for a product view vertical scroll
  // position or the id of a category for a sub view horizontal scroll position
  // Note 2: We do not want to store the scroll position data in the state
  // because we never rebuild widgets based on this data. We only query it
  // when we initialize a scrollable widget.
  Map<String, double> scrollPositions;

  LayoutBloc({required this.scrollPositions}) : super(const LayoutState()) {
    on<LayoutEvent>(_onEvent);
  }

  Future<void> _onEvent(
    LayoutEvent event,
    Emitter<LayoutState> emit,
  ) async {
    return switch (event) {
      final ChangeScrollPosition e => _onChangeScrollPosition(e, emit),
      final LayoutEvent _ => emit(state),
    };
  }

  Future<void> _onChangeScrollPosition(
      ChangeScrollPosition event, Emitter<LayoutState> emit) async {
    if (event.position == null && scrollPositions.containsKey(event.target)) {
      scrollPositions.remove(event.target);
    } else {
      scrollPositions[event.target] = event.position!;
    }
  }

  double getScrollPosition(String target) {
    return scrollPositions[target] ?? 0.0;
  }
}
