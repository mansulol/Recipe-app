import 'package:flutter/material.dart';

class AppConstants {
  static const Color primaryColor =  Color.fromRGBO(41, 134, 71, 1);
  static const String primaryFont = 'Georgia';
  static const double fontSizeTitleApp = 32;
  static const double fontSizeTitle = 24;
  static const double fontSizeSubTitle = 16;
  static const double fontSizeBodyBig = 14;
  static const double fontSizeBodySmall = 12;
  static const double fontSizeBodyTiny = 10;
}

class AppColors {
  static const Color primaryColor = AppConstants.primaryColor;
  static const Color gray10 = Color.fromRGBO(183, 183, 183, 1);
  static const Color gray20 = Color.fromRGBO(238, 238, 238, 1);
  static const Color gray30 = Color.fromRGBO(227, 227, 227, .75);
}

class AppFonts {
  static const String primaryFont = AppConstants.primaryFont;
}

class AppTextStyles {
  static const TextStyle titleApp = TextStyle(
    fontSize: AppConstants.fontSizeTitleApp,
    fontFamily: AppConstants.primaryFont,
  );

  static const TextStyle title = TextStyle(
    fontSize: AppConstants.fontSizeTitle,
    fontFamily: AppConstants.primaryFont,
  );

  static const TextStyle subTitle = TextStyle(
    fontSize: AppConstants.fontSizeSubTitle,
    fontFamily: AppConstants.primaryFont,
  );

  static const TextStyle bodyBig = TextStyle(
    fontSize: AppConstants.fontSizeBodyBig,
    fontFamily: AppConstants.primaryFont,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: AppConstants.fontSizeBodySmall,
    fontFamily: AppConstants.primaryFont,
  );

  static const TextStyle bodyTiny = TextStyle(
    fontSize: AppConstants.fontSizeBodyTiny,
    fontFamily: AppConstants.primaryFont,
  );
}