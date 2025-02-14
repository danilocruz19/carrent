import 'package:flutter/material.dart';
import 'package:nvvmproject/features/home/viewmodels/car_viewmodel.dart';
import 'package:provider/provider.dart';

class EditCarPage extends StatefulWidget {
  final car; // A instância do carro que será editada

  const EditCarPage({super.key, required this.car});

  @override
  _EditCarPageState createState() => _EditCarPageState();
}

class _EditCarPageState extends State<EditCarPage> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializa o controller com o nome atual do carro
    _nameController.text = widget.car.nomeDoCarro;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Carro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome do Carro:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Digite o nome do carro',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Atualiza o nome do carro no modelo
                setState(() {
                  widget.car.nomeDoCarro = _nameController.text;
                });

                // Salva a mudança e volta para a tela anterior
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
