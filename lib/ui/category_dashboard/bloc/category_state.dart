import 'package:equatable/equatable.dart';
import 'package:svtvs/ui/category_dashboard/response/category_response.dart';

class CategoryDashBoardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryDashBoardInitialState extends CategoryDashBoardState {}

class CategoryDashBoardLoadingState extends CategoryDashBoardState {}

class CategoryDashBoardSuccessState extends CategoryDashBoardState {
  final List<CategoryList> categoryList;

  CategoryDashBoardSuccessState({required this.categoryList});

  @override
  List<Object?> get props => [categoryList];
}

class CategoryDashBoardFailureState extends CategoryDashBoardState {
  final String message;

  CategoryDashBoardFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
