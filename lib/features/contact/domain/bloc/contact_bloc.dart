import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/contact_event.dart';
import 'package:tsirbunenpottery/features/contact/domain/models/contact_state/contact_state.dart';
import 'package:tsirbunenpottery/features/contact/repository/contact_repository.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository _repository;
  final AppLogger _logger;

  ContactBloc(this._repository, {required AppLogger logger})
      : _logger = logger,
        super(const ContactState()) {
    on<ContactEvent>(_onEvent);
  }

  Future<void> _onEvent(ContactEvent event, Emitter<ContactState> emit) async {
    switch (event) {
      case FetchOwnerPhoto():
        await _onFetch(emit);
    }
  }

  Future<void> _onFetch(Emitter<ContactState> emit) async {
    if (state.blocStatus.isLoading || state.ownerPhotoFileName != null) return;
    emit(state.copyWith(blocStatus: const BlocStatus(Status.loading)));
    try {
      final fileName = await _repository.fetchOwnerPhotoFileName();
      emit(ContactState(
        ownerPhotoFileName: fileName,
        blocStatus: const BlocStatus(Status.ok),
      ));
    } catch (e, s) {
      _logger.logError('Failed to fetch owner photo', error: e, stackTrace: s, tag: 'ContactBloc');
      emit(state.copyWith(blocStatus: BlocStatus(Status.error, message: e.toString())));
    }
  }
}
