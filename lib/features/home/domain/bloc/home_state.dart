import 'package:equatable/equatable.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';

class HomeState extends Equatable {
  final BlocStatus blocStatus;
  final String? homePageImageFileName;

  const HomeState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.homePageImageFileName,
  });

  HomeState copyWith({BlocStatus? blocStatus}) => HomeState(
        blocStatus: blocStatus ?? this.blocStatus,
        homePageImageFileName: homePageImageFileName,
      );

  @override
  List<Object?> get props => [blocStatus, homePageImageFileName];
}
