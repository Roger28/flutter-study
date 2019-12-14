import 'package:flutter/material.dart';
import 'package:rxdart_app/utils/colors.dart';
import 'package:rxdart_app/utils/cut_corner_border.dart';

import 'login.dart';

class MyHomeApp extends StatefulWidget {
  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Home',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _buildMyHomeTheme(),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }

  IconThemeData _customIconTheme(IconThemeData original) {
    return original.copyWith(color: brown900);
  }

  ThemeData _buildMyHomeTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      accentColor: brown900,
      primaryColor: brown100,
      scaffoldBackgroundColor: backgroundWhite,
      cardColor: backgroundWhite,
      textSelectionColor: brown50,
      errorColor: errorRed,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: brown100,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: base.iconTheme.copyWith(color: brown900),
      inputDecorationTheme: InputDecorationTheme(
        border: CutCornersBorder(),
      ),
      textTheme: _buildMyHomeTextTheme(base.textTheme),
      primaryTextTheme: _buildMyHomeTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildMyHomeTextTheme(base.accentTextTheme),
      iconTheme: _customIconTheme(base.iconTheme),
    );
  }

  TextTheme _buildMyHomeTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline: base.headline.copyWith(
            fontWeight: FontWeight.w500,
          ),
          title: base.title.copyWith(fontSize: 18.0),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          body2: base.body2.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: brown900,
          bodyColor: brown900,
        );
  }
}
