import 'package:flutter/material.dart';
import 'package:nvvmproject/configs/theme.dart';
import 'package:nvvmproject/features/favoritos/favorites_view.dart';
import 'package:nvvmproject/features/home/car_view.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexPage = 0;
  PageController _pageController = PageController();

  void mudarPage(int indexNovo) {
    setState(() {
      _indexPage = indexNovo;
    });
  }

  final List<Widget> _pages = [
    CarView(),
    FavoritesView(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeApp = context.watch<ThemeApp>();
    return Scaffold(
      appBar: AppBar(
        title: Text("CarRent"),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 29, 28, 28),
        child: DrawerHeader(
            child: Column(
          children: [
            SwitchListTile(
              value: themeApp.themeOn,
              onChanged: (value) => themeApp.mudarThema(value),
              title: Text(
                'Modo noturno',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              activeColor: Colors.green,
            )
          ],
        )),
      ),
      body: _pages[_indexPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: mudarPage,
        currentIndex: _indexPage,
        unselectedItemColor: Colors.grey[500],
        iconSize: 25,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Carros',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Reservados'),
        ],
      ),
    );
  }
}
