import 'package:tsirbunenpottery/core/state/app_bloc_event.dart';

sealed class ContactEvent extends AppBlocEvent {}

final class FetchOwnerPhoto extends ContactEvent {}
