import 'package:flutter/material.dart';

import '../utils/strings_manager.dart';

class LoadMoreButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoadMoreButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(AppStrings.loadMore),
      ),
    );
  }
}
