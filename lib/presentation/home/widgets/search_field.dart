import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff67686D),
        borderRadius: BorderRadius.circular(12.r)
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:  Row(
          children: [
            Text('Search',style: TextStyle(color: const Color.fromARGB(255, 166, 166, 167),fontSize: 14.sp),),
            const Spacer(),
            const Icon(Icons.search,color: Color.fromARGB(255, 166, 166, 167),)
          ],
        ),
      ),
    );
  }
}