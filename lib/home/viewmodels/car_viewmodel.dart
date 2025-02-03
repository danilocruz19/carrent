import 'package:flutter/material.dart';
import 'package:nvvmproject/home/models/car_model.dart';
import 'package:intl/intl.dart';

class CarViewmodel extends ChangeNotifier {
  final CarModel _carModel = CarModel();

  get carModel => _carModel;

  List<CarModel> listaDeCarros = [];
  List<CarModel> listaFavoritos = [];

  void adicionarCarros(String nomeDoCarro, String corDoCarro,
      double valorDoCarro, String fotoDoCarro) {
    listaDeCarros.add(
      CarModel(
          nomeDoCarro: nomeDoCarro,
          valorDoCarro: valorDoCarro,
          corDoCarro: corDoCarro,
          fotoDoCarro: fotoDoCarro),
    );
    notifyListeners();
  }

  String numberFormatter(double valor) {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatter.format(valor);
  }

  void adicionarFav(index) {
    listaFavoritos.add(listaDeCarros[index]);
  }
}
