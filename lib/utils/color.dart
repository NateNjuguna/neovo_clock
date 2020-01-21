import 'package:flutter/material.dart';

import 'theme.dart';

class NeovoColor {
  static final envyGreen = Color.fromRGBO(106, 191, 74, 1);
  static final lenovoRed = Color.fromRGBO(226, 35, 26, 1);
  static final flameOrange = Color.fromRGBO(255, 106, 0, 1);
  static final mediumGray = Color.fromRGBO(196, 190, 182, 1);
  static final peonyPink = Color.fromRGBO(233, 107, 175, 1);
  static final saphireBlue = Color.fromRGBO(62, 141, 221, 1);
  static final styleBlue = Color.fromRGBO(74, 192, 224, 1);

  static final Map<NeovoThemeElement, Color> lightColors = {
    NeovoThemeElement.background: Colors.white,
    NeovoThemeElement.highlight: lenovoRed,
    NeovoThemeElement.text: Colors.white,
  };

  static final Map<NeovoThemeElement, Color> darkColors = {
    NeovoThemeElement.background: Colors.black,
    NeovoThemeElement.highlight: lenovoRed,
    NeovoThemeElement.text: Colors.white,
  };
}
