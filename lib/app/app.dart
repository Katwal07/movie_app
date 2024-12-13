import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/configs/routes/routes.dart';
import '../core/configs/routes/routes_name.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Builder(
        builder: (context) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie App',
            initialRoute: RoutesName.splashScreen,
            onGenerateRoute: Routes.generateRoute,
          );
        }
      ),
    );
  }
}