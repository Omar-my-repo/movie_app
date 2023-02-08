import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/provider/favorites_provider.dart';
import 'package:route_movies_app/screens/details-screen/details_view.dart';
import 'package:route_movies_app/screens/home_layout/home_layout.dart';
import 'package:route_movies_app/services/local/cash_helper.dart';
import 'package:route_movies_app/style/my_themedata.dart';

import 'models/watch_list.dart';

CasheHelper casheHelper = CasheHelper();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LocalMovieModelAdapter());
  await casheHelper.creatBoxDb();

  runApp(ChangeNotifierProvider<FavoritesProvider>(
    create: (_) => FavoritesProvider(),
    child: MyApp(),
  ));
}

// added new branch
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (_) => HomeLayout(),
        DetailsScreen.routeName: (_) => DetailsScreen()
      },
      theme: MyThemeData.darkTheme,
    );

    //edited by omar
  }
}
