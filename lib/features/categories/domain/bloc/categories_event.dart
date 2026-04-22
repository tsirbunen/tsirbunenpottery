import 'package:tsirbunenpottery/core/state/app_bloc_event.dart';

sealed class CategoriesEvent extends AppBlocEvent {}

final class FetchCategories extends CategoriesEvent {}
