// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationListItems extends StatelessWidget {
  const NavigationListItems({super.key, required this.title, required this.onPressed, required this.accessPath,});

  final String title;
  final Function() onPressed;
  final String accessPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff242A32).withOpacity(0.7),
              blurRadius: 2,
            )
          ]
        ),
        child: ListTile(
          leading: SizedBox(
            width: 30,
            height: 30,
            child: SvgPicture.asset(accessPath,color: Colors.white,)),
            title: Text(title, style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),),
          
        ),
      ),
    );
  }
}