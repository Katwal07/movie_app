import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabTitleWidget extends StatelessWidget {
  const TabTitleWidget(
      {super.key,
      required this.title,
      required this.tap,
      required this.isSelected});

  final String title;
  final Function()? tap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 6.w),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                  color: isSelected ? Colors.blue : Colors.transparent, width: 1.h),
            ),
          ),
          child: Text(
            title,
            style: isSelected
                ? Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.blue,
                    )
                : Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    ),
          ),
        ),
      ),
    );
  }
}
