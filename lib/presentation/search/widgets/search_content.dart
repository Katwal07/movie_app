import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/core/configs/routes/routes_name.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';

import '../bloc/search_state.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context,state){
        if(state is SearchLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(state is SearchLoaded){
          return GridView.builder(
            physics:const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6
            ), 
            itemBuilder: (context,index){
              final movieDetails = state.movie[index];
              return GestureDetector(
                onTap: ()=> Navigator.pushReplacementNamed(context, RoutesName.watchPage,arguments:movieDetails ),
                child: CategoryMovieCard(movieEntity: state.movie[index]));
            },
            itemCount: state.movie.length,
          );
        }
        return Container();
    }
  );
  }
}