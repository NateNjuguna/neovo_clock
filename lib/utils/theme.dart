import 'package:flutter/material.dart';

import 'color.dart';

enum NeovoThemeElement {
  background,
  highlight,
  text,
}

class NeovoTheme {
  final Map<NeovoThemeElement, Color> colors;

  NeovoTheme(Brightness brightness)
      : colors = brightness == Brightness.light
            ? NeovoColor.lightColors
            : NeovoColor.darkColors;

  TextStyle textStyleSized(double size) => TextStyle(
        color: colors[NeovoThemeElement.text],
        fontFamily: 'Raleway',
        fontSize: size,
      );

  TextStyle textStyleSizedBold(double size) => TextStyle(
        color: colors[NeovoThemeElement.text],
        fontFamily: 'Raleway',
        fontSize: size,
        fontWeight: FontWeight.bold,
      );
}
