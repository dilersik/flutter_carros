import 'package:carros/api/car_api.dart';
import 'package:carros/drawer_list.dart';
import 'package:carros/pages/car_listview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Cars"),
        bottom: const TabBar(tabs: [
          Tab(text: "Classic"),
          Tab(text: "Sport"),
          Tab(text: "Luxury"),
        ]),
      ),
      body: const TabBarView(
        children: [
          CarListView(type: CarType.classic),
          CarListView(type: CarType.sport),
          CarListView(type: CarType.lux),
        ],
      ),
      drawer: const DrawerList(),
    );
  }
}
