import 'package:flutter/material.dart';
import 'package:weather/domain/api_client.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/weather_page/weather_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Future<WeatherModel>? model;

  @override
  void initState() {
    super.initState();
    ApiClient().getWeather();
    model = ApiClient().getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder<WeatherModel>(
      future: model,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WeatherPage(
            model: snapshot.requireData,
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
