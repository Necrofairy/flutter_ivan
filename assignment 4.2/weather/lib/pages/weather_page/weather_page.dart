import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/weather_page/widgets/weather_day_widget.dart';
import 'package:weather/pages/weather_page/widgets/weather_n_days_widget.dart';
import 'package:weather/utils/colors_rgb.dart';

import '../../utils/consts.dart';

class WeatherPage extends StatelessWidget {
  final WeatherModel model;

  const WeatherPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
                indicatorColor: Colors.white,
                tabs: [
              Tab(
                text: Consts.today,
              ),
              Tab(
                text: Consts.tomorrow,
              ),
              Tab(
                text: Consts.daysN,
              ),
            ]),
            title: const Text('Weather'),
            centerTitle: true,
            backgroundColor: ColorsRGB.black,
          ),
          body: TabBarView(
            children: [
              WeatherDayWidget(daily: model.daily?[0], index: 0,),
              WeatherDayWidget(daily: model.daily?[1],  index: 1,),
              WeatherNDaysWidget(
                daily: model.daily,
              ),
            ], 
          ),
        ));
  }
}
