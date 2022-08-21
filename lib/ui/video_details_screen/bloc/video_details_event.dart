import 'package:equatable/equatable.dart';

class VideoDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetVideoDetailsEvent extends VideoDetailsEvent {
  final Map input;

  GetVideoDetailsEvent({required this.input});

  @override
  List<Object?> get props => throw [input];
}

class LikeVideoEvent extends VideoDetailsEvent {
  final Map input;

  LikeVideoEvent({required this.input});

  @override
  List<Object?> get props => throw [input];
}

class GetVideoCommentsEvent extends VideoDetailsEvent {
  final Map input;

  GetVideoCommentsEvent({required this.input});

  @override
  List<Object?> get props => throw [input];
}

class AddVideoCommentsEvent extends VideoDetailsEvent {
  final Map input;

  AddVideoCommentsEvent({required this.input});

  @override
  List<Object?> get props => throw [input];
}