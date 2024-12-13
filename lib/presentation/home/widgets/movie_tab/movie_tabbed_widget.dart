import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/core/configs/routes/routes_name.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/presentation/home/widgets/movie_tab/movie_tabbed_constant.dart';
import 'package:movie_app/presentation/home/widgets/movie_tab/tab_widget.dart';

class MovieTabbedWidget extends StatelessWidget {
  const MovieTabbedWidget({super.key, required this.selectedTabIndex, required this.onTabSelected, required this.tabData,});

  final int selectedTabIndex;
  final Function(int) onTabSelected;
  final List<MovieEntity>? tabData;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 5.h),
    child: Column(
      children: [
        Row(
          children: [
            for(var i=0 ; i < MovieTabbedConstant.movieTab.length ; i++)
            TabTitleWidget(
              title: MovieTabbedConstant.movieTab[i].title, 
              tap: ()=> onTabSelected(i), 
              isSelected: MovieTabbedConstant.movieTab[i].index == selectedTabIndex
            ),
          ],
        ),
        if(tabData != null)
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                final movieDetails = tabData![index];
                return GestureDetector(
                  onTap: ()=> Navigator.pushNamed(context,RoutesName.watchPage, arguments: movieDetails),
                  child: CategoryMovieCard(movieEntity: tabData![index]));
              }, 
               separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: tabData!.length,
            ),
          ),
        
      ],
    ),
    );
  }
}