import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic/generic_state.dart';
import 'package:movie_app/core/enum/app_error_type.dart';
import 'package:movie_app/core/error/app_error.dart';
import 'package:movie_app/core/usecase/usecase.dart';

class GenericCubit extends Cubit<GenericDataState>{
  GenericCubit(): super(DataInitial());

  Future<void> execute<T> (Usecase usecase ,{dynamic params}) async{
    emit(DataLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      var returnedData = await usecase.call(params: params);
    return returnedData.fold(
      (error){
        emit(FailureDataLoad(appError: error));
      }, 
      (data){
        emit(DataLoaded(data: data,defaultIndex: 0));
      }
    );
    } catch (e) {
      emit(FailureDataLoad(appError: AppError(AppErrorType.unknown,message: e.toString())));
    }
  }
}