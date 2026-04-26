import 'package:tsirbunenpottery/core/state/bloc_utils/app_bloc_event.dart';

sealed class DesignsEvent extends AppBlocEvent {}

final class FetchDesigns extends DesignsEvent {}
