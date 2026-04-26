import 'package:tsirbunenpottery/core/state/bloc_utils/app_bloc_event.dart';

sealed class CollectionsEvent extends AppBlocEvent {}

final class FetchCollections extends CollectionsEvent {}
