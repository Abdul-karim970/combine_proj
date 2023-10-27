part of 'pick_image_bloc.dart';

sealed class PickImageState {
  const PickImageState();
}

class PickImageInitialState extends PickImageState {
  final String image;
  const PickImageInitialState({required this.image});
}

class PickImageLoadingState extends PickImageState {}

class PickImageLoadedState extends PickImageState {
  final String image;
  const PickImageLoadedState({required this.image});
}

class RemovedImageState extends PickImageState {
  final String image;
  const RemovedImageState({required this.image});
}
