import 'package:flutter/material.dart';
import 'package:nvvmproject/favoritos/favorites_view.dart';
import 'package:nvvmproject/home/car_view.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("CarRent"),
        centerTitle: true,
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
