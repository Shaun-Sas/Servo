import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/seconpage.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> vehicleDetailsList = [];
  late List<Widget> cards;

  TextEditingController _truckController = TextEditingController();
  TextEditingController _makerController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
  TextEditingController _yearController = TextEditingController();

  String _selectedVehicleType = 'Bike';
  String _selectedRiderType = 'Normal';

  @override
  void initState() {
    super.initState();
    cards = [
      _buildCard('Bike', 'Truck1', 'Maker1', 'Model1', '2022', 'Normal',
          Colors.orange),
      _buildCard(
          'Car', 'Truck2', 'Maker2', 'Model2', '2021', 'Average', Colors.blue),
    ];
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ListView(children: [
          AlertDialog(
            title: const Text(
              'Enter Vehicle Details',
              style: TextStyle(color: Colors.black),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Vehicle Type:',
                    style: TextStyle(color: Colors.black)),
                DropdownButton<String>(
                  value: _selectedVehicleType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedVehicleType = value!;
                    });
                  },
                  items: ['Bike', 'Car'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _truckController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Truck Value',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _makerController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Maker',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _modelController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Model',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _yearController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Year',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text('Type of Rider:',
                    style: TextStyle(color: Colors.black)),
                DropdownButton<String>(
                  value: _selectedRiderType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRiderType = value!;
                    });
                  },
                  items: ['Normal', 'Average', 'Heavy'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.red)),
              ),
              ElevatedButton(
                onPressed: () => hello(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ]);
      },
    );
  }

  void hello() {
    setState(() {
      // Add the entered text as a new Container to the cards list
      cards.add(
        _buildCard(
          _selectedVehicleType,
          _truckController.text,
          _makerController.text,
          _modelController.text,
          _yearController.text,
          _selectedRiderType,
          _getRandomColor(),
        ),
      );

      // Save entered details to the list
      vehicleDetailsList.add({
        'Vehicle Type': _selectedVehicleType,
        'Truck Value': _truckController.text,
        'Maker': _makerController.text,
        'Model': _modelController.text,
        'Year': _yearController.text,
        'Type of Rider': _selectedRiderType,
      });

      // Clear text controllers
      _truckController.clear();
      _makerController.clear();
      _modelController.clear();
      _yearController.clear();

      Navigator.pop(context);
    });
  }

  Color _getRandomColor() {
    // You can implement a logic to generate random colors
    // This is a simple example, and you may want to customize it.
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  void newPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),
    );
  }

  Widget _buildCard(
    String vehicleType,
    String truckValue,
    String maker,
    String model,
    String year,
    String riderType,
    Color color,
  ) {
    return Container(
      alignment: Alignment.center,
      color: color,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (vehicleType == "Bike")
            Image.asset("assets/bike.jpeg")
          else
            Image.asset("assets/car.jpeg"),
          Text('Vehicle Type: $vehicleType'),
          Text('Truck Value: $truckValue'),
          Text('Maker: $maker'),
          Text('Model: $model'),
          Text('Year: $year'),
          Text('Type of Rider: $riderType'),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle the first button action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Button 1',
                    style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () => newPage(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('Button 2',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Ink(
        decoration: const ShapeDecoration(
          color: Colors.amber,
          shape: CircleBorder(),
        ),
        child: IconButton(
          iconSize: 40,
          onPressed: () => _showAlertDialog(context),
          icon: const Icon(Icons.add),
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.black45,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.amber,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Virat Kohli",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        )),
                    Text("4 Cours Paul Eluard, 44985 Cambrai",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ))
                  ],
                ),
                const SizedBox(
                  width: 23,
                ),
                IconButton(onPressed: () => {}, icon: const Icon(Icons.menu))
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 450,
              width: 450,
              child: CardSwiper(
                numberOfCardsDisplayed: 1,
                cardsCount: cards.length,
                cardBuilder:
                    (context, index, percentThresholdX, percentThresholdY) =>
                        cards[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
