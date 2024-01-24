import 'package:flutter/cupertino.dart';

import '../screen/home/home_screen.dart';
import '../screen/quotes/quotes_screen.dart';
import '../screen/splash/splash_screen.dart';

Map<String,WidgetBuilder>app_routes=
{
  "/":(context) => SplashScreen(),
  "home":(context) => HomeScreen(),
  "quotes":(context) => QutoesScreen(),

};

