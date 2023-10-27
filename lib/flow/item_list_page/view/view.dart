import 'package:combine_proj/exports/home_page.dart';
import 'package:combine_proj/flow/data_input_page/modal/student_data.dart';
import 'package:combine_proj/flow/item_list_page/bloc/fetch_item_bloc.dart';
import 'package:combine_proj/flow/item_list_page/controller/controller.dart';
import 'package:combine_proj/flow/item_list_page/modal/filter_model.dart';
import 'package:combine_proj/flow/item_list_page/widgets/filter_list_item.dart';
import 'package:combine_proj/flow/item_list_page/widgets/item_list_view.dart';
import 'package:combine_proj/utilities/app_widgets/appbar.dart';
import 'package:combine_proj/utilities/colors/colors.dart';
import 'package:combine_proj/utilities/constants/value_constants.dart';
import 'package:combine_proj/utilities/screen_size/screen_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemListController controller = ItemListController();
    return Scaffold(
      appBar: PracAppBar(context: context, pageTitle: 'Items'),
      body: Align(
        child: Column(
          children: [
            const VerticalSpacing(height: 0.02),
            SizedBox(
              height: ScreenSize.height * 0.07,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    left: ValueContants.value10, right: ValueContants.value10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.filters().length,
                itemBuilder: (context, index) {
                  ItemFilterModel itemFilterModel = controller.filters()[index];
                  return FilterItem(
                      onTap: () => context.read<FetchItemBloc>().add(
                          FetchItemEvent(
                              typeNameToFilter: itemFilterModel.item)),
                      filterName: itemFilterModel.item);
                },
              ),
            ),
            const VerticalSpacing(height: 0.02),
            BlocBuilder<FetchItemBloc, FetchItemState>(
              builder: (context, state) {
                if (state is FetchItemInitialState) {
                  return Text(state.initialText);
                } else if (state is FetchItemLoadingState) {
                  return CircularProgressIndicator(
                    color: AppColors.seconsaryColor,
                  );
                } else if (state is FetchItemLoadedState) {
                  List<ItemModel> items = state.items;
                  return ItemListView(
                    items: items,
                  );
                } else {
                  return Text((state as FetchItemErrorState).error);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
