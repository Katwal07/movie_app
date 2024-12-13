import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowSnackbar {
  static void displayMessage(BuildContext context, String message, Color color) {
    var snackBar = SnackBar(
      content: CustomFlashMessage(message: message, color: color,),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


class CustomFlashMessage extends StatelessWidget {
  const CustomFlashMessage({
    super.key, required this.message, required this.color,
  });

  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      
        
        Container(
          height: 90.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 55, 55, 55),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Text(
              message,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
          Positioned(
          top: 0,
          left: 0,
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      ],
    );
  }
}