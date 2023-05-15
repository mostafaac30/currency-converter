import 'package:flutter/material.dart';

import '../utils/color_manager.dart';
import '../utils/strings_manager.dart';

class DismissibleWidget extends StatefulWidget {
  void Function()? onTap;
  void Function()? onSwipeRight;
  void Function()? onSwipeLeft;
  String rightText;
  String leftText;
  Color rightColor;
  Color leftColor;
  IconData? rightIcon;
  IconData? leftIcon;
  final Key dismissibleKey;
  final Widget child;

  DismissibleWidget({
    required this.dismissibleKey,
    this.onTap,
    this.onSwipeRight,
    this.rightText = '',
    this.rightColor = Colors.green,
    this.rightIcon,
    this.onSwipeLeft,
    this.leftText = '',
    this.leftColor = ColorManager.secondary2Color,
    this.leftIcon,
    required this.child,
  }) : super(key: dismissibleKey);

  @override
  State<DismissibleWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<DismissibleWidget> {
  late DismissDirection dismissDirection;
  @override
  void initState() {
    if (widget.onSwipeRight == null && widget.onSwipeLeft == null) {
      throw Exception(
          'You must provide at least one of onSwipeRight or onSwipeLeft');
    } else if (widget.onSwipeRight == null) {
      dismissDirection = DismissDirection.startToEnd;
    } else if (widget.onSwipeLeft == null) {
      dismissDirection = DismissDirection.endToStart;
    } else {
      dismissDirection = DismissDirection.horizontal;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: widget.dismissibleKey,
      background: Container(
        color: widget.leftColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Icon(widget.leftIcon, color: Colors.white),
            const SizedBox(width: 16),
            Text(widget.leftText, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 16),
          ],
        ),
      ),
      secondaryBackground: Container(
        color: widget.rightColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 16),
            Icon(widget.rightIcon, color: Colors.white),
            const SizedBox(width: 16),
            Text(widget.rightText, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 16),
          ],
        ),
      ),
      direction: dismissDirection,
      onDismissed: (direction) {
        // widget.onSwipe?.call();
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(),
        //     duration: const Duration(seconds: 2),
        //   ),
        // );

        if (direction == DismissDirection.startToEnd) {
          widget.onSwipeLeft?.call();
        } else {
          widget.onSwipeRight?.call();
        }
      },
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          final bool? shouldDismiss = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(AppStrings.confirm),
                content: const Text(AppStrings.areYouSure),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text(AppStrings.confirm),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text(AppStrings.cancel),
                  ),
                ],
              );
            },
          );
          return shouldDismiss ?? false;
        } else {
          return true;
        }
      },
      child: widget.child,
    );
  }
}
