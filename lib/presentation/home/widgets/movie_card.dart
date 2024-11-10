import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/configs/assets/app_images.dart';

class MovieCard extends StatelessWidget {
  final int?  id;
  final String posterPath;
  const MovieCard({super.key, this.id, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: (){},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.network(
               '${AppImages.movieImageBasePath}$posterPath',
              fit: BoxFit.cover,
              ),
        ),
      ),
    );
  }
}
