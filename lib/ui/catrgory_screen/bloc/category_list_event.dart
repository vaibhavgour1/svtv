import 'package:equatable/equatable.dart';

class CategoryListEvent extends Equatable {
  @override
  List<Object?> get props => throw [];
}

class GetCategoryListEvent extends CategoryListEvent {
  final Map input;

  GetCategoryListEvent({required this.input});

  @override
  List<Object?> get props => throw [input];
}
