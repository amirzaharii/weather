import 'package:api/states/weather_cubit.dart';
import 'package:api/widgets/weather_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/weather_state.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({Key? key, required this.cityName}) : super(key: key);

  final String cityName;

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context)
      ..fetchWeather(cityName);
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: const Text('Weather Detail'),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const CircularProgressIndicator();
            }
            if (state is WeatherLoaded) {
              return WeatherInformation(weatherModel: state.weatherModel);
            }
            return Text(
                state is WeatherError ? state.errorMessage : 'Unknown Error');
          },
        ),
      ),
    );
  }
}
