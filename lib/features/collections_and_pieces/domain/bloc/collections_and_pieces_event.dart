import 'package:madmudmobile/app/blocs/bloc_status.dart';

class CollectionsAndPiecesEvent {}

class BlocStatusChanged extends CollectionsAndPiecesEvent {
  final BlocStatus status;

  BlocStatusChanged(this.status);
}

class FetchPieces extends CollectionsAndPiecesEvent {
  FetchPieces();
}
