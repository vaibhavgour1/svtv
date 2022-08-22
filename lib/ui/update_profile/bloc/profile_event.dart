import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProfileDetailsEvent extends ProfileEvent {}

class ProfileImageUploadEvent extends ProfileEvent {
  final XFile imgFile;

  ProfileImageUploadEvent({required this.imgFile});

  @override
  List<Object?> get props => [imgFile];
}

class ProfileDetailsUploadEvent extends ProfileEvent {
  final Map input;

  ProfileDetailsUploadEvent({required this.input});

  @override
  List<Object?> get props => [input];
}
