import 'package:combine_proj/flow/data_input_page/modal/student_data.dart';
import 'package:combine_proj/flow/item_list_page/widgets/item.dart';
import 'package:combine_proj/utilities/screen_size/screen_size.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({
    super.key,
    required this.items,
  });
  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.width * 0.9,
      height: ScreenSize.height * 0.75,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          ItemModel item = items[index];
          return Item(
              itemName: item.itemName,
              itemPrice: item.itemPrice,
              itemId: item.itemId,
              itemImage: item.itemImage);
        },
      ),
    );
  }
}
