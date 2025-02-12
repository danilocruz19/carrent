import 'package:flutter/material.dart';
import 'package:nvvmproject/features/home/viewmodels/car_viewmodel.dart';
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
  TextEditingController _controllerMarca = TextEditingController();
  TextEditingController _controllerQuilo = TextEditingController();
  TextEditingController _controllerCidade = TextEditingController();

  String _urlFoto = '';
  bool automaticoOuNao = false;

  @override
  void initState() {
    super.initState();
    // Não é necessário adicionar nada no initState, pois o controller já está sendo criado diretamente
  }

  @override
  Widget build(BuildContext context) {
    final carModel = context.watch<CarViewmodel>();
    GlobalKey<FormState> _key = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do veículo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _controllerMarca,
                  decoration: InputDecoration(labelText: 'Marca do carro'),
                ),
                TextField(
                  controller: _controllerNome,
                  decoration: InputDecoration(labelText: 'Nome do carro'),
                ),
                TextField(
                  controller: _controllerQuilo,
                  decoration:
                      InputDecoration(labelText: 'Quilometragem do carro'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _controllerCidade,
                  decoration: InputDecoration(labelText: 'Cidade do carro'),
                ),
                TextField(
                  controller: _controllerPreco,
                  decoration: InputDecoration(labelText: 'Valor do carro'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _controllerCor,
                  decoration: InputDecoration(labelText: 'Cor do carro'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                    return null;
                  },
                  controller: _controllerFoto,
                  decoration:
                      InputDecoration(labelText: 'URL Da foto do carro'),
                  onChanged: (url) {
                    setState(() {
                      _urlFoto = url;
                    });
                  },
                ),
                CheckboxListTile(
                  value: automaticoOuNao,
                  onChanged: (value) {
                    setState(() {
                      automaticoOuNao = value!;
                    });
                  },
                  title: Text(
                    'Automático',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                      if (_key.currentState?.validate() ?? false) {
                        carModel.adicionarCarros(
                          _controllerNome.text,
                          _controllerCor.text,
                          double.parse(_controllerPreco.text),
                          _controllerFoto.text,
                          _controllerCidade.text,
                          _controllerMarca.text.toUpperCase(),
                          automaticoOuNao,
                          _controllerQuilo.text,
                        );

                        Navigator.pop(context);
                      }
                    },
                    child: Text('Adicionar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
