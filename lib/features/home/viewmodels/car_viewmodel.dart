import 'package:flutter/material.dart';
import 'package:nvvmproject/features/home/models/car_model.dart';
import 'package:intl/intl.dart';

class CarViewmodel extends ChangeNotifier {
  final CarModel _carModel = CarModel();

  get carModel => _carModel;

  List<CarModel> listaDeCarros = [];
  List<CarModel> listaFavoritos = [];

  void adicionarCarros(
    String nomeDoCarro,
    String corDoCarro,
    double valorDoCarro,
    String fotoDoCarro,
    String cidadeDoCarro,
    String marcaDoCarro,
    bool automaticoCarro,
    String quilometragemCarro,
  ) {
    listaDeCarros.add(
      CarModel(
        nomeDoCarro: nomeDoCarro,
        valorDoCarro: valorDoCarro,
        corDoCarro: corDoCarro,
        fotoDoCarro: fotoDoCarro,
        cidadeCarro: cidadeDoCarro,
        marcaCarro: marcaDoCarro,
        quilometragemCarro: quilometragemCarro,
        automaticoCarro: automaticoCarro,
      ),
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

  void setAutomatico(bool value) {
    _carModel.automaticoCarro = value;
    notifyListeners();
  }
}
