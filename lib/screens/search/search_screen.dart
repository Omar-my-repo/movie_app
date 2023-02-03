import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/base.dart';
import 'package:route_movies_app/screens/search/movie_card.dart';
import 'package:route_movies_app/screens/search/search_vm.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseView<SearchScreen, SearchViewModel> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SizedBox(height: 40),
              TextFormField(
                onChanged: (value) {
                  viewModel.searchMovieByName(value);
                },
                cursorColor: Theme.of(context).colorScheme.onPrimary,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(letterSpacing: 2, fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: Theme.of(context).textTheme.subtitle2,
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.white,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.white,
                      )),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.white,
                      )),
                ),
              ),
              SizedBox(height: 20),
              Consumer<SearchViewModel>(
                builder: (_, searchViewModel, child) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: searchViewModel.filterdMovies.length,
                      separatorBuilder: (context, index) => Divider(
                        thickness: 1,
                        height: 30,
                        color: Colors.white30,
                      ),
                      itemBuilder: (context, index) {
                        return MovieCard(searchViewModel.filterdMovies[index]);
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  SearchViewModel initViewModel() {
    return SearchViewModel();
  }
}
