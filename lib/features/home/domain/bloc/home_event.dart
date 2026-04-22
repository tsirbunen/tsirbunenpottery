import 'package:tsirbunenpottery/core/state/app_bloc_event.dart';

sealed class HomeEvent extends AppBlocEvent {}

final class FetchHomePageImageFileName extends HomeEvent {}
