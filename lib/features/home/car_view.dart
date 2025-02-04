import 'package:flutter/material.dart';
import 'package:nvvmproject/features/home/viewmodels/car_viewmodel.dart';
import 'package:nvvmproject/features/car_add/add_new_car.dart';
import 'package:provider/provider.dart';

class CarView extends StatefulWidget {
  const CarView({super.key});

  @override
  State<CarView> createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  @override
  Widget build(BuildContext context) {
    final carModel = context.watch<CarViewmodel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[500]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddNewCar()));
                },
                child: Text('Adicionar novo carro')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  carModel.listaDeCarros.clear();
                });
              },
              child: Text("Apagar carros"),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: carModel.listaDeCarros.length,
                itemBuilder: (context, index) {
                  final car = carModel.listaDeCarros[index];
                  final isFavorite = carModel.listaFavoritos.contains(car);
                  return SizedBox(
                    height: 290,
                    child: Card(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.grey[100],
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                child: Image.network(
                                  carModel.listaDeCarros[index].fotoDoCarro,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        carModel
                                            .listaDeCarros[index].nomeDoCarro,
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Valor: ${carModel.numberFormatter(
                                          carModel.listaDeCarros[index]
                                                  .valorDoCarro ??
                                              0.0,
                                        )}',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 60,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Cor: ${carModel.listaDeCarros[index].corDoCarro}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: isFavorite
                                                ? Theme.of(context).primaryColor
                                                : Colors.green,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (isFavorite) {
                                                // Se o carro já estiver nos favoritos, remova-o
                                                carModel.listaFavoritos
                                                    .remove(car);
                                              } else {
                                                // Se o carro não estiver nos favoritos, adicione-o
                                                carModel.adicionarFav(index);
                                              }
                                            });
                                          },
                                          child: isFavorite
                                              ? Text('Reservardo')
                                              : Text('Reservar'),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
