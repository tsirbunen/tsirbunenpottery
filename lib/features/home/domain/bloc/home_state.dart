import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(BlocStatus(Status.ok)) BlocStatus blocStatus,
    String? homePageImageFileName,
  }) = _HomeState;
}
