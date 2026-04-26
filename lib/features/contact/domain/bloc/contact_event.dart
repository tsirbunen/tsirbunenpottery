import 'package:tsirbunenpottery/core/state/bloc_utils/app_bloc_event.dart';

sealed class ContactEvent extends AppBlocEvent {}

final class FetchOwnerPhoto extends ContactEvent {}
