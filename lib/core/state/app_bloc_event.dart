import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';

abstract class AppBlocEvent {}

class BlocStatusChanged extends AppBlocEvent {
  final BlocStatus status;
  BlocStatusChanged(this.status);
}
