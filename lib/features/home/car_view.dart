import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nvvmproject/features/edit_car/edit_car_view.dart';
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    carModel.listaDeCarros[index].marcaCarro,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 87, 86, 86),
                                    ),
                                  ),
                                  Text(
                                    carModel.listaDeCarros[index].nomeDoCarro,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.road,
                                        size: 15,
                                        color: Colors.grey[700],
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${carModel.listaDeCarros[index].quilometragemCarro}km',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    carModel.numberFormatter(
                                      carModel.listaDeCarros[index]
                                              .valorDoCarro ??
                                          0.0,
                                    ),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    carModel.listaDeCarros[index]
                                            .automaticoCarro
                                        ? 'Automático'
                                        : 'Manual',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: isFavorite
                                              ? const Color.fromARGB(
                                                  255, 161, 32, 23)
                                              : Colors.green,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (isFavorite) {
                                              carModel.listaFavoritos
                                                  .remove(car);
                                            } else {
                                              carModel.listaFavoritos.add(car);
                                            }
                                          });
                                        },
                                        child: isFavorite
                                            ? Text('Reservado')
                                            : Text('Reservar'),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditCarPage(
                                                  car: car,
                                                ),
                                              ),
                                            );
                                          });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
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
