import 'package:combine_proj/utils/screen_size/screen_size.dart';
import 'package:flutter/widgets.dart';

// Vertical spacing
class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({super.key, required this.height, this.child});
  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.height * height,
    );
  }
}

// Horizontal spacing

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({super.key, required this.width, this.child});
  final double width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.width * width,
      child: child,
    );
  }
}
