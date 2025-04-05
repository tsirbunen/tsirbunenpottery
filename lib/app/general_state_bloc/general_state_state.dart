import 'package:equatable/equatable.dart';
import 'package:madmudmobile/app/blocs/bloc_status.dart';
import 'package:madmudmobile/localization/languages.dart';

class GeneralState extends Equatable {
  final BlocStatus blocStatus;
  final Language language;

  const GeneralState({
    this.blocStatus = const BlocStatus(Status.ok),
    this.language = Language.en,
  });

  GeneralState copyWith({
    BlocStatus? newStatus,
    Language? newLanguage,
  }) {
    return GeneralState(
      blocStatus: newStatus ?? blocStatus,
      language: newLanguage ?? language,
    );
  }

  @override
  List<Object?> get props => [
        blocStatus,
        language,
      ];
}
