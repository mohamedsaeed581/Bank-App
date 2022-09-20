import 'package:flutter/material.dart';
import 'package:transaction_money/cubit/cubit.dart';
import 'package:transaction_money/screen/home_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  HomeScreen(),
      debugShowCheckedModeBanner: false,
    );

  }
}
