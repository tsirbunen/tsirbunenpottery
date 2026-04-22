import 'package:tsirbunenpottery/core/state/app_bloc_event.dart';

sealed class PiecesEvent extends AppBlocEvent {}

final class FetchPieces extends PiecesEvent {}
