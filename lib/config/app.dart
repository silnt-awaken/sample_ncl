import 'package:flutter/material.dart';

import '../ui/home_page.dart';

class ShipApp extends StatelessWidget {
  const ShipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NCL Assement',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
