class LayoutEvent {}

class ChangeScrollPosition extends LayoutEvent {
  final double? position;
  final String target;
  ChangeScrollPosition({this.position, required this.target});
}
