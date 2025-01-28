import 'package:flutter/material.dart';
import 'package:nvvmproject/home.dart';
import 'package:nvvmproject/viewmodels/car_viewmodel.dart';
import 'package:nvvmproject/viewmodels/counter_viewmodel.dart';
import 'package:nvvmproject/views/car_view.dart';
import 'package:nvvmproject/views/counter_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterViewmodel()),
      ChangeNotifierProvider(create: (_) => CarViewmodel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
        useMaterial3: false,
      ),
      home: Home(),
    );
  }
}
