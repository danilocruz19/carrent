import 'package:flutter/material.dart';
import 'package:nvvmproject/features/home/models/car_model.dart';
import 'package:nvvmproject/features/home/viewmodels/car_viewmodel.dart';
import 'package:provider/provider.dart';

class Novos extends StatefulWidget {
  const Novos({super.key});

  @override
  State<Novos> createState() => _NovosState();
}

class _NovosState extends State<Novos> {
  @override
  Widget build(BuildContext context) {
    final carModel = context.watch<CarViewmodel>();

    List<CarModel> carros = carModel.listaDeCarros.where((tr) {
      return tr.valorDoCarro! >= 100000;
    }).toList();

    return Scaffold(
      body: carros.isEmpty
          ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Nenhum carro encontrado!'),
                ],
              ),
          )
          : ListView.builder(
              itemCount: carros.length,
              itemBuilder: (context, index) {
                final car = carros[index];
                return ListTile(
                  title: Text(car.nomeDoCarro),
                  subtitle: Text(
                    carModel.numberFormatter(car.valorDoCarro ?? 0.0),
                  ),
                );
              },
            ),
    );
  }
}
