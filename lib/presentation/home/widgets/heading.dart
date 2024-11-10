import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("What do you want to watch?",
    style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: const Color(0xffFFFFFF)),
    );
  }
}