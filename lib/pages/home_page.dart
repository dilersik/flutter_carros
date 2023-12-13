import 'package:carros/api/car_api.dart';
import 'package:carros/domain/car.dart';
import 'package:carros/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carros Home"),
      ),
      body: _body(),
      drawer: const DrawerList(),
    );
  }

  _body() {
    return FutureBuilder(
      future: CarApi.getCars(),
      builder: (BuildContext context, AsyncSnapshot<List<Car>> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error: ${snapshot.error}",
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Car>? cars = snapshot.data;
        return _listView(cars ?? List.empty());
      },
    );
  }

  _listView(List<Car> cars) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            Car car = cars[index];

            return Card(
              color: Colors.grey[200],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        car.photoUrl ?? "https://img.freepik.com/fotos-gratis/corridas-de-carros-esportivos-atraves-de-ia-generativa-de-movimento-borrado-escuro_188544-12490.jpg?size=626&ext=jpg&ga=GA1.1.1880011253.1699315200&semt=ais",
                        width: 250,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        car.name ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const Text(
                      "description...",
                      style: TextStyle(fontSize: 16),
                    ),
                    ButtonBarTheme(
                      data: const ButtonBarThemeData(
                        alignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        buttonPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        buttonHeight: 48.0,
                        buttonMinWidth: 64.0,
                      ),
                      child: ButtonBar(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('DETAILS'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('SHARE'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
