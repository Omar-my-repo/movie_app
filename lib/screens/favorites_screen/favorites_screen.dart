import 'package:flutter/material.dart';
import 'package:route_movies_app/base.dart';
import 'package:route_movies_app/screens/favorites_screen/favorites_navigator.dart';
import 'package:route_movies_app/screens/favorites_screen/favorites_vm.dart';

import 'favorite_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState
    extends BaseView<FavoritesScreen, FavoritesViewModel>
    implements FavoritesNavigator {
  @override
  FavoritesViewModel initViewModel() {
    return FavoritesViewModel();
  }

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WatchList',
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 26),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: ((context, index) => Divider(
                        thickness: 1,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                  itemBuilder: (context, index) {
                    return FavoriteItem();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
