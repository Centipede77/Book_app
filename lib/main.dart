import 'package:flutter/material.dart';
import 'services/hive_service.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}