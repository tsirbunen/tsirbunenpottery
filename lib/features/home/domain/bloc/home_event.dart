import 'package:tsirbunenpottery/core/state/bloc_utils/app_bloc_event.dart';

sealed class HomeEvent extends AppBlocEvent {}

final class FetchHomePageImageFileName extends HomeEvent {}
