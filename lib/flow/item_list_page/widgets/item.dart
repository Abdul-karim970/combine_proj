import 'package:cached_network_image/cached_network_image.dart';
import 'package:combine_proj/exports/home_page.dart';
import 'package:combine_proj/utilities/colors/colors.dart';
import 'package:combine_proj/utilities/constants/value_constants.dart';
import 'package:combine_proj/utilities/screen_size/screen_size.dart';

class Item extends StatelessWidget {
  const Item(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.itemId,
      required this.itemImage});
  final String itemName;
  final String itemPrice;
  final String itemId;
  final String itemImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenSize.height * 0.01, bottom: ScreenSize.height * 0.01),
      child: CachedNetworkImage(
        imageUrl: itemImage,
        imageBuilder: (context, imageProvider) => Container(
          padding: EdgeInsets.only(left: ScreenSize.width * 0.05),
          width: ScreenSize.width * 0.7,
          height: ScreenSize.height * 0.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ValueContants.value10),
              boxShadow: const [
                BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 5,
                    offset: Offset(2, 2))
              ],
              image: DecorationImage(
                  opacity: 0.5, fit: BoxFit.fill, image: imageProvider)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemTextWidget(text: itemId),
              const VerticalSpacing(height: 0.02),
              const VerticalSpacing(height: 0.02),
              ItemTextWidget(text: itemPrice),
              const VerticalSpacing(height: 0.02),
              ItemTextWidget(text: itemName),
              const VerticalSpacing(height: 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

// Text widget

class ItemTextWidget extends StatelessWidget {
  const ItemTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.primaryColor, fontSize: ScreenSize.radius * 0.00007),
    );
  }
}
