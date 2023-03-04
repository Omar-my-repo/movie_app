import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/presentation/screens/details-screen/details_view.dart';
import 'package:route_movies_app/presentation/screens/home_layout/home_layout.dart';
import 'package:route_movies_app/data/data_sources/services/local/cash_helper.dart';
import 'package:route_movies_app/presentation/watch_list_provider/watch_list_provider.dart';
import 'package:route_movies_app/style/my_themedata.dart';
import 'data/models/watch_list.dart';

CasheHelper casheHelper = CasheHelper();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LocalMovieModelAdapter());
  await casheHelper.creatBoxDb();
  //await casheHelper.getAllDataFromLocal();
  //await casheHelper.clearBoxDb();
  //casheHelper.deleteItemFromLocal(0);
  //bool x=await casheHelper.checkMovieIsExist(50000);
  //debugPrint('$x');

  runApp(ChangeNotifierProvider<WatchListProvider>(
    create: (_) => WatchListProvider(),
    child: const MyApp()));
}
// added new branch
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
        }

  }

