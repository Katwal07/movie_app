import 'package:flutter/material.dart';
import 'package:movie_app/service_locator.dart';
import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

