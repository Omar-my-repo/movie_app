import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
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
  //casheHelper.deleteItemFromLocal(0);
  await casheHelper.getAllDataFromLocal();
  //bool x=await casheHelper.checkMovieIsExist(50000);
  //debugPrint('$x');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CasheHelper>(
        create: (_) => CasheHelper()..getAllDataFromLocal(),
        child: Consumer<CasheHelper>(
          builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: HomeLayout.routeName,
            routes: {
              HomeLayout.routeName: (_) => HomeLayout(),
              DetailsScreen.routeName: (_) => DetailsScreen(movieId: '')
            },
            theme: MyThemeData.darkTheme,
          );
        }));
  }
}
