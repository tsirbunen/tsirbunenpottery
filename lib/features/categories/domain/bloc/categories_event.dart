import 'package:tsirbunenpottery/core/state/bloc_utils/app_bloc_event.dart';

sealed class CategoriesEvent extends AppBlocEvent {}

final class FetchCategories extends CategoriesEvent {}
