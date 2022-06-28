import 'package:flutter/material.dart';
import 'package:time/time.dart';
import 'package:weather/utils/colors_rgb.dart';

import '../../../models/weather_model.dart';
import '../../../utils/consts.dart';
import '../../../utils/images_name.dart';
import '../../../utils/text_styles.dart';

class WeatherDayWidget extends StatelessWidget {
  const WeatherDayWidget({Key? key, required this.daily, required this.index})
      : super(key: key);
  final Daily? daily;
  final int index;

  @override
  Widget build(BuildContext context) {
    AssetImage? image = _choiceImage(daily?.weather?[0].main);
    return Container(
      decoration: image != null ? BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.fill)) : null,
      color: image == null? ColorsRGB.green: null,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white24,
          child: Column(
            children: [
              _cityName(),
              _dayTime(),
              _temp(),
              _weather(),
              _clouds(),
              _humidity(),
              _windSpeed(),
              _pop()
            ],
          ),
        ),
      ),
    );
  }

  AssetImage? _choiceImage(String? weather) {
    AssetImage? image;
    switch (weather) {
      case 'Clouds':
        image = const AssetImage(ImagesName.clouds);
        break;
      case 'Rain':
        image = const AssetImage(ImagesName.rain);
        break;
      case 'Clear':
        image = const AssetImage(ImagesName.clear);
        break;
    }
    return image;
  }

  Widget _temp() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Day: ${(daily!.temp!.day! - Consts.differentTemp).round()}°',
            style: TextStyles.bigText,
          ),
          const Spacer(),
          Text(
            'Eve: ${(daily!.temp!.eve! - Consts.differentTemp).round()}°',
            style: TextStyles.bigText,
          ),
          const Spacer(),
          Text(
            'Night: ${(daily!.temp!.night! - Consts.differentTemp).round()}°',
            style: TextStyles.bigText,
          ),
        ],
      ),
    );
  }

  Widget _dayTime() {
    int month = (DateTime.now() + index.days).month;
    String monthStr = '';
    if (month < 10) {
      monthStr = '0$month';
    } else {
      monthStr = '$month';
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '${(DateTime.now() + index.days).day}.$monthStr',
        style: TextStyles.bigText,
      ),
    );
  }

  Widget _cityName() {
    return const Padding(
      padding: EdgeInsets.only(top: 24.0, left: 24, right: 24),
      child: Text(
        'Kropyvnytskyi',
        style: TextStyles.largeBoldText,
      ),
    );
  }

  Widget _clouds() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          const Text(
            'Clouds:',
            style: TextStyles.bigBoldText,
          ),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.arrow_forward,
            size: 32,
          ),
          Text(
            '${daily?.clouds}%',
            style: TextStyles.bigText,
          ),
        ],
      ),
    );
  }

  Widget _humidity() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          const Text(
            'Humidity:',
            style: TextStyles.bigBoldText,
          ),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.arrow_forward,
            size: 32,
          ),
          Text(
            '${daily?.humidity}%',
            style: TextStyles.bigText,
          ),
        ],
      ),
    );
  }

  Widget _windSpeed() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          const Text(
            'Wind speed:',
            style: TextStyles.bigBoldText,
          ),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.arrow_forward,
            size: 32,
          ),
          Text(
            '${daily?.windSpeed}',
            style: TextStyles.bigText,
          ),
        ],
      ),
    );
  }

  Widget _weather() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '${daily?.weather?[0].main}',
        style: TextStyles.bigText,
      ),
    );
  }

  Widget _pop() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          const Text(
            'Precipitation:',
            style: TextStyles.bigBoldText,
          ),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.arrow_forward,
            size: 32,
          ),
          Text(
            '${(daily!.pop! * 100).round()}%',
            style: TextStyles.bigText,
          ),
        ],
      ),
    );
  }
}
