import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/drawer/bloc/drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState>{
  DrawerCubit(): super(DrawerItemClicked(currentIndex: 0));

  void onDrawerItemClicked(int index){
    emit(DrawerItemClicked(currentIndex: index));
  }

}