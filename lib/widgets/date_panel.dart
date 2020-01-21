import 'package:flutter/material.dart';

import '../utils.dart';

class NeovoDatePanel extends StatelessWidget {
  final NeovoDateTime _dateTime;
  final NeovoDimensions _dimensions;
  final NeovoTheme _theme;

  NeovoDatePanel(this._dateTime, this._dimensions, this._theme);

  double get fontSize => _dimensions.fontSize;

  Color get highlightColor => _theme.colors[NeovoThemeElement.highlight];

  double get padding => NeovoDimensions.padding;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  _dateTime.date,
                  style: _theme.textStyleSized(fontSize * 0.4),
                ),
                Text(
                  _dateTime.month.toUpperCase(),
                  style: _theme.textStyleSizedBold(fontSize * 0.2),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            color: _theme.colors[NeovoThemeElement.highlight],
            height: fontSize * 0.9,
            width: fontSize * 0.9,
          ),
          SizedBox(width: padding),
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  _dateTime.weekday,
                  style: _theme.textStyleSized(fontSize * 0.2),
                ),
                color: highlightColor,
                padding: EdgeInsets.all(padding * 0.25),
              ),
              SizedBox(height: padding * 0.5),
              Container(
                child: Text(
                  _dateTime.year,
                  style: _theme.textStyleSizedBold(fontSize * 0.4),
                ),
                color: highlightColor,
                padding: EdgeInsets.all(padding * 0.25),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      );
}
