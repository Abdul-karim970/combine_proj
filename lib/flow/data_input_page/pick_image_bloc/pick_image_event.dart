part of 'pick_image_bloc.dart';

sealed class ImageEvents {
  const ImageEvents();
}

class PickImageEvent extends ImageEvents {}

class RemoveImageEvent extends ImageEvents {}
