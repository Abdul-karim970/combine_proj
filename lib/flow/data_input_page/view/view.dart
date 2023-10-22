import 'package:combine_proj/exports/home_page.dart';
import 'package:combine_proj/flow/data_input_page/bloc/upload_student_data_bloc.dart';
import 'package:combine_proj/flow/data_input_page/controller/controller.dart';
import 'package:combine_proj/utilities/app_widgets/app_textfield.dart';
import 'package:combine_proj/utilities/app_widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
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
              'Enter Students',
              style: AppTextStyle.appTextStyle1,
            ),
            const VerticalSpacing(height: 0.02),
            AppTextFormField(
                controller: DataInputPageController.rollNoController,
                hint: 'required*',
                label: 'Roll no',
                keyboardType: TextInputType.number),
            const VerticalSpacing(height: 0.01),
            AppTextFormField(
                controller: DataInputPageController.nameController,
                hint: 'required*',
                label: 'Name',
                keyboardType: TextInputType.name),
            const VerticalSpacing(height: 0.01),
            AppTextFormField(
              controller: DataInputPageController.phoneController,
              hint: 'required*',
              label: 'Cell phone',
              keyboardType: TextInputType.phone,
            ),
            const VerticalSpacing(height: 0.02),
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
