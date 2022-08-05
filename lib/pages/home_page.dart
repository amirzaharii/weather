import 'package:api/pages/weather_detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;

  bool _isCityNameEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() => _isCityNameEmpty = _controller.text.isEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text('Search Weather App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: const Icon(
                Icons.location_city,
                size: 100,
              ),
            ),
            const Text(
              'Please Enter City Name',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter City Name',
                  border: OutlineInputBorder(),
                  label: Text('City Name'),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: _isCityNameEmpty
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WeatherDetail(cityName: _controller.text),
                          ),
                        );
                      },
                child: const Text('Search')),
          ],
        ),
      ),
    );
  }
}
