import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/home/pages/home.dart';
import 'package:movie_app/presentation/navigation_bar/bloc/navigation_cubit.dart';
import 'package:movie_app/presentation/navigation_bar/bloc/navigation_state.dart';
import 'package:movie_app/presentation/profile/pages/profile.dart';
import 'package:movie_app/presentation/search/page/search.dart';
import 'package:movie_app/presentation/whishlist/page/whishlist.dart';

List<BottomNavigationBarItem> bottomNavigationBarItems =
    const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'search',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline),
    label: 'whishlist',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_2_outlined),
    label: 'profile',
  ),
];

List<Widget> bottomNavScreen = const <Widget>[
  HomeScreen(),
  SearchPage(),
  WhishlistPage(),
  ProfilePage(),
];

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state is NavigationPageState) {
          return Scaffold(
            body: bottomNavScreen.elementAt(state.tabIndex),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor:
                    const Color(0xff242A32), // Your desired background color
              ),
              child: BottomNavigationBar(
                items: bottomNavigationBarItems,
                currentIndex: state.tabIndex,
                selectedItemColor: const Color(0xff0296E5),
                unselectedItemColor: const Color(0xff67686D),
                onTap: (index) {
                  context.read<NavigationCubit>().navigateToPage(index);
                },
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
