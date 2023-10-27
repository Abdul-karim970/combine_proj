import 'package:combine_proj/exports/home_page.dart';
import 'package:combine_proj/flow/data_input_page/bloc/upload_student_data_bloc.dart';
import 'package:combine_proj/flow/data_input_page/controller/controller.dart';
import 'package:combine_proj/flow/data_input_page/pick_image_bloc/pick_image_bloc.dart';
import 'package:combine_proj/flow/data_input_page/type_drop_down/type_drop_down_bloc.dart';
import 'package:combine_proj/flow/data_input_page/widgets/image_picker_widget.dart';
import 'package:combine_proj/navigation/routes_name/rout_name.dart';
import 'package:combine_proj/service/firestore/firestore.dart';
import 'package:combine_proj/service/shared_pref/shared_pref.dart';
import 'package:combine_proj/service/shared_pref/shared_pref_constants.dart';
import 'package:combine_proj/utilities/app_widgets/app_textfield.dart';
import 'package:combine_proj/utilities/app_widgets/appbar.dart';
import 'package:combine_proj/utilities/colors/colors.dart';
import 'package:combine_proj/utilities/screen_size/screen_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputDataPage extends StatefulWidget {
  const InputDataPage({super.key});

  @override
  State<InputDataPage> createState() => _InputDataPageState();
}

class _InputDataPageState extends State<InputDataPage> {
  @override
  void initState() {
    DataInputPageController.initializeControllers();
    super.initState();
  }

  @override
  void dispose() {
    DataInputPageController.disposeController();
    SharedPrefService.removeDataOnKey(SharedPrefConstants.savePickedImageState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataInputPageController = DataInputPageController(context: context);
    return Scaffold(
      appBar: PracAppBar(context: context, pageTitle: 'Input Student'),
      body: Align(
        child: Column(
          children: [
            const VerticalSpacing(height: 0.02),
            Text(
              'Enter Item',
              style: AppTextStyle.appTextStyle1,
            ),
            const VerticalSpacing(height: 0.02),
            AppTextFormField(
                controller: DataInputPageController.rollNoController,
                hint: 'required*',
                label: 'Item id',
                keyboardType: TextInputType.number),
            const VerticalSpacing(height: 0.01),
            AppTextFormField(
                controller: DataInputPageController.nameController,
                hint: 'required*',
                label: 'Item name',
                keyboardType: TextInputType.name),
            const VerticalSpacing(height: 0.01),
            AppTextFormField(
              controller: DataInputPageController.phoneController,
              hint: 'required*',
              label: 'Item price',
              keyboardType: TextInputType.phone,
            ),
            const VerticalSpacing(height: 0.02),
            BlocBuilder<TypeDropDownBloc, DropDownTypeState>(
              builder: (context, state) => DropdownButton<String>(
                style: TextStyle(color: AppColors.seconsaryColor),
                value: state.value,
                hint: Text(state.value),
                items: [
                  for (int i = 0; i < FirestoreService.itemTypes.length; i++)
                    DropdownMenuItem(
                      value: FirestoreService.itemTypes[i],
                      child: Text(
                        FirestoreService.itemTypes[i],
                      ),
                    )
                ],
                onChanged: dataInputPageController.dropDownOnChange,
              ),
            ),
            const VerticalSpacing(height: 0.02),
            BlocBuilder<PickImageBloc, PickImageState>(
              builder: (context, state) {
                if (state is RemovedImageState) {
                  return ImagePickerWidget(
                    image: state.image,
                  );
                } else if (state is PickImageInitialState) {
                  return ImagePickerWidget(
                    image: state.image,
                  );
                } else if (state is PickImageLoadingState) {
                  return SizedBox(
                    width: ScreenSize.width * 5,
                    height: ScreenSize.height * 0.2,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.seconsaryColor,
                      ),
                    ),
                  );
                } else {
                  String image = (state as PickImageLoadedState).image;
                  return ImagePickerWidget(image: image);
                }
              },
            ),
            const VerticalSpacing(height: 0.03),
            CupertinoButton.filled(
                onPressed: dataInputPageController.uploadStudentDataOnTap,
                child:
                    BlocBuilder<UploadStudentDataBloc, UploadStudentDataState>(
                  builder: (context, state) {
                    if (state is UploadStudentDataInitialState) {
                      return Text(state.status);
                    } else if (state is UploadStudentDataLoadingState) {
                      return Text(state.status);
                    } else if (state is UploadStudentDataLoadedState) {
                      SchedulerBinding.instance
                          .addPostFrameCallback((timeStamp) {
                        dataInputPageController.clearStudentDataFields();
                        Navigator.pushNamed(
                            context, RoutsName.itemListPageName);
                      });
                      return Text(state.status);
                    } else {
                      return Text(
                          (state as UploadStudentDataErrorState).status);
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
