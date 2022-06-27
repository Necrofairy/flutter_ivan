import 'package:flutter/material.dart';
import 'package:weather/utils/colors_rgb.dart';
import 'package:time/time.dart';

import '../../../models/weather_model.dart';
import '../../../utils/consts.dart';
import '../../../utils/text_styles.dart';

class WeatherNDaysWidget extends StatelessWidget {
  const WeatherNDaysWidget({Key? key, required this.daily}) : super(key: key);
  final List<Daily>? daily;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsRGB.green,
      child: ListView.builder(
          itemCount: daily?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: ColorsRGB.green,
                child: Column(
                  children: [
                    _temp(index),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: _weather(index),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _temp(int index) {
    String dayTime = '';
    String monthTime = '';
    int day = (DateTime.now() + index.days).day;
    int month = (DateTime.now() + index.days).month;
    month < 10 ? monthTime = '0$month' : monthTime = '$month';
    day < 10 ? dayTime = '0$day' : dayTime = '$day';
    String dataTime = '$dayTime.$monthTime';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '$dataTime',
          style: TextStyles.smallText,
        ),
        Text(
          'Day: ${(daily![index].temp!.day! - Consts.differentTemp).round()}°',
          style: TextStyles.smallText,
        ),
        Text(
          'Eve: ${(daily![index].temp!.eve! - Consts.differentTemp).round()}°',
          style: TextStyles.smallText,
        ),
        Text(
          'Night: ${(daily![index].temp!.night! - Consts.differentTemp).round()}°',
          style: TextStyles.smallText,
        ),
      ],
    );
  }

  Widget _weather(int index) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        const Text(
          'Clouds:',
          style: TextStyles.smallText,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '${daily![index].clouds}%',
          style: TextStyles.smallText,
        ),
        const Expanded(child: SizedBox()),
        const Text(
          'Humidity:',
          style: TextStyles.smallText,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '${daily![index].humidity}%',
          style: TextStyles.smallText,
        ),
        const Expanded(child: SizedBox()),
        const Text(
          'Wind speed:',
          style: TextStyles.smallText,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '${daily![index].windSpeed}',
          style: TextStyles.smallText,
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
