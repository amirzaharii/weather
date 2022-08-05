import 'package:api/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({Key? key, required this.weatherModel})
      : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      color: Colors.blue[200],
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text('${weatherModel.name}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'http://openweathermap.org/img/w/${weatherModel.weather.first.icon}.png',
                height: 50,
                width: 50,
              ),
              Text('${weatherModel.weather.first.description}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${weatherModel.main.temp}°C',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            'Min: ${weatherModel.main.tempMin}°C        Max: ${weatherModel.main.tempMax}°C',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Pressure: ${weatherModel.main.pressure} Hg',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Humidity: ${weatherModel.main.humidity} g.kg-1',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
