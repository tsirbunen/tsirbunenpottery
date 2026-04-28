import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/state/bloc_utils/fetch_bloc_mixin.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/contact_event.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/contact_state.dart';
import 'package:tsirbunenpottery/features/contact/repository/contact_repository.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState>
    with FetchBlocMixin<ContactEvent, ContactState> {
  final IContactRepository _repository;

  @override
  final AppLogger logger;

  @override
  bool get isLoaded => state.ownerPhotoFileName != null;

  @override
  String get fetchErrorMessage => 'Failed to fetch owner photo';

  @override
  ContactState withStatus(BlocStatus status) => state.copyWith(blocStatus: status);

  ContactBloc(this._repository, {required this.logger}) : super(const ContactState()) {
    on<ContactEvent>(_onFetchContact);
  }

  Future<void> _onFetchContact(ContactEvent event, Emitter<ContactState> emit) async {
    switch (event) {
      case FetchOwnerPhoto():
        await runFetch(emit, () async {
          final fileName = await _repository.fetchOwnerPhotoFileName();
          return ContactState(
            ownerPhotoFileName: fileName,
            blocStatus: const BlocStatus(Status.ok),
          );
        });
    }
  }
}
