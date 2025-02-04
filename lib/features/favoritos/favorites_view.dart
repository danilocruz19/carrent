import 'package:flutter/material.dart';
import 'package:nvvmproject/features/home/viewmodels/car_viewmodel.dart';
import 'package:provider/provider.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    final carModel = context.watch<CarViewmodel>();
    return Scaffold(
      body: carModel.listaFavoritos.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinearProgressIndicator(
                    color: Colors.redAccent,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nenhum carro reservardo!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: carModel.listaFavoritos.length, // Defina o itemCount
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(carModel.listaFavoritos[index].nomeDoCarro),
                  subtitle: Text(carModel.listaFavoritos[index].corDoCarro),
                );
              },
            ),
    );
  }
}
