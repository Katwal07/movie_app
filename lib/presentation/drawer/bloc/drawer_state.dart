abstract class DrawerState {}

class DrawerItemClicked extends DrawerState{
  final int currentIndex;

  DrawerItemClicked({required this.currentIndex});
}