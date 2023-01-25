import 'package:flutter/material.dart';
import 'package:route_movies_app/screens/details-screen/details_view.dart';
import 'package:route_movies_app/screens/home_layout/home_layout.dart';
import 'package:route_movies_app/style/my_themedata.dart';

void main() {
  runApp(const MyApp());
}
// added new branch
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //edited by omar

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (_) => HomeLayout(),
        //DetailsScreen.routeName:(_) =>  DetailsScreen()
      },
      theme: MyThemeData.darkTheme,
    );
  }
}
