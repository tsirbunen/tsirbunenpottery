import 'package:equatable/equatable.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';

class CollectionsAndPiecesState extends Equatable {
  final BlocStatus blocStatus;

  const CollectionsAndPiecesState({
    this.blocStatus = const BlocStatus(Status.ok),
  });

  CollectionsAndPiecesState copyWith({
    BlocStatus? newStatus,
  }) {
    return CollectionsAndPiecesState(
      blocStatus: newStatus ?? blocStatus,
    );
  }

  @override
  List<Object?> get props => [
        blocStatus,
      ];
}
