import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

import '../utils.dart';

final Map<WeatherCondition, Color> _weatherColors = <WeatherCondition, Color>{
  WeatherCondition.cloudy: NeovoColor.styleBlue,
  WeatherCondition.foggy: NeovoColor.styleBlue,
  WeatherCondition.rainy: NeovoColor.styleBlue,
  WeatherCondition.snowy: NeovoColor.styleBlue,
  WeatherCondition.sunny: NeovoColor.flameOrange,
  WeatherCondition.thunderstorm: NeovoColor.mediumGray,
  WeatherCondition.windy: NeovoColor.styleBlue,
};
final Map<WeatherCondition, IconData> _weatherIcons =
    <WeatherCondition, IconData>{
  WeatherCondition.cloudy: Icons.wb_cloudy,
  WeatherCondition.foggy: Icons.cloud_circle,
  WeatherCondition.rainy: Icons.beach_access,
  WeatherCondition.snowy: Icons.ac_unit,
  WeatherCondition.sunny: Icons.wb_sunny,
  WeatherCondition.thunderstorm: Icons.cloud_off,
  WeatherCondition.windy: Icons.gesture,
};

class NeovoInfoPanel extends StatelessWidget {
  final NeovoDimensions _dimensions;
  final ClockModel _model;
  final NeovoTheme _theme;

  NeovoInfoPanel(this._model, this._dimensions, this._theme);

  double get fontSize => _dimensions.fontSize;

  Color get highlightColor => _theme.colors[NeovoThemeElement.highlight];

  double get padding => NeovoDimensions.padding;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: <Widget>[
              Icon(
                _weatherIcons[_model.weatherCondition],
                color: _weatherColors[_model.weatherCondition],
                size: fontSize,
              ),
              SizedBox(width: padding),
              Text(
                _model.weatherString,
                style: TextStyle(
                  color: _weatherColors[_model.weatherCondition],
                  fontSize: fontSize * 0.25,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.pin_drop,
                color: NeovoColor.styleBlue,
                size: fontSize * 0.2,
              ),
              SizedBox(width: padding / 2),
              Text(
                _model.location,
                style: TextStyle(
                  color: NeovoColor.styleBlue,
                  fontSize: fontSize * 0.2,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(height: padding * 2),
          Row(
            children: <Widget>[
              Container(
                child: Center(
                  child: Text(
                    _model.temperatureString,
                    style: _theme.textStyleSized(fontSize * 0.4),
                  ),
                ),
                color: _theme.colors[NeovoThemeElement.highlight],
                height: fontSize * 0.8,
                width: fontSize * 1.6,
              ),
              Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'HI',
                          style: _theme.textStyleSizedBold(fontSize * 0.15),
                        ),
                        Text(
                          _model.high.toInt().toString(),
                          style: _theme.textStyleSizedBold(fontSize * 0.25),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                    color: NeovoColor.flameOrange,
                    height: fontSize * 0.4,
                    padding: EdgeInsets.all(padding * 0.25),
                    width: fontSize * 0.8,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'LO',
                          style: _theme.textStyleSizedBold(fontSize * 0.15),
                        ),
                        Text(
                          _model.low.toInt().toString(),
                          style: _theme.textStyleSized(fontSize * 0.25),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                    color: NeovoColor.styleBlue,
                    height: fontSize * 0.4,
                    padding: EdgeInsets.all(padding * 0.25),
                    width: fontSize * 0.8,
                  ),
                ],
              ),
            ],
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      );
}
