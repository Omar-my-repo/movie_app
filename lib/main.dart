import 'package:flutter/material.dart';
import 'package:route_movies_app/screens/home_layout/home_layout.dart';
import 'package:route_movies_app/style/my_themedata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (_) => HomeLayout(),
      },
      theme: MyThemeData.darkTheme,
    );
  }
}
