import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/configs/routes/routes_name.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration:  BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16.r))
              ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("What do you want to watch?",
            style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,),
            ),
            GestureDetector(
              onTap: ()=>  Navigator.pushNamed(context, RoutesName.searchPage),
              child: Container(
                height: 50,
                width: 50,
                decoration:  BoxDecoration(
                  color:  const Color.fromARGB(255, 104, 103, 103),
                  borderRadius: BorderRadius.all(Radius.circular(16.r))
                ),
                child: const Icon(Icons.search,color: Colors.white,)),
            )
          ],
        ),
      ),
    );
  }
}