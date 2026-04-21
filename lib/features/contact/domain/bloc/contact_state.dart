import 'package:equatable/equatable.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';

class ContactState extends Equatable {
  final BlocStatus blocStatus;
  final String? ownerPhotoFileName;

  const ContactState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.ownerPhotoFileName,
  });

  ContactState copyWith({BlocStatus? blocStatus}) => ContactState(
        blocStatus: blocStatus ?? this.blocStatus,
        ownerPhotoFileName: ownerPhotoFileName,
      );

  @override
  List<Object?> get props => [blocStatus, ownerPhotoFileName];
}
