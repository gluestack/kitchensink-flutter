import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class KSRespRowCol extends StatelessWidget {
  final double? constraintWidth;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Clip clipBehavior;
  final Axis? direction;
  final EdgeInsets? seperatorPadding;
  // final double? sw;

  const KSRespRowCol({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
    this.direction,
    this.seperatorPadding,
    this.constraintWidth = 768,
    // this.sw,
  });

  @override
  Widget build(BuildContext context) {
    bool isScreenSmallerThan(double size, BuildContext context) {
      final screenWidth = MediaQuery.sizeOf(context).width;
      return screenWidth <= size;
    }

    bool isSmallScreen = isScreenSmallerThan(constraintWidth!, context);

    return Flex(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.stretch : crossAxisAlignment,
      clipBehavior: clipBehavior,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      direction: direction ?? (isSmallScreen ? Axis.vertical : Axis.horizontal),
      children: children.map((e) {
        return !isSmallScreen
            ? Expanded(
                child: GSBox(
                    style: GSStyle(
                      padding: seperatorPadding ??
                          const EdgeInsets.symmetric(horizontal: 4),
                    ),
                    child: e),
              )
            : GSBox(
                style: GSStyle(
                  padding: seperatorPadding ??
                      const EdgeInsets.symmetric(vertical: 4),
                ),
                child: e);
      }).toList(),
    );
  }
}
