import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_event.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_state.dart';

class GeneralStateBloc extends Bloc<GeneralStateEvent, GeneralState> {
  GeneralStateBloc() : super(const GeneralState()) {
    on<GeneralStateEvent>(_onEvent);
  }

  Future<void> _onEvent(
    GeneralStateEvent event,
    Emitter<GeneralState> emit,
  ) async {
    return switch (event) {
      final ChangeLanguage e => _onChangeLanguage(e, emit),
      final GeneralStateEvent _ => emit(state),
    };
  }

  Future<void> _onChangeLanguage(
      ChangeLanguage event, Emitter<GeneralState> emit) async {
    emit(state.copyWith(newLanguage: event.language));
  }
}
