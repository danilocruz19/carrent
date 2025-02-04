import 'package:flutter/material.dart';
import 'package:nvvmproject/configs/theme.dart';
import 'package:nvvmproject/home.dart';
import 'package:nvvmproject/features/home/viewmodels/car_viewmodel.dart';
import 'package:nvvmproject/features/home/car_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CarViewmodel()),
      ChangeNotifierProvider(create: (_) => ThemeApp()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeApp = context.watch<ThemeApp>();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeApp.themeOn
          ? ThemeData.dark(
              useMaterial3: false,
            )
          : ThemeData(
              useMaterial3: false,
              colorSchemeSeed: Colors.red,
            ),
      home: Home(),
    );
  }
}
