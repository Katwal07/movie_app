import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/search_movie_usecase.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';
import 'package:movie_app/service_locator.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(): super(SearchInitial());

  void search(String query) async{
    emit(SearchLoading());
    var returnedData = await sl<SearchMovieUsecase>().call(params: query);
    returnedData.fold(
      (error){
        emit(SearchFailure(appError: error));
      },
      (data){
        emit(SearchLoaded(movie: data));
      }
    );
  }
}