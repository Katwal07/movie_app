import 'package:flutter/material.dart';
import 'package:movie_app/core/constant/colors.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? content;
  final double? width;
  final double? height;
  const BasicAppButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.content,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
         style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: onSurfaceColor,
    // disabledForegroundColor: AppColor.buttonDisabled,
    // disabledBackgroundColor: AppColor.buttonDisabled,
    side: const BorderSide(color: Colors.blue),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
      child: content ??
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: onSurfaceContainerColor),
          ),
    );
  }
}
