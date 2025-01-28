import 'package:flutter/material.dart';
import 'package:nvvmproject/viewmodels/car_viewmodel.dart';
import 'package:provider/provider.dart';

class AddNewCar extends StatefulWidget {
  const AddNewCar({super.key});

  @override
  State<AddNewCar> createState() => _AddNewCarState();
}

class _AddNewCarState extends State<AddNewCar> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerCor = TextEditingController();
  TextEditingController _controllerPreco = TextEditingController();
  TextEditingController _controllerFoto = TextEditingController();
  String _urlFoto = '';

  @override
  void initState() {
    super.initState();
    // Não é necessário adicionar nada no initState, pois o controller já está sendo criado diretamente
  }

  @override
  Widget build(BuildContext context) {
    final carModel = context.watch<CarViewmodel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do veículo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _controllerNome,
                decoration: InputDecoration(labelText: 'Nome do carro'),
              ),
              TextField(
                controller: _controllerPreco,
                decoration: InputDecoration(labelText: 'Valor do carro'),
              ),
              TextField(
                controller: _controllerCor,
                decoration: InputDecoration(labelText: 'Cor do carro'),
              ),
              TextField(
                controller: _controllerFoto,
                decoration: InputDecoration(labelText: 'URL Da foto do carro'),
                onChanged: (url) {
                  setState(() {
                    _urlFoto = url;
                  });
                },
              ),
              SizedBox(height: 20),
              _urlFoto.isNotEmpty
                  ? Container(
                      width: 200,
                      height: 200,
                      child: Image.network(_urlFoto),
                    )
                  : Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image,
                        color: Colors.grey[700],
                      ),
                    ),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    carModel.adicionarCarros(
                      _controllerNome.text,
                      _controllerCor.text,
                      double.parse(_controllerPreco.text),
                      _controllerFoto.text,
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Adicionar'))
            ],
          ),
        ),
      ),
    );
  }
}
