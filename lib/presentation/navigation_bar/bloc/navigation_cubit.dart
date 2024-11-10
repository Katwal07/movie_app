import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/navigation_bar/bloc/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationPageState> {
  NavigationCubit() : super(NavigationPageState(tabIndex: 0));

  void navigateToPage(int index){
    emit(NavigationPageState(tabIndex: index));
  }
}
