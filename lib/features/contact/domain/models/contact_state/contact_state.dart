import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';

part 'contact_state.freezed.dart';

@freezed
abstract class ContactState with _$ContactState {
  const factory ContactState({
    @Default(BlocStatus(Status.ok)) BlocStatus blocStatus,
    String? ownerPhotoFileName,
  }) = _ContactState;
}
