import 'package:flutter/material.dart';
import 'package:nvvmproject/configs/theme.dart';
import 'package:nvvmproject/features/configuracoes/configuracoes.dart';
import 'package:nvvmproject/features/favoritos/favorites_view.dart';
import 'package:nvvmproject/features/home/car_view.dart';
import 'package:nvvmproject/features/novos/novos.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexPage = 0;

  void mudarPage(int indexNovo) {
    setState(() {
      _indexPage = indexNovo;
    });
  }

  final List<Widget> _pages = [
    CarView(),
    FavoritesView(),
    Configuracoes(),
    Novos(),
  ];

  @override
  Widget build(BuildContext context) {
    final teste = context.watch<ThemeApp>();
    return Scaffold(
      appBar: AppBar(
        title: Text("CarRent"),
        centerTitle: true,
      ),
      body: _pages[_indexPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: mudarPage,
        currentIndex: _indexPage,
        selectedItemColor: teste.themeOn ? Colors.amber : Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[500],
        iconSize: 25,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Carros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Reservados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_bottom),
            label: 'Novos',
          )
        ],
      ),
    );
  }
}
