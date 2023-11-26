import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woo_ah_yeah/init_screen.dart';
import 'package:woo_ah_yeah/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isInit = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? isInitPref = prefs.getString('childName');

    if (isInitPref != null) {
      setState(() {
        isInit = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '우아예',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: isInit ? const MainScreen() : const InitScreen(),
    );
  }
}
