import 'package:combine_proj/service/image_picker/image_picker.dart';
import 'package:combine_proj/service/shared_pref/shared_pref.dart';
import 'package:combine_proj/service/shared_pref/shared_pref_constants.dart';
import 'package:combine_proj/utilities/assets/assets_paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'pick_image_event.dart';
part 'pick_image_state.dart';

class PickImageBloc extends Bloc<ImageEvents, PickImageState> {
  ImagePickerService imagePickerService = ImagePickerService();
  PickImageBloc()
      : super(const PickImageInitialState(image: AssetsPath.pickFileImage)) {
    on<PickImageEvent>((event, emit) async {
      emit(PickImageLoadingState());
      try {
        XFile? xFile = await imagePickerService.pickImage();
        if (xFile == null) {
          if (!SharedPrefService.isDataInGivenRef(
              SharedPrefConstants.savePickedImageState)) {
            emit(const PickImageInitialState(image: AssetsPath.pickFileImage));
          } else {
            String? loadedImage = SharedPrefService.instance
                .getString(SharedPrefConstants.savePickedImageState);
            emit(PickImageLoadedState(image: loadedImage!));
          }
        } else {
          emit(PickImageLoadedState(image: xFile.path));
          SharedPrefService.instance.setString(
              SharedPrefConstants.savePickedImageState,
              (state as PickImageLoadedState).image);
        }
      } catch (e) {
        emit(const PickImageInitialState(image: AssetsPath.pickFileImage));
      }
    });
    on<RemoveImageEvent>(
      (event, emit) {
        SharedPrefService.removeDataOnKey(
            SharedPrefConstants.savePickedImageState);

        emit(const RemovedImageState(image: AssetsPath.pickFileImage));
      },
    );
  }
}
