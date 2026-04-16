import 'package:tsirbunenpottery/core/state/app_bloc_event.dart';

export 'package:tsirbunenpottery/core/state/app_bloc_event.dart' show BlocStatusChanged;

class CategoriesEvent extends AppBlocEvent {}

class FetchCategories extends CategoriesEvent {}
