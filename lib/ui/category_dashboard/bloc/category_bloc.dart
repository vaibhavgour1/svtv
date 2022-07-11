import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/api/network.dart';
import 'package:svtvs/main.dart';
import 'package:svtvs/ui/category_dashboard/bloc/category_event.dart';
import 'package:svtvs/ui/category_dashboard/bloc/category_state.dart';
import 'package:svtvs/ui/category_dashboard/response/category_response.dart';
import 'package:svtvs/utility/constants.dart';

class CategoryDashBoardBloc
    extends Bloc<CategoryDashBoardEvent, CategoryDashBoardState> {
  CategoryDashBoardBloc() : super(CategoryDashBoardInitialState()) {
    on<GetCategoryDashBoardEvent>(getCategory);
  }

  Future<void> getCategory(GetCategoryDashBoardEvent event,
      Emitter<CategoryDashBoardState> emit) async {
    emit(CategoryDashBoardLoadingState());
    if(await Network.isConnected()){
      CategoryResponse response = await repository.getCategories();
      if(!response.error){
        emit(CategoryDashBoardSuccessState(categoryList: response.category!));
      } else{
        emit(CategoryDashBoardFailureState(message: response.message));
      }
    } else{
      emit(CategoryDashBoardFailureState(message: Constant.networkAlert));
    }
  }
}
